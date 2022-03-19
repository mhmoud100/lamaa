import { Logger, Module } from '@nestjs/common';
import { GraphQLModule } from '@nestjs/graphql';
import { TypeOrmModule } from '@nestjs/typeorm';
import { DatabaseModule, entities } from '@ridy/database';
import { join } from 'path';

import { AuthModule } from './auth/auth.module';
import { RiderAPIController } from './rider-api.controller';
import { RiderModule } from './rider/rider.module';
import { UploadModule } from './upload/upload.module';
import { ServiceModule } from './service/service.module';
import { OrderModule } from './order/order.module';
import { AddressModule } from './address/address.module';
import { AnnouncementModule } from './announcement/announcement.module';
import { WalletModule } from './wallet/wallet.module';
import { CouponModule } from './coupon/coupon.module';
import { RedisModule } from '@liaoliaots/nestjs-redis';
import { validateToken } from './auth/jwt.strategy';
import { CryptoService } from '@ridy/database';
import { ChatModule } from './chat/chat.module';
import { ComplaintModule } from './complaint/complaint.module';

@Module({
  imports: [
    DatabaseModule,
    GraphQLModule.forRoot({
      cors: false,
      autoSchemaFile: join(process.cwd(), 'apps/rider-app/rider.schema.gql'),
      buildSchemaOptions: {
        dateScalarMode: 'timestamp',
      },
      // context: ({ req, res, payload, connection }) => {
      //   return {
      //     req,
      //     res,
      //     payload,
      //     connection,
      //   };
      // },
      subscriptions: {
        'subscriptions-transport-ws': {
          keepAlive: 5000,
          onConnect: async (connectionParams: any) => {
            if (connectionParams.authToken) {
              return validateToken(connectionParams.authToken);
            }
            throw new Error('Missing auth token!');
          },
        },
      },
    }),
    TypeOrmModule.forFeature(entities),
    AuthModule.register(),
    UploadModule,
    RiderModule,
    ServiceModule,
    OrderModule,
    AddressModule,
    AnnouncementModule,
    ComplaintModule,
    WalletModule,
    CouponModule,
    RedisModule.forRoot({
      closeClient: true,
      commonOptions: { db: 2 },
      config: {
        host: process.env.REDIS_HOST ?? 'localhost',
      },
    }),
    ChatModule,
  ],
  providers: [CryptoService],
  controllers: [RiderAPIController],
})
export class RiderAPIModule {}
