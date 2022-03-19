import { Authorize, FilterableField, IDField, PagingStrategies, Relation, UnPagedRelation } from "@nestjs-query/query-graphql";
import { Field, ID, Int, ObjectType } from "@nestjs/graphql";
import { DistanceMultiplier } from "@ridy/database";
import { TimeMultiplier } from "@ridy/database";
import { ServicePaymentMethod } from "@ridy/database/enums/service-payment-method.enum";
import { RegionDTO } from "../../region/dto/region.dto";
import { MediaDTO } from "../../upload/media.dto";
import { ServiceAuthorizer } from "./service.authorizer";

@ObjectType('Service')
@UnPagedRelation('regions', () => RegionDTO, { pagingStrategy: PagingStrategies.NONE })
@Relation('media', () => MediaDTO)
@Authorize(ServiceAuthorizer)
export class ServiceDTO {
    @IDField(() => ID)
    id!: number;
    name!: string;
    @FilterableField(() => ID)
    categoryId: number;
    baseFare!: number;
    perHundredMeters: number;
    perMinuteDrive!: number;
    prepayPercent!: number;
    minimumFee!: number;
    @Field(() => Int)
    searchRadius!: number;
    paymentMethod!: ServicePaymentMethod;
    cancellationTotalFee!: number;
    cancellationDriverShare!: number;
    @Field(() => Int)
    providerSharePercent!: number;
    providerShareFlat!: number;
    @Field(() => Int)
    maximumDestinationDistance!: number;
    timeMultipliers!: TimeMultiplier[];
    distanceMultipliers!: DistanceMultiplier[];
    @Field(() => ID)
    mediaId!: number;
}