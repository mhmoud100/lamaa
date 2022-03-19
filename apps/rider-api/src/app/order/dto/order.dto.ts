import { Authorize, FilterableField, IDField, Relation, UnPagedRelation } from '@nestjs-query/query-graphql';
import { Field, GraphQLTimestamp, ID, Int, ObjectType } from '@nestjs/graphql';
import { Point } from '@ridy/database';
import { OrderStatus } from '@ridy/database/enums/order-status.enum';

import { UserContext } from '../../auth/authenticated-user';
import { OrderMessageDTO } from '../../chat/dto/order-message.dto';
import { RiderDTO } from '../../rider/dto/rider.dto';
import { ServiceDTO } from '../../service/dto/service.dto';
import { PaymentGatewayDTO } from '../../wallet/dto/payment-gateway.dto';
import { DriverDTO } from './driver.dto';

@ObjectType('Order')
@Authorize({
    authorize: (context: UserContext) => ({riderId: {eq: context.req.user.id}})
})
@Relation('driver', () => DriverDTO, { nullable: true })
@Relation('rider', () => RiderDTO)
@Relation('service', () => ServiceDTO)
@Relation('paymentGateway', () => PaymentGatewayDTO, { nullable: true })
@UnPagedRelation('conversation', () => OrderMessageDTO, { relationName: 'conversation' })
export class OrderDTO {
    @IDField(() => ID)
    id: number;
    @FilterableField(() => OrderStatus)
    status: OrderStatus;
    createdOn: Date;
    @Field(() => Int)
    distanceBest!: number;
    @Field(() => Int)
    durationBest!: number;
    points: Point[];
    addresses: string[];
    startTimestamp?: Date;
    finishTimestamp?: Date;
    @FilterableField(() => ID)
    riderId: number;
    @FilterableField(() => ID, { nullable: true })
    driverId?: number;
    costAfterCoupon: number;
    etaPickup?: Date;
    costBest: number;
    paidAmount: number;
    currency: string;
}