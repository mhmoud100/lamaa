import { InjectPubSub } from "@nestjs-query/query-graphql";
import { Injectable } from "@nestjs/common";
import { InjectRepository } from "@nestjs/typeorm";
import { DriverDeductTransactionType } from "@ridy/database/enums/driver-deduct-transaction-type.enum";
import { DriverStatus } from "@ridy/database/enums/driver-status.enum";
import { OrderStatus } from "@ridy/database/enums/order-status.enum";
import { ProviderRechargeTransactionType } from "@ridy/database/enums/provider-recharge-transaction-type.enum";
import { RiderDeductTransactionType } from "@ridy/database/enums/rider-deduct-transaction-type.enum";
import { TransactionAction } from "@ridy/database/enums/transaction-action.enum";
import { TransactionStatus } from "@ridy/database/enums/transaction-status.enum";
import { RequestEntity } from "@ridy/database/request.entity";
import { SharedDriverService } from "@ridy/order/shared-driver.service";
import { SharedProviderService } from "@ridy/order/shared-provider.service";
import { SharedRiderService } from "@ridy/order/shared-rider.service";
import { RedisPubSub } from "graphql-redis-subscriptions";
import { In, Repository } from "typeorm";
import { OrderRedisService } from "@ridy/redis/order-redis.service";
import { FeedbackEntity } from "@ridy/database/feedback.entity";
import { SubmitFeedbackInput } from "./dto/submit-feedback.input";
import { RequestActivityEntity } from "@ridy/database/request-activity.entity";
import { RequestActivityType } from "@ridy/database/enums/request-activity-type.enum";

@Injectable()
export class RiderOrderService {
    constructor(
        @InjectRepository(RequestEntity)
        private orderRepository: Repository<RequestEntity>,
        @InjectRepository(RequestActivityEntity)
        private activityRepository: Repository<RequestActivityEntity>,
        @InjectRepository(FeedbackEntity)
        private feedbackRepository: Repository<FeedbackEntity>,
        private riderService: SharedRiderService,
        private driverService: SharedDriverService,
        private orderRedisService: OrderRedisService,
        private providerService: SharedProviderService,
        @InjectPubSub()
        private pubSub: RedisPubSub,
    ) { }

    async getCurrentOrder(riderId: number, relations: string[] = []) {
        return this.orderRepository.findOne({
            where: {
                riderId, status: In([
                    OrderStatus.Requested,
                    OrderStatus.Booked,
                    OrderStatus.Found,
                    OrderStatus.NotFound,
                    OrderStatus.NoCloseFound,
                    OrderStatus.DriverAccepted,
                    OrderStatus.Arrived,
                    OrderStatus.Started,
                    OrderStatus.WaitingForReview,
                    OrderStatus.WaitingForPostPay,
                ])
            }, order: { id: 'DESC' }, relations
        });
    }

    async getLastOrder(riderId: number, relations: string[] = []) {
        return this.orderRepository.findOne({ where: { riderId }, order: { id: 'DESC' }, relations });
    }

    async cancelOrder(riderId: number): Promise<RequestEntity> {
        let order = await this.getCurrentOrder(riderId);
        await this.orderRepository.update(order.id, { status: OrderStatus.RiderCanceled, finishTimestamp: new Date(), costAfterCoupon: 0 });
        order = await this.orderRepository.findOne(order.id, {relations: ['service', 'driver']});
        if (order.driverId != null && order.service.cancellationTotalFee > 0) {
            await Promise.all([
                this.riderService.rechargeWallet({
                    action: TransactionAction.Deduct,
                    deductType: RiderDeductTransactionType.OrderFee,
                    amount: -order.service.cancellationTotalFee,
                    currency: order.currency,
                    riderId: riderId,
                    status: TransactionStatus.Done
                }),
                this.driverService.rechargeWallet({
                    action: TransactionAction.Recharge,
                    deductType: DriverDeductTransactionType.Commission,
                    amount: order.service.cancellationDriverShare,
                    currency: order.currency,
                    driverId: order.driverId,
                    status: TransactionStatus.Done
                }),
                this.providerService.rechargeWallet({
                    action: TransactionAction.Recharge,
                    rechargeType: ProviderRechargeTransactionType.Commission,
                    amount: order.service.cancellationTotalFee - order.service.cancellationDriverShare,
                    currency: order.currency
                })
            ]);   
        }
        if(order.driverId == null) {
            this.pubSub.publish('orderRemoved', { orderRemoved: order });
            this.orderRedisService.expire([order.id]);
        } else {
            await this.driverService.updateDriverStatus(order.driverId, DriverStatus.Online);
            this.pubSub.publish('orderUpdated', { orderUpdated: order });
        }
        this.activityRepository.insert({
            requestId: order.id,
            type: RequestActivityType.CanceledByRider
        });
        return order;
    }

    async submitReview(riderId: number, review: SubmitFeedbackInput): Promise<RequestEntity> {
        let order = await this.getCurrentOrder(riderId);
        review.requestId = order.id;
        this.feedbackRepository.save({
            ...review,
            driverId: order.driverId,
        });
        this.orderRepository.update(order.id, { status: OrderStatus.Finished });
        order = await this.orderRepository.findOne(order.id);
        this.activityRepository.insert({
            requestId: order.id,
            type: RequestActivityType.Reviewed
        });
        
        return order;
    }
}