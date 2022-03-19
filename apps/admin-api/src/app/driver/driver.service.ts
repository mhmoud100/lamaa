import { Injectable } from "@nestjs/common";
import { DriverRedisService } from '@ridy/redis/driver-redis.service';
import { OnlineDriver } from "./dto/driver-location.dto";

@Injectable()
export class DriverService {
    constructor(private driverRedisService: DriverRedisService) {}

    getDriversLocation(): Promise<OnlineDriver[]> {
        return this.driverRedisService.getAllOnline();
    }
}