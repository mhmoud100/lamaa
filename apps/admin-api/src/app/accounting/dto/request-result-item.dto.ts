import { ObjectType } from "@nestjs/graphql";

@ObjectType()
export class RequestResultItem {
    time: string;
    count: number;
}

@ObjectType()
export class RequestsResults {
    items: RequestResultItem[];
}