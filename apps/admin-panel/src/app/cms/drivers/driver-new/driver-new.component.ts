import { Component, OnInit } from '@angular/core';
import { FormGroup, Validators, FormBuilder } from '@angular/forms';
import { ActivatedRoute } from '@angular/router';
import { CreateDriverGQL, } from '@ridy/admin-panel/generated/graphql';
import { firstValueFrom } from 'rxjs';
import { RouterHelperService } from '../../../@services/router-helper.service';
import { COUNTRY_CODE_LIST } from '../../../country-codes';

@Component({
  selector: 'app-driver-new',
  templateUrl: './driver-new.component.html'
})
export class DriverNewComponent {

  form: FormGroup = this.fb.group({
    firstName: [null],
    lastName: [null],
    phoneNumberPrefix: ['+1', Validators.required],
    phoneNumber: [null, Validators.required],
    gender: [null]
  });

  countryCodes = COUNTRY_CODE_LIST;

  constructor(private fb: FormBuilder,
    private createGQL: CreateDriverGQL,
    private routerHelper: RouterHelperService,
    private route: ActivatedRoute) { }

  async submitForm() {
    const { phoneNumber, phoneNumberPrefix, ..._formValue } = this.form.value;
    await firstValueFrom(this.createGQL.mutate({ input: { mobileNumber: `${phoneNumberPrefix}${phoneNumber}`, ..._formValue } }));
    this.routerHelper.goToParent(this.route);
  }

}