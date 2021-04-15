import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { LoginModel } from '../models/loginModel';
import { RegisterModel } from '../models/registerModel';
import { SingleResponseModel } from '../models/singleResponseModel';
import { TokenModel } from '../models/tokenModel';
import { UserDetail } from '../models/user/userDetail';
import { LocalStorageService } from './local-storage.service';
import { Store } from '@ngrx/store';
import { AppState } from '../store/app.reducer';
import { map } from 'rxjs/operators';

@Injectable({
  providedIn: 'root'
})
export class AuthService {

  apiUrl = environment.baseUrl + "api/auth/";

  userDetail: Observable<UserDetail> = this.store.select((s) => s.appAuth)
    .pipe(map((b) => b.userDetail));

  constructor(private httpClient: HttpClient,
    private localStorage: LocalStorageService,
    private store: Store<AppState>) { }


  login(loginModel: LoginModel): Observable<SingleResponseModel<TokenModel>> {
    return this.httpClient.post<SingleResponseModel<TokenModel>>(this.apiUrl + "login", loginModel);
  }
  register(registerModel: RegisterModel): Observable<SingleResponseModel<TokenModel>> {
    return this.httpClient.post<SingleResponseModel<TokenModel>>(this.apiUrl + "register", registerModel);
  }


  isAuthenticated() {
    if (this.localStorage.get("token")) {
      return true;
    } else {
      return false;
    }
  }

  logout() {
    this.localStorage.remove("token");
    this.localStorage.remove("email");
    this.localStorage.clear();
  }
}
