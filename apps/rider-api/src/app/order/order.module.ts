import { NestjsQueryGraphQLModule } from '@nestjs-query/query-graphql';
import { NestjsQueryTypeOrmModule } from '@nestjs-query/query-typeorm';
import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { RedisPubSubProvider } from '@ridy/database';
import { CarColorEntity } from '@ridy/database/car-color.entity';
import { CarModelEntity } from '@ridy/database/car-model.entity';
import { DriverTransactionEntity } from '@ridy/database/driver-transaction.entity';
import { DriverWalletEntity } from '@ridy/database/driver-wallet.entity';
import { DriverEntity } from '@ridy/database/driver.entity';
import { RequestEntity } from '@ridy/database/request.entity';
import { ProviderTransactionEntity } from '@ridy/database/provider-transaction.entity';
import { ProviderWalletEntity } from '@ridy/database/provider-wallet.entity';
import { RegionEntity } from '@ridy/database/region.entity';
import { ServiceCategoryEntity } from '@ridy/database/service-category.entity';
import { SharedDriverService } from '@ridy/order/shared-driver.service';
import { DriverNotificationService } from '@ridy/order/firebase-notification-service/driver-notification.service';
import { GoogleServicesModule } from '@ridy/order/google-services.module';
import { SharedProviderService } from '@ridy/order/shared-provider.service';
import { RegionModule } from '@ridy/order/region.module';
import { SharedOrderService } from '@ridy/order/shared-order.service';
import { RedisHelpersModule } from '@ridy/redis/redis-helper.module';

import { GqlAuthGuard } from '../auth/jwt-gql-auth.guard';
import { RiderModule } from '../rider/rider.module';
import { ServiceModule } from '../service/service.module';
import { CarColorDTO } from './dto/car-color.dto';
import { CarModelDTO } from './dto/car-model.dto';
import { DriverDTO } from './dto/driver.dto';
import { OrderDTO } from './dto/order.dto';
import { OrderResolver } from './order.resolver';
import { RiderOrderService } from './rider-order.service';
import { FeedbackEntity } from '@ridy/database/feedback.entity';
import { OrderSubscriptionService } from './order-subscription.service';
import { MediaEntity } from '@ridy/database/media.entity';
import { RequestActivityEntity } from '@ridy/database/request-activity.entity';

@Module({
  imports: [
    TypeOrmModule.forFeature([
      RequestEntity,
      ProviderWalletEntity,
      ProviderTransactionEntity,
      DriverEntity,
      DriverWalletEntity,
      DriverTransactionEntity,
      FeedbackEntity,
      RequestActivityEntity
    ]),
    GoogleServicesModule,
    ServiceModule,
    RiderModule,
    RegionModule,
    RedisHelpersModule,
    NestjsQueryGraphQLModule.forFeature({
      imports: [
        NestjsQueryTypeOrmModule.forFeature([
          RequestEntity,
          DriverEntity,
          CarColorEntity,
          CarModelEntity,
          RegionEntity,
          ServiceCategoryEntity,
          MediaEntity
        ]),
      ],
      pubSub: RedisPubSubProvider.provider(),
      resolvers: [
        {
          EntityClass: RequestEntity,
          DTOClass: OrderDTO,
          read: { one: { disabled: true } },
          create: { disabled: true },
          update: { disabled: true },
          delete: { disabled: true },
          guards: [GqlAuthGuard],
        },
        {
          EntityClass: DriverEntity,
          DTOClass: DriverDTO,
          create: { disabled: true },
          update: { disabled: true },
          delete: { disabled: true },
          read: { disabled: true },
        },
        {
          EntityClass: CarModelEntity,
          DTOClass: CarModelDTO,
          create: { disabled: true },
          update: { disabled: true },
          delete: { disabled: true },
          read: { disabled: true },
        },
        {
          EntityClass: CarColorEntity,
          DTOClass: CarColorDTO,
          create: { disabled: true },
          update: { disabled: true },
          delete: { disabled: true },
          read: { disabled: true },
        },
      ],
    }),
  ],
  providers: [
    OrderSubscriptionService,
    SharedProviderService,
    OrderResolver,
    SharedOrderService,
    RiderOrderService,
    SharedDriverService,
    DriverNotificationService,
    RedisPubSubProvider.provider(),
  ],
  exports: [RiderOrderService]
})
export class OrderModule {}
