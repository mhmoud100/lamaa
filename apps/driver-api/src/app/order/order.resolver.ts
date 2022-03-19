import { CRUDResolver, InjectPubSub } from '@nestjs-query/query-graphql';
import { Inject, UseGuards } from '@nestjs/common';
import { Args, CONTEXT, Float, Mutation, Query, Resolver } from '@nestjs/graphql';
import { Point } from '@ridy/database';
import { DriverRedisService } from '@ridy/redis/driver-redis.service';
import { OrderRedisService } from '@ridy/redis/order-redis.service';
import { RedisPubSub } from 'graphql-redis-subscriptions';
import { UserContext } from '../auth/authenticated-user';
import { GqlAuthGuard } from '../auth/jwt-gql-auth.guard';
import { DriverOrderQueryService } from './driver-order.query-service';
import { AvailableOrderDTO } from './dto/available-order.dto';
import { OrderDTO } from './dto/order.dto';
import { UpdateOrderInput } from './dto/update-order.input';


@Resolver(() => OrderDTO)
@UseGuards(GqlAuthGuard)
export class OrderResolver extends CRUDResolver(OrderDTO, {
  UpdateDTOClass: UpdateOrderInput,
  create: { disabled: true },
  update: { many: { disabled: true } },
  delete: { disabled: true }
}) {
  constructor(
    public readonly driverOrderService: DriverOrderQueryService,
    @Inject(CONTEXT) private context: UserContext,
    private orderRedisService: OrderRedisService,
    private driverRedisService: DriverRedisService,
    @InjectPubSub()
    private redisPubSub: RedisPubSub
  ) {
    super(driverOrderService);
  }

  // @Query(() => OrderDTO)
  // async currentOrder(): Promise<OrderDTO> {
  //   return this.orderRepository.findOne({ driverId: this.context.req.user.id, status: In([OrderStatus.DriverAccepted, OrderStatus.Arrived, OrderStatus.Started, OrderStatus.WaitingForPostPay]) });
  // }

  @Query(() => [AvailableOrderDTO])
  async availableOrders(): Promise<AvailableOrderDTO[]> {
    return this.orderRedisService.getForDriver(this.context.req.user.id, 999999999);
  }

  @Mutation(() => [AvailableOrderDTO])
  async updateDriversLocation(@Args('lat', { type: () => Float }) lat: number, @Args('lng', { type: () => Float }) lng: number): Promise<AvailableOrderDTO[]> {
    await this.driverRedisService.setLocation(this.context.req.user.id, { lat, lng });
    return this.orderRedisService.getForDriver(this.context.req.user.id, 999999999);
  }

  @Mutation(() => [AvailableOrderDTO])
  async updateDriversLocationNew(@Args('point', { type: () => Point }) point: Point): Promise<AvailableOrderDTO[]> {
    this.redisPubSub.publish('driverLocationUpdated', { driverId: this.context.req.user.id, point });
    await this.driverRedisService.setLocation(this.context.req.user.id, point);
    return this.orderRedisService.getForDriver(this.context.req.user.id, 999999999);
  }  
}
