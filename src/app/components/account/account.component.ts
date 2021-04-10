import { Component, OnInit } from '@angular/core';
import { LocalStorageService } from 'src/app/services/local-storage.service';
import { UserService } from 'src/app/services/user.service';
import { FormGroup, FormControl, FormBuilder, Validators } from '@angular/forms';
import { Observable } from 'rxjs';
import { UserDetail } from './../../models/user/userDetail';
import { FindexService } from 'src/app/services/findex.service';
import { Findex } from 'src/app/models/findex/findex';
import { MustMatch } from 'src/app/helpers/mustMatch';
import { ToastrService } from 'ngx-toastr';
import { UserDetailUpdateModel } from './../../models/user/userDetailUpdate';
import { ErrorHelper } from 'src/app/helpers/errorHelper';

@Component({
  selector: 'app-account',
  templateUrl: './account.component.html',
  styleUrls: ['./account.component.css']
})
export class AccountComponent implements OnInit {

  accountform: FormGroup;
  userDetail: UserDetail
  users: Observable<UserDetail>;
  userMail: string;
  findex: Findex;

  constructor(private userService: UserService,
    private formBuilder: FormBuilder,
    private findeksService: FindexService,
    private localStorage: LocalStorageService,
    private toastrService: ToastrService) { }

  ngOnInit(): void {
    this.getUserDetail();
  }

  getUserDetail() {
    this.userMail = this.localStorage.get("email");
    this.userService.getUserDetailByEmail(this.userMail).subscribe(response => {
      if (!response.data) return;
      this.userDetail = response.data
      this.createAccountForm();
      this.getFindexByCustomerId(this.userDetail.customerId);
    })
  }

  createAccountForm() {
    this.accountform = this.formBuilder.group({
      firstName: [this.userDetail.firstName, Validators.required],
      lastName: [this.userDetail.lastName, Validators.required],
      companyName: [this.userDetail.companyName, Validators.required],
      currentPassword: ['', Validators.required],
      newPassword: ['', Validators.required],
      confirmpassword: ['', Validators.required]
    },
      {
        validator: MustMatch('newPassword', 'confirmpassword')
      });
  }
  getFindexByCustomerId(customerId: number) {
    this.findeksService.getFindexByCustomerId(customerId).subscribe(response => {
      this.findex = response.data
    })
  }
  updateAccount() {
    if (!this.accountform.valid) {
      this.toastrService.error("Form Alanları Eksik", "Dikkat");;
    } else {
      let newUserDetail = {
        email: this.userDetail.email,
        customerId: this.userDetail.customerId
      };
      let userDetailUpdateModel: UserDetailUpdateModel = Object.assign({}, this.accountform.value, newUserDetail
      )
      this.userService.updateUserDetails(userDetailUpdateModel).subscribe(response => {
        this.toastrService.success(response.message, "");
        location.reload();
      },
        (responseError) => {
         
            this.toastrService.error(ErrorHelper.getMessage(responseError), 'Error');
         
        })
    }

  }

}
