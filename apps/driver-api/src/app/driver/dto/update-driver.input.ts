import { BeforeUpdateOne, UpdateOneInputType } from '@nestjs-query/query-graphql';
import { Field, ID, InputType, Int } from '@nestjs/graphql';
import { DriverEntity } from '@ridy/database/driver.entity';
import { DriverStatus } from '@ridy/database/enums/driver-status.enum';
import { Gender } from '@ridy/database/enums/gender.enum';
import { ServiceEntity } from '@ridy/database/service.entity';
import { getRepository } from 'typeorm';
import { UserContext } from '../../auth/authenticated-user';

@InputType()
@BeforeUpdateOne((input: UpdateOneInputType<UpdateDriverInput>, context: UserContext) => {
    input.id = context.req.user.id;
    const allowedStatuses = [DriverStatus.Offline, DriverStatus.Online, DriverStatus.WaitingDocuments, DriverStatus.SoftReject];
    const isNotAllowed = allowedStatuses.filter(status => DriverStatus[status] == DriverStatus[input.update.status]).length < 1;
    if(input.update.status && isNotAllowed) {
        delete input.update.status;
    }
    if(input.update.status == DriverStatus.PendingApproval && process.env.DEMO_MODE != null) {
        input.update.status = DriverStatus.Offline;
        getRepository(ServiceEntity).find().then(services => getRepository(DriverEntity).save({id: input.id as number, enabledServices: services }));
    }
    return input;
})
export class UpdateDriverInput {
    firstName?: string;
    lastName?: string;
    status?: DriverStatus;
    certificateNumber?: string;
    email?: string;
    @Field(() => Int)
    carProductionYear?: number;
    carPlate?: string;
    mediaId?: number;
    gender?: Gender;
    accountNumber?: string;
    bankName?: string;
    bankRoutingNumber?: string;
    bankSwift?: string;
    address?: string;
    documents?: string[];
    @Field(() => ID)
    carModelId?: number;
    @Field(() => ID)
    carColorId?: number;
    notificationPlayerId?: string;
}