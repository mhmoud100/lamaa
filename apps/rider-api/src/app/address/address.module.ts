import { NestjsQueryGraphQLModule, PagingStrategies } from '@nestjs-query/query-graphql';
import { NestjsQueryTypeOrmModule } from '@nestjs-query/query-typeorm';
import { Module } from '@nestjs/common';
import { RiderAddressEntity } from '@ridy/database/rider-address.entity';

import { GqlAuthGuard } from '../auth/jwt-gql-auth.guard';
import { CreateRiderAddressInput } from './dto/create-rider-address.input';
import { RiderAddressDTO } from './dto/rider-address.dto';

@Module({
    imports: [
        NestjsQueryGraphQLModule.forFeature({
            imports: [NestjsQueryTypeOrmModule.forFeature([RiderAddressEntity])],
            resolvers: [
                {
                    EntityClass: RiderAddressEntity,
                    DTOClass: RiderAddressDTO,
                    CreateDTOClass: CreateRiderAddressInput,
                    guards: [GqlAuthGuard],
                    pagingStrategy: PagingStrategies.NONE
                }
            ]
        })
    ]
})
export class AddressModule {}
