import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { ListResponseModel } from './../models/listResponseModel';
import { Car } from '../models/car/car';
import { Observable } from 'rxjs';
import { CarDetail } from '../models/car/carDetail';
import { SingleResponseModel } from '../models/singleResponseModel';
import { environment } from 'src/environments/environment';


@Injectable({
  providedIn: 'root'
})
export class CarService {
  apiUrl=environment.baseUrl+"api/cars/";
  constructor(private httpClient:HttpClient) { }

  getCars():Observable<ListResponseModel<Car>>{
    return this.httpClient.get<ListResponseModel<Car>>(this.apiUrl);
  }
  getCarsDetail():Observable<ListResponseModel<CarDetail>>{
    let newPath=this.apiUrl+"details";
    return this.httpClient.get<ListResponseModel<CarDetail>>(newPath);
  }
  
  getCarsByBrandId(brandId:number):Observable<ListResponseModel<Car>>{
    let newPath=this.apiUrl+"getbybrand/"+brandId;
    return this.httpClient.get<ListResponseModel<Car>>(newPath);
  }
  getCarsByColorId(colorId:number):Observable<ListResponseModel<Car>>{
    let newPath=this.apiUrl+"getbycolor/"+colorId;
    return this.httpClient.get<ListResponseModel<Car>>(newPath);
  }
   getCarDetails(carId:number):Observable<ListResponseModel<CarDetail>>{
    let newPath=this.apiUrl+"getcardetailsbyid/"+carId;
    return this.httpClient.get<ListResponseModel<CarDetail>>(newPath);
  } 
  getCarDetailsBrandAndColor(colorId:number, brandId:number):Observable<ListResponseModel<CarDetail>>{
    let newPath=this.apiUrl+"getcardetailbrandandcolorid/"+brandId+"/"+colorId;
    return this.httpClient.get<ListResponseModel<CarDetail>>(newPath);
  }
}
