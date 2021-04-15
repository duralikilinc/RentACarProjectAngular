import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { environment } from 'src/environments/environment';
import { Observable } from 'rxjs';
import { ResponseModel } from '../models/responseModel';
import { ListResponseModel } from './../models/listResponseModel';
import { Rental } from './../models/rental/rental';
import { SingleResponseModel } from './../models/singleResponseModel';

@Injectable({
  providedIn: 'root'
})
export class RentalService {

  apiUrl = environment.baseUrl + "api/rentals/";

  constructor(private httpClient: HttpClient) { }

  IsRental(carId: number): Observable<ResponseModel> {
    return this.httpClient.get<ResponseModel>(this.apiUrl + "isrental/" + carId);
  }
  getFindexControl(customerId: number, carId: number): Observable<ResponseModel> {
    return this.httpClient.get<ResponseModel>(this.apiUrl + "getFindexControl/" + customerId + "/" + carId);
  }
  getRentalDetails(): Observable<ListResponseModel<Rental>> {
    return this.httpClient.get<ListResponseModel<Rental>>(this.apiUrl + "getRentalDetails");
  }
  getRentalById(id: number): Observable<SingleResponseModel<Rental>> {
    return this.httpClient.get<SingleResponseModel<Rental>>(this.apiUrl + "getById/" + id);
  }
  rentalAdd(rental: Rental): Observable<ResponseModel> {
    return this.httpClient.post<ResponseModel>(this.apiUrl, rental);
  }
  getRentalDetailByCustomerId(customerId: number): Observable<ListResponseModel<Rental>> {
    return this.httpClient.get<ListResponseModel<Rental>>(this.apiUrl + "getByCustomerIdDetail/" + customerId);
  }
}
