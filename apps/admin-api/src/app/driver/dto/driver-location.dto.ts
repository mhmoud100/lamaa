import { ObjectType } from "@nestjs/graphql";
import { Point } from "@ridy/database";

@ObjectType()
export class OnlineDriver {
    location: Point;
    driverId: number;
    lastUpdatedAt: number;
}