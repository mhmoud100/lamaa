import { Inject, UseGuards } from '@nestjs/common';
import { Args, CONTEXT, Mutation, Resolver } from '@nestjs/graphql';
import { UserContext } from '../auth/authenticated-user';
import { GqlAuthGuard } from '../auth/jwt-gql-auth.guard';
import { OrderDTO } from '../order/dto/order.dto';
import { CouponService } from './coupon.service';

@Resolver(() => OrderDTO)
@UseGuards(GqlAuthGuard)
export class CouponResolver {
  constructor(
    private couponService: CouponService,
    @Inject(CONTEXT)
    private context: UserContext
  ) {}

  @Mutation(() => OrderDTO)
  async applyCoupon(
    @Args('code', { type: () => String }) code: string
  ): Promise<OrderDTO> {
    return this.couponService.applyCoupon(code, this.context.req.user.id);
  }
}
