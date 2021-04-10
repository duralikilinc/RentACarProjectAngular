import { Component, OnInit } from '@angular/core';

import { FormGroup, FormControl, FormBuilder, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import { MustMatch } from 'src/app/helpers/mustMatch';
import { AuthService } from 'src/app/services/auth.service';
import { LocalStorageService } from 'src/app/services/local-storage.service';

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.css']
})
export class RegisterComponent implements OnInit {

  registerform: FormGroup;

  constructor(private formBuilder: FormBuilder,
    private authService: AuthService,
    private toastrService: ToastrService,
    private router: Router,
    private localStorage: LocalStorageService) { }

  ngOnInit(): void {
    this.createRegisterForm();
  }
  createRegisterForm() {
    this.registerform = this.formBuilder.group({
      email: ["", Validators.required],
      password: ["", Validators.required],
      firstName: ["", Validators.required],
      lastName: ["", Validators.required],
      confirmpassword:['', Validators.required]
    },
    {
      validator:MustMatch('password','confirmpassword')
    });
  }

  register() {
    if (!this.registerform.valid) {
      this.toastrService.error("Form Alanları Eksik", "Dikkat");
    } else {
      let registerModel = Object.assign({}, this.registerform.value)
      this.authService.register(registerModel).subscribe(response => {
       
        this.toastrService.info(response.message,"")
        this.router.navigate(['login']);

      },
      responseError => {
        this.toastrService.error(responseError.error, 'Error');

      })
    }


  }
}
