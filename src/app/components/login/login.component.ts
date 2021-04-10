import { Component, OnInit } from '@angular/core';
import { FormGroup, FormControl, FormBuilder, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import { AuthService } from 'src/app/services/auth.service';
import { LocalStorageService } from 'src/app/services/local-storage.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {

  loginform: FormGroup;

  constructor(private formBuilder: FormBuilder,
    private authService: AuthService,
    private toastrService: ToastrService,
    private router: Router,
    private localStorage:LocalStorageService) { }

  ngOnInit(): void {
    this.createLoginForm();
  }

  createLoginForm() {
    this.loginform = this.formBuilder.group({
      email: ["", Validators.required],
      password: ["", Validators.required]
    });
  }
  login() {
    if (this.loginform.valid) {
      let loginModel = Object.assign({}, this.loginform.value)
      this.authService.login(loginModel).subscribe(response => {
        this.toastrService.info(response.message)
        this.localStorage.add("token", response.data.token)
        this.localStorage.add("email", this.loginform.get("email")?.value)
        this.router.navigateByUrl('');
        setTimeout(function () {
          location.reload();
        });
      },
        responseError => {
          this.toastrService.error(responseError.error, 'Error');

        })
    }
    else {
      this.toastrService.error("Form Alanları Eksik", "Dikkat");
    }
  }
}

