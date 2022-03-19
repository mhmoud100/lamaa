import { Component, OnInit } from '@angular/core';
import { FormBuilder, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { UpdateFleetGQL } from '@ridy/admin-panel/generated/graphql';
import { TagColorService } from '@ridy/admin-panel/src/app/@services/tag-color/tag-color.service';
import { COUNTRY_CODE_LIST } from '@ridy/admin-panel/src/app/country-codes';
import { NzMessageService } from 'ng-zorro-antd/message';
import { firstValueFrom, Subscription } from 'rxjs';

@Component({
  selector: 'app-fleet-view-details',
  templateUrl: './fleet-view-details.component.html'
})
export class FleetViewDetailsComponent implements OnInit {
  form = this.fb.group({
    id: [null, Validators.required],
    name: [null, Validators.required],
    phoneNumberPrefix: ['+1', Validators.required],
    phoneNumber: [null, Validators.required],
    mobileNumberPrefix: ['+1', Validators.required],
    mobileNumber: [null, Validators.required],
    accountNumber: [null, Validators.required],
    commissionSharePercent!: [0, Validators.required],
    commissionShareFlat!: [0, Validators.required],
    address: [null]
  });
  countryCodes = COUNTRY_CODE_LIST;
  subscription?: Subscription;
  
  constructor(
    private route: ActivatedRoute,
    private fb: FormBuilder,
    public tagColor: TagColorService,
    private updateGQL: UpdateFleetGQL,
    private msg: NzMessageService,
    private router: Router) { }

  ngOnInit(): void {
    this.subscription = this.route.parent?.data.subscribe(data => (this.form.patchValue(data.fleet.data.fleet)));
  }

  async onSubmit() {
    const { id, phoneNumber, phoneNumberPrefix, mobileNumber, mobileNumberPrefix, ..._formValue } = this.form.value;
    try {
      const result = await firstValueFrom(this.updateGQL.mutate({ id ,update: { phoneNumber: `${phoneNumberPrefix.substring(1)}${phoneNumber}`, mobileNumber: `${mobileNumberPrefix.substring(1)}${mobileNumber}`, ..._formValue } }));
      this.msg.success('Success');
    this.router.navigateByUrl('/management/fleets');
    } catch(error: any) {
      this.msg.error(error.message);
    }
  }
}
