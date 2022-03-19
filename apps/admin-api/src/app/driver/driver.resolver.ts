import { Inject, UseGuards } from "@nestjs/common";
import { Args, CONTEXT, Mutation, Query, Resolver } from "@nestjs/graphql";
import { TransactionAction } from "@ridy/database/enums/transaction-action.enum";
import { TransactionStatus } from "@ridy/database/enums/transaction-status.enum";
import { SharedDriverService } from "@ridy/order/shared-driver.service";
import { UserContext } from "../auth/authenticated-admin";
import { JwtAuthGuard } from "../auth/jwt-auth.guard";
import { DriverService } from "./driver.service";
import { OnlineDriver } from "./dto/driver-location.dto";
import { DriverTransactionInput } from "./dto/driver-transaction.input";
import { DriverWalletDTO } from "./dto/driver-wallet.dto";


@Resolver()
@UseGuards(JwtAuthGuard)
export class DriverResolver {
    constructor(
        private driverService: DriverService,
        private sharedDriverService: SharedDriverService,
        @Inject(CONTEXT)
        private context: UserContext
    ) {}

    @Query(() => [OnlineDriver])
    async getDriversLocation(): Promise<OnlineDriver[]> {
        return this.driverService.getDriversLocation();
    }

    @Mutation(() => DriverWalletDTO)
    async createDriverTransaction(@Args('input', { type: () => DriverTransactionInput }) input: DriverTransactionInput) {
        input.amount = input.action == TransactionAction.Recharge ? Math.abs(input.amount) : Math.abs(input.amount) * -1;
        return this.sharedDriverService.rechargeWallet({...input, operatorId: this.context.req.user.id, status: TransactionStatus.Done});
    }
}