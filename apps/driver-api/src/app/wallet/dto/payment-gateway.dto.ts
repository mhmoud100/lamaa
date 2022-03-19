import { IDField } from "@nestjs-query/query-graphql";
import { ID, ObjectType } from "@nestjs/graphql";
import { PaymentGatewayType } from "@ridy/database/enums/payment-gateway-type.enum";

@ObjectType('PaymentGateway')
export class PaymentGatewayDTO {
    @IDField(() => ID)
    id: number;
    title: string;
    type: PaymentGatewayType;
    publicKey?: string;
}