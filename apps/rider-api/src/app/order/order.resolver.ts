import { Inject, UseGuards } from '@nestjs/common';
import { Args, CONTEXT, Mutation, Query, Resolver } from '@nestjs/graphql';
import { Point } from '@ridy/database';
import { RequestEntity } from '@ridy/database/request.entity';
import { SharedOrderService } from '@ridy/order/shared-order.service';
import { DriverRedisService } from '@ridy/redis/driver-redis.service';
import { UserContext } from '../auth/authenticated-user';
import { GqlAuthGuard } from '../auth/jwt-gql-auth.guard';
import { CalculateFareDTO } from './dto/calculate-fare.dto';
import { CalculateFareInput } from './dto/calculate-fare.input';
import { CreateOrderInput } from './dto/create-order.input';
import { CurrentOrder } from './dto/current-order.dto';
import { OrderDTO } from './dto/order.dto';
import { SubmitFeedbackInput } from './dto/submit-feedback.input';
import { RiderOrderService } from './rider-order.service';


@Resolver(() => OrderDTO)
export class OrderResolver {
  constructor(
    @Inject(CONTEXT) private context: UserContext,
    private orderService: SharedOrderService,
    private riderOrderService: RiderOrderService,
    private driverRedisService: DriverRedisService
  ) {}

  @Query(() => OrderDTO)
  @UseGuards(GqlAuthGuard)
  async currentOrder(): Promise<OrderDTO> {
    return this.riderOrderService.getCurrentOrder(this.context.req.user.id, ['driver', 'driver.carColor', 'driver.car', 'conversation']);
  }

  @Query(() => CurrentOrder)
  @UseGuards(GqlAuthGuard)
  async currentOrderWithLocation(): Promise<CurrentOrder> {
    const order = await this.riderOrderService.getCurrentOrder(this.context.req.user.id, ['driver', 'driver.carColor', 'driver.car']);
    let driverLocation;
    if(order?.driver != null) {
      driverLocation = this.driverRedisService.getDriverCoordinate(order.driver.id);
    }
    return { order, driverLocation };
  }

  @Mutation(() => CalculateFareDTO)
  @UseGuards(GqlAuthGuard)
  async calculateFare(
    @Args('input', { type: () => CalculateFareInput }) input: CalculateFareInput
  ): Promise<CalculateFareDTO> {
    return this.orderService.calculateFare(input);
  }

  @Mutation(() => OrderDTO)
  @UseGuards(GqlAuthGuard)
  async createOrder(
    @Args('input', { type: () => CreateOrderInput }) input: CreateOrderInput
  ): Promise<OrderDTO> {
    return this.orderService.createOrder({
      ...input,
      riderId: this.context.req.user.id,
    });
  }

  @Mutation(() => OrderDTO)
  @UseGuards(GqlAuthGuard)
  async cancelOrder(): Promise<OrderDTO> {
    return this.riderOrderService.cancelOrder(this.context.req.user.id);
  }

  @Query(() => [Point])
  async getDriversLocation(@Args('center', { type: () => Point, nullable: true }) center?: Point): Promise<Point[]> {
    if(center == null) return [];
    return this.driverRedisService.getCloseWithoutIds(center, 1000);
  }

  @Mutation(() => OrderDTO)
  @UseGuards(GqlAuthGuard)
  async submitReview(@Args('review', { type: () => SubmitFeedbackInput }) review: SubmitFeedbackInput): Promise<RequestEntity> {
    return this.riderOrderService.submitReview(this.context.req.user.id, review);
  }
}
