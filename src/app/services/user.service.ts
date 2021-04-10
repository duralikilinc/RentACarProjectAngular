import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { environment } from 'src/environments/environment';
import { UserDetail } from '../models/user/userDetail';
import { Observable } from 'rxjs';
import { SingleResponseModel } from './../models/singleResponseModel';
import { ListResponseModel } from './../models/listResponseModel';
import { UserDetailUpdateModel } from './../models/user/userDetailUpdate';
import { ResponseModel } from '../models/responseModel';

@Injectable({
  providedIn: 'root'
})
export class UserService {

  apiUrl = environment.baseUrl + "api/users/";


  constructor(private httpClient: HttpClient) { }



  getUsers(): Observable<ListResponseModel<UserDetail>> {
    return this.httpClient.get<ListResponseModel<UserDetail>>(this.apiUrl);
  }
  getUserDetailByEmail(userMail: string): Observable<SingleResponseModel<UserDetail>> {
    return this.httpClient.get<SingleResponseModel<UserDetail>>(this.apiUrl+"getuserdetailbymail",{
      params:{
        userMail:userMail
      }
    });
  }

  updateUserDetails(userDetail:UserDetailUpdateModel):Observable<ResponseModel>
  {
    return this.httpClient.post<ResponseModel>(this.apiUrl+"updateuserdetails",userDetail);
  }

}
