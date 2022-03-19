import { ObjectType, registerEnumType } from "@nestjs/graphql";
import { ServiceCategoryDTO } from "../../service/dto/service-category.dto";

export enum CalculateFareError {
    RegionUnsupported = 'REGION_UNSUPPORTED',
    NoServiceInRegion = 'NO_SERVICE_IN_REGION'
}

registerEnumType(CalculateFareError, { name: 'CalculateFareError' });

@ObjectType()
export class CalculateFareDTO {
    currency: string;
    distance: number;
    duration: number;
    services: ServiceCategoryDTO[];
    error?: CalculateFareError;
}