import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { RedisPubSubProvider } from '@ridy/database';
import { DriverTransactionEntity } from '@ridy/database/driver-transaction.entity';
import { DriverWalletEntity } from '@ridy/database/driver-wallet.entity';
import { DriverEntity } from '@ridy/database/driver.entity';
import { FleetTransactionEntity } from '@ridy/database/fleet-transaction.entity';
import { FleetWalletEntity } from '@ridy/database/fleet-wallet.entity';
import { ProviderTransactionEntity } from '@ridy/database/provider-transaction.entity';
import { ProviderWalletEntity } from '@ridy/database/provider-wallet.entity';
import { RequestActivityEntity } from '@ridy/database/request-activity.entity';
import { RequestEntity } from '@ridy/database/request.entity';
import { RiderEntity } from '@ridy/database/rider-entity';
import { RiderTransactionEntity } from '@ridy/database/rider-transaction.entity';
import { RiderWalletEntity } from '@ridy/database/rider-wallet.entity';
import { ServiceCategoryEntity } from '@ridy/database/service-category.entity';
import { ServiceEntity } from '@ridy/database/service.entity';
import { RedisHelpersModule } from '@ridy/redis/redis-helper.module';
import { SharedConfigurationService } from '../shared-configuration.service';
import { FirebaseNotificationModule } from './firebase-notification-service/firebase-notification-service.module';
import { GoogleServicesModule } from './google-services/google-services.module';
import { RegionModule } from './region/region.module';
import { ServiceService } from './service.service';
import { SharedDriverService } from './shared-driver.service';
import { SharedFleetService } from './shared-fleet.service';
import { SharedOrderService } from './shared-order.service';
import { SharedProviderService } from './shared-provider.service';
import { SharedRiderService } from './shared-rider.service';

@Module({
  imports: [
      RedisHelpersModule,
    TypeOrmModule.forFeature([
      ServiceCategoryEntity,
      ServiceEntity,
      RiderEntity,
      DriverEntity,
      DriverWalletEntity,
      DriverTransactionEntity,
      FleetWalletEntity,
      FleetTransactionEntity,
      ProviderWalletEntity,
      ProviderTransactionEntity,
      RiderWalletEntity,
      RiderTransactionEntity,
      RequestEntity,
      RequestActivityEntity
      
    ]),
    RegionModule,
    GoogleServicesModule,
    FirebaseNotificationModule.register(),
  ],
  providers: [
    RedisPubSubProvider.provider(),
    ServiceService,
    SharedDriverService,
    SharedFleetService,
    SharedOrderService,
    SharedProviderService,
    SharedRiderService,
    SharedConfigurationService
  ],
  exports: [
    SharedDriverService,
    SharedFleetService,
    SharedOrderService,
    SharedProviderService,
    SharedRiderService,
  ],
})
export class SharedOrderModule {}
