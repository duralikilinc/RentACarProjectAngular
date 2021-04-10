import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { environment } from 'src/environments/environment';
import { Observable } from 'rxjs';
import { SingleResponseModel } from './../models/singleResponseModel';
import { Findex } from './../models/findex/findex';
import { ResponseModel } from './../models/responseModel';

@Injectable({
  providedIn: 'root'
})
export class FindexService {

  apiUrl=environment.baseUrl+"api/findex/";
  
  constructor(private httpClient:HttpClient) { }

  getFindexByCustomerId(customerId:number):Observable<SingleResponseModel<Findex>>{
    return this.httpClient.get<SingleResponseModel<Findex>>(this.apiUrl+"getFindexByCustomerId/"+customerId);
  }
 
}
