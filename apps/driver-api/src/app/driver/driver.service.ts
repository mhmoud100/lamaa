import { Injectable, Logger } from '@nestjs/common';
import { DriverEntity } from '@ridy/database/driver.entity';
import { Repository } from 'typeorm';
import { InjectRepository } from '@nestjs/typeorm';
import { DriverStatus } from '@ridy/database/enums/driver-status.enum';
import { DriverRedisService } from '@ridy/redis/driver-redis.service';

@Injectable()
export class DriverService {
    constructor(
        @InjectRepository(DriverEntity) private repo: Repository<DriverEntity>,
        private driverRedisService: DriverRedisService
      ) {}
    
      async findById(id: number): Promise<DriverEntity> {
        return this.repo.findOne(id)
      }
    
      private async findUserByMobileNumber(mobileNumber: string): Promise<DriverEntity> {
        return this.repo.findOne({ where: { mobileNumber } });
      }
    
      async findOrCreateUserWithMobileNumber(
        mobileNumber: string
      ): Promise<DriverEntity> {
        const findResult = await this.findUserByMobileNumber(mobileNumber);
        return findResult ?? this.repo.save({
          mobileNumber: mobileNumber,
        });
      }

      async findByIds(ids: number[]): Promise<DriverEntity[]> {
        return this.repo.findByIds(ids);
      }

      async expireDriverStatus(driverIds: number[]) {
        if(driverIds.length < 1) {
          return;
        }
        this.driverRedisService.expire(driverIds);
        return this.repo.update(driverIds, { status: DriverStatus.Offline, lastSeenTimestamp: new Date() });
      }
}

