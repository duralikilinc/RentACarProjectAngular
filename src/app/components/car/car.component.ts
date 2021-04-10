import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import { ErrorHelper } from 'src/app/helpers/errorHelper';
import { Car } from 'src/app/models/car/car';
import { CarService } from 'src/app/services/car.service';
import { environment } from 'src/environments/environment';
import { CarDetail } from './../../models/car/carDetail';
import { RentalService } from './../../services/rental.service';

@Component({
  selector: 'app-car',
  templateUrl: './car.component.html',
  styleUrls: ['./car.component.css']
})
export class CarComponent implements OnInit {

  cars: Car[] = [];
  carsDetail: CarDetail[];
  defaultlogo = '/uploads/default.png';
  imageBasePath = environment.baseUrl;
  isRental:boolean=false;

  constructor(private carService: CarService,
    private activatedRoute: ActivatedRoute,
    private toastrService: ToastrService,
    private rentalService:RentalService,
    private router: Router) { }

  ngOnInit(): void {

    this.activatedRoute.params.subscribe(params => {

      if (params["brandId"] && params["colorId"]) {
        this.getCarDetailsBrandAndColor(params["brandId"], params["colorId"]);
      }
      else if (params["brandId"]) {
        this.getCarsByBrandId(params["brandId"]);
      }
      else if (params["colorId"]) {        
        this.getCarsByColorId(params["colorId"]);
      }
      else {
        this.getCarsDetail();
      }
    })

  }

  getCars() {
    this.carService.getCars().subscribe(response => {
      this.cars = response.data;
    })
  }
  getCarsDetail() {
    this.carService
      .getCarsDetail()
      .subscribe(response => {
        this.carsDetail = response.data        
        this.toastrService.success(this.carsDetail[0].brandName, "Listelendi")
      })

  };
  getCarsByBrandId(brandId: number) {

    this.carService.getCarsDetail().subscribe(response => {
      this.carsDetail = response.data.filter(p=>p.brandId==brandId) 

    });
  }
  getCarsByColorId(colorId: number) {
    this.carService.getCarsDetail().subscribe(response => {
       this.carsDetail = response.data.filter(p=>p.colorId==colorId) 
      });
  }
  getCarDetailsBrandAndColor(brandId: number, colorId: number) {
    this.carService.getCarDetailsBrandAndColor(brandId, colorId).subscribe(response => {
      this.carsDetail = response.data;
      this.toastrService.success("Filtreleme İşlemi Başarılı", "Listelendi")
    })
  }
  IsRental(carId:number){
    this.rentalService.IsRental(carId).subscribe(response=>{
      this.isRental=response.success;
      this.router.navigate(['/rent/',carId]);
     },
     (responseError)=>{
       this.toastrService.error(ErrorHelper.getMessage(responseError), 'Error');
     }
     )
  }
}
