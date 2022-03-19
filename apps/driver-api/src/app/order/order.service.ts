import { InjectPubSub } from '@nestjs-query/query-graphql';
import { Injectable, Logger } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { DriverDeductTransactionType } from '@ridy/database/enums/driver-deduct-transaction-type.enum';
import { DriverRechargeTransactionType } from '@ridy/database/enums/driver-recharge-transaction-type.enum';
import { DriverStatus } from '@ridy/database/enums/driver-status.enum';
import { OrderStatus } from '@ridy/database/enums/order-status.enum';
import { ProviderRechargeTransactionType } from '@ridy/database/enums/provider-recharge-transaction-type.enum';
import { RequestActivityType } from '@ridy/database/enums/request-activity-type.enum';
import { RiderDeductTransactionType } from '@ridy/database/enums/rider-deduct-transaction-type.enum';
import { ServicePaymentMethod } from '@ridy/database/enums/service-payment-method.enum';
import { TransactionAction } from '@ridy/database/enums/transaction-action.enum';
import { TransactionStatus } from '@ridy/database/enums/transaction-status.enum';
import { RequestActivityEntity } from '@ridy/database/request-activity.entity';
import { RequestEntity } from '@ridy/database/request.entity';
import { SharedDriverService } from '@ridy/order/shared-driver.service';
import { SharedFleetService } from '@ridy/order/shared-fleet.service';
import { SharedProviderService } from '@ridy/order/shared-provider.service';
import { SharedRiderService } from '@ridy/order/shared-rider.service';
import { OrderRedisService } from '@ridy/redis/order-redis.service';
import { ForbiddenError } from 'apollo-server-core';
import { RedisPubSub } from 'graphql-redis-subscriptions';
import { Repository } from 'typeorm';

@Injectable()
export class OrderService {
    constructor(
        @InjectRepository(RequestEntity)
        public orderRepository: Repository<RequestEntity>,
        @InjectRepository(RequestActivityEntity)
        public activityRepository: Repository<RequestActivityEntity>,
        private driverService: SharedDriverService,
        private riderService: SharedRiderService,
        private sharedProviderService: SharedProviderService,
        private sharedFleetService: SharedFleetService,
        private orderRedisService: OrderRedisService,
        @InjectPubSub()
        private pubSub: RedisPubSub,
    ) { }

    async cancelOrder(orderId: number): Promise<RequestEntity> {
        let order = await this.orderRepository.findOne(orderId);
        const allowedStatuses = [OrderStatus.DriverAccepted, OrderStatus.Arrived];
        if (order == null || !allowedStatuses.includes(order.status)) {
            throw new ForbiddenError("It is not allowed to cancel this order");
        }
        await this.orderRepository.update(order.id, { status: OrderStatus.DriverCanceled, finishTimestamp: new Date(), costAfterCoupon: 0 });
        order = await this.orderRepository.findOne(order.id);
        this.driverService.updateDriverStatus(order.driverId, DriverStatus.Online);
        this.pubSub.publish('orderUpdated', { orderUpdated: order });
        return order;
    }

    async finish(orderId: number, cashAmount = 0.0) {
        const order = await this.orderRepository.findOne(orderId, { relations: ['service', 'driver', 'driver.fleet'] });
        if (order.service.paymentMethod == ServicePaymentMethod.OnlyCredit && cashAmount > 0) {
            throw new ForbiddenError('Cash payment is not available for this service.');
        }
        const riderCredit = await this.riderService.getRiderCreditInCurrency(order.riderId, order.currency);
        const commission = ((order.service.providerSharePercent) * order.costAfterCoupon / 100) + order.service.providerShareFlat;
        const unPaidAmount = order.costAfterCoupon - order.paidAmount;
        if ((riderCredit + cashAmount) < unPaidAmount) {
            return;
            //throw new ForbiddenError('Sum of rider\'s credit and cash payment are not enough to finish the service');
        }
        Logger.log(`Recharging driver wallet with ${-1 * commission}`);
        await this.driverService.rechargeWallet({
            status: TransactionStatus.Done,
            driverId: order.driverId,
            currency: order.currency,
            action: TransactionAction.Deduct,
            deductType: DriverDeductTransactionType.Commission,
            amount: -1 * commission,
            requestId: order.id
        });
        let fleetShare = 0;
        if (order.driver.fleetId != null) {
            Logger.log(`Recharging fleet wallet with ${fleetShare}`);
            fleetShare = (commission * order.driver.fleet.commissionSharePercent / 100) + order.driver.fleet.commissionShareFlat;
            if (fleetShare > 0) {
                this.sharedFleetService.rechargeWallet({
                    fleetId: order.driver.fleetId,
                    action: TransactionAction.Recharge,
                    rechargeType: ProviderRechargeTransactionType.Commission,
                    amount: fleetShare,
                    currency: order.currency
                })
            }
        }
        let adminShare = commission - fleetShare;
        Logger.log(`Recharging admin wallet with ${adminShare}`);
        await this.sharedProviderService.rechargeWallet({
            action: TransactionAction.Recharge,
            rechargeType: ProviderRechargeTransactionType.Commission,
            currency: order.currency,
            amount: commission - fleetShare
        });
        if (order.costAfterCoupon - cashAmount > 0) {
            Logger.log(`Recharging driver wallet with ${(order.costAfterCoupon - cashAmount)}`);
            await this.driverService.rechargeWallet({
                status: TransactionStatus.Done,
                driverId: order.driverId,
                currency: order.currency,
                action: TransactionAction.Recharge,
                rechargeType: DriverRechargeTransactionType.OrderFee,
                amount: (order.costAfterCoupon - cashAmount)
            });
        }
        if (riderCredit > 0 && cashAmount < unPaidAmount) {
            Logger.log(`Recharging rider wallet with ${-1 * (unPaidAmount - cashAmount)}`);
            await this.riderService.rechargeWallet({
                status: TransactionStatus.Done,
                action: TransactionAction.Deduct,
                deductType: RiderDeductTransactionType.OrderFee,
                currency: order.currency,
                amount: -1 * (unPaidAmount - cashAmount),
                riderId: order.riderId
            });
        }
        await this.orderRepository.update(order.id, { paidAmount: order.costAfterCoupon });
    }

    async expireOrders(orderIds: number[]) {
        this.orderRedisService.expire(orderIds);
        this.orderRepository.update(orderIds, { status: OrderStatus.Expired });
        for(const requestId of orderIds) {
            this.activityRepository.insert({
                requestId,
                type: RequestActivityType.Expired
            });
        }
        
        
    }
}