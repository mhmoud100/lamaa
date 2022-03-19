import { Component, OnDestroy, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { CreatePaymentGatewayGQL, PaymentGatewayType, UpdatePaymentGatewayGQL } from '@ridy/admin-panel/generated/graphql';
import { RouterHelperService } from '@ridy/admin-panel/src/app/@services/router-helper.service';
import { firstValueFrom, Subscription } from 'rxjs';

@Component({
  selector: 'app-payment-gateway-view',
  templateUrl: './payment-gateway-view.component.html'
})
export class PaymentGatewayViewComponent implements OnInit, OnDestroy {
  form = this.fb.group({
    id: [null],
    title: [null, Validators.required],
    type: [null, Validators.required],
    enabled: [false, Validators.required],
    privateKey: [null, Validators.required],
    publicKey: [null],
    saltKey: [null],
    merchantId: [null]
  });
  subscription?: Subscription;
  gatewayTypes = Object.keys(PaymentGatewayType);

  constructor(
    private route: ActivatedRoute,
    private fb: FormBuilder,
    private updateGQL: UpdatePaymentGatewayGQL,
    private createGQL: CreatePaymentGatewayGQL,
    private routerHelper: RouterHelperService) { }

  ngOnInit(): void {
    this.subscription = this.route.data.subscribe(data => (this.form.patchValue(data.paymentGateway.data.paymentGateway)));
  }

  ngOnDestroy() {
    this.subscription?.unsubscribe();
  }

  async onSubmit() {
    const { id, ...input } = this.form.value;
    if(id == null) {
      const res = await firstValueFrom(this.createGQL.mutate({input}));
    } else {
      const res = await firstValueFrom(this.updateGQL.mutate({id, input}));
    }
    this.routerHelper.goToParent(this.route);
  }
}
