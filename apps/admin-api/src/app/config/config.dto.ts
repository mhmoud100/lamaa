import { ObjectType, registerEnumType } from "@nestjs/graphql";

@ObjectType()
export class CurrentConfiguration {
    purchaseCode?: string;
    backendMapsAPIKey?: string;
    adminPanelAPIKey?: string;
    firebaseProjectPrivateKey?: string;
}


@ObjectType()
export class UploadResult {
    url: string;
}

export enum UpdatePurchaseCodeStatus {
    OK = 'OK',
    INVALID = 'INVALID',
    OVERUSED = 'OVERUSED',
    CLIENT_FOUND = 'CLIENT_FOUND'
}

registerEnumType(UpdatePurchaseCodeStatus, { name: 'UpdatePurchaseCodeStatus' })

@ObjectType()
export class UpdatePurchaseCodeResult {
    status: UpdatePurchaseCodeStatus;
    clients?: string[];
}

export enum UpdateConfigStatus {
    OK = 'OK',
    INVALID = 'INVALID'
}

registerEnumType(UpdateConfigStatus, { name: 'UpdateConfigStatus' });

@ObjectType()
export class UpdateConfigResult {
    status: UpdateConfigStatus;
    message?: string;
}