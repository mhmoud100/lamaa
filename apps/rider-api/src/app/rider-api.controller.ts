import { Controller, Get, Post, Req, Res, UseGuards, Request } from '@nestjs/common';
import { RiderRechargeTransactionType } from '@ridy/database/enums/rider-recharge-transaction-type.enum';
import { TransactionAction } from '@ridy/database/enums/transaction-action.enum';
import { TransactionStatus } from '@ridy/database/enums/transaction-status.enum';
import { SharedRiderService } from '@ridy/order/shared-rider.service';
import { FastifyReply, FastifyRequest } from 'fastify';
import * as fastify from 'fastify';
import { join } from 'path';
import { pipeline } from 'stream';
import { promisify } from "util";
import { createWriteStream, promises } from 'fs';

const pump = promisify(pipeline);

import { RestJwtAuthGuard } from './auth/rest-jwt-auth.guard';
import { InjectRepository } from '@nestjs/typeorm';
import { RiderEntity } from '@ridy/database/rider-entity';
import { Repository } from 'typeorm';
import { MediaEntity } from '@ridy/database/media.entity';
import { CryptoService } from '@ridy/database';

@Controller()
export class RiderAPIController {
    constructor(
        private sharedRiderService: SharedRiderService,
        private cryptoService: CryptoService,
        @InjectRepository(RiderEntity)
        private riderRepository: Repository<RiderEntity>,
        @InjectRepository(MediaEntity)
        private mediaRepository: Repository<MediaEntity>
    ) {}

    @Get()
    async defaultPath(@Res() res: fastify.FastifyReply) {
        res.send('✅ Rider API microservice running.');
    }

    @Get('payment_result')
    async verifyPayment(@Req() req: FastifyRequest<{Querystring: {token: string}}>, @Res() res: FastifyReply) {
        const token = req.query.token;
        const decrypted = await this.cryptoService.decrypt(token);
        if(decrypted.userType == 'client') {
            if(decrypted.status == 'success') {
                await this.sharedRiderService.rechargeWallet({
                    riderId: decrypted.userId,
                    amount: decrypted.amount,
                    currency: decrypted.currency,
                    refrenceNumber: decrypted.transactionNumber,
                    action: TransactionAction.Recharge,
                    rechargeType: RiderRechargeTransactionType.InAppPayment,
                    paymentGatewayId: decrypted.gatewayId,
                    status: TransactionStatus.Done
                });
                res.send('Transaction successful. Close this page and go back to the app.');
            } else {
                res.send('Transaction wasn\'t successful. You can go back to the app and redo this.');
            }
        }
    }

    @Post('upload_profile')
    @UseGuards(RestJwtAuthGuard)
    async upload(@Request() req: fastify.FastifyRequest, @Res() res: fastify.FastifyReply) {
        const data = await req.file();
        const dir = 'uploads';
        await promises.mkdir(dir, { recursive: true });
        const _fileName = join(dir, `${new Date().getTime()}-${data.filename}`);
        await pump(data.file, createWriteStream(_fileName));
        const insert = await this.mediaRepository.insert({ address: _fileName });
        await this.riderRepository.update((req as unknown as any).user.id, {mediaId: insert.raw.insertId });
        res.code(200).send({ id: insert.raw.insertId, address: _fileName });
    }
}