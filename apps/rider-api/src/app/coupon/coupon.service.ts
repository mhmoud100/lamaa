import { Injectable } from "@nestjs/common";
import { InjectRepository } from "@nestjs/typeorm";
import { CouponEntity } from "@ridy/database/coupon.entity";
import { RequestEntity } from "@ridy/database/request.entity";
import { ForbiddenError } from "apollo-server-core";
import { count } from "console";
import { Repository } from "typeorm";
import { OrderDTO } from "../order/dto/order.dto";
import { RiderOrderService } from "../order/rider-order.service";

@Injectable()
export class CouponService {
    constructor(
        @InjectRepository(CouponEntity)
        private couponRepo: Repository<CouponEntity>,
        @InjectRepository(RequestEntity)
        private requestRepo: Repository<RequestEntity>,
        private orderService: RiderOrderService
    ) {}

    async applyCoupon(code: string, riderId: number): Promise<OrderDTO> {
        const coupon = await this.couponRepo.findOne({ code });
        if(coupon == null) {
            throw new ForbiddenError('Incorrect code.');
        }
        if(coupon.expireAt < new Date()) {
            throw new ForbiddenError('Coupon expired');
        }
        const requestsWithCoupon = await this.requestRepo.count({ where: { riderId, couponId: coupon.id } });
        if(requestsWithCoupon >= coupon.manyTimesUserCanUse) {
            throw new ForbiddenError('Coupon already used.');
        }
        if(!coupon.isEnabled) {
            throw new ForbiddenError('Coupon is disabled.');
        }
        const timesCouponUsed = await this.requestRepo.count({couponId: coupon.id });
        if(timesCouponUsed >= await coupon.manyUsersCanUse) {
            throw new ForbiddenError('Coupon usage limit exceeded.');
        }
        let request = await this.orderService.getCurrentOrder(riderId, []);
        const finalCost = (request.costBest * ((100 - coupon.discountPercent) / 100)) - coupon.discountFlat;
        await this.requestRepo.update(request.id, { couponId: coupon.id, costAfterCoupon: finalCost });
        request = await this.requestRepo.findOne(request.id);
        return request;
    }
}