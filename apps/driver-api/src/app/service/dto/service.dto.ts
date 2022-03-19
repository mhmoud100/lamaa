import { IDField, Relation } from "@nestjs-query/query-graphql";
import { ID, ObjectType } from "@nestjs/graphql";
import { ServicePaymentMethod } from "@ridy/database/enums/service-payment-method.enum";
import { MediaDTO } from "../../upload/media.dto";

@ObjectType('Service')
@Relation('media', () => MediaDTO)
export class ServiceDTO {
    @IDField(() => ID)
    id: number;
    name: string;
    paymentMethod: ServicePaymentMethod;
}