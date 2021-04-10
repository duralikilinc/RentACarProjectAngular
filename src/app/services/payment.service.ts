import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { environment } from 'src/environments/environment';
import { CrediCard } from './../models/crediCard/crediCard';
import { Observable } from 'rxjs';
import { ResponseModel } from './../models/responseModel';
import { ListResponseModel } from './../models/listResponseModel';
import { SingleResponseModel } from '../models/singleResponseModel';

@Injectable({
  providedIn: 'root'
})
export class PaymentService {

  apiUrl=environment.baseUrl+"api/credicards/";
  
  constructor(private httpClient:HttpClient) { }

  crediCardAdd(card:CrediCard):Observable<ResponseModel>{
    return this.httpClient.post<ResponseModel>(this.apiUrl,card);
  }

  getAll():Observable<ListResponseModel<CrediCard>>{
    return this.httpClient.get<ListResponseModel<CrediCard>>(this.apiUrl+"getall");
  }
  getAllByUserId(customerId:number):Observable<ListResponseModel<CrediCard>>{
    return this.httpClient.get<ListResponseModel<CrediCard>>(this.apiUrl+"getbyUserId/"+customerId);
  }
 
}
