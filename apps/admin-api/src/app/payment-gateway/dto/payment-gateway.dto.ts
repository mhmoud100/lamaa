import { Authorize, IDField } from "@nestjs-query/query-graphql";
import { ID, ObjectType } from "@nestjs/graphql";
import { PaymentGatewayType } from "@ridy/database/enums/payment-gateway-type.enum";
import { GatewayAuthorizer } from "./gateway.authorizer";

@ObjectType('PaymentGateway')
@Authorize(GatewayAuthorizer)
export class PaymentGatewayDTO {
    @IDField(() => ID)
    id!: number;
    enabled!: boolean;
    title!: string;
    type!: PaymentGatewayType;
    publicKey?: string;
    privateKey: string;
    merchantId?: string;
    saltKey?: string;
}