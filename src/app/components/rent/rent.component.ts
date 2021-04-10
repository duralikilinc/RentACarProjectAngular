import { Component, ComponentFactoryResolver, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { CarDetail } from 'src/app/models/car/carDetail';
import { CarService } from 'src/app/services/car.service';
import { environment } from 'src/environments/environment';
import { DatePipe } from '@angular/common';
import { UserDetail } from 'src/app/models/user/userDetail';
import { LocalStorageService } from 'src/app/services/local-storage.service';
import { UserService } from 'src/app/services/user.service';
import { RentalService } from './../../services/rental.service';
import { ToastrService } from 'ngx-toastr';
import { ErrorHelper } from 'src/app/helpers/errorHelper';

@Component({
  selector: 'app-rent',
  templateUrl: './rent.component.html',
  styleUrls: ['./rent.component.css'],
  providers: [DatePipe]
})
export class RentComponent implements OnInit {

  carDetails!: CarDetail[];
  defaultlogo = '/uploads/default.png';
  imageBasePath = environment.baseUrl;
  userDetail: UserDetail;
  userMail: string;
  isRental: boolean = false;
  findexScore: number;
  carId: number;
  findexControl: boolean = false;
  customerId: number;

  constructor(private carService: CarService,
    private activatedRoute: ActivatedRoute,
    private localStorage: LocalStorageService,
    private userService: UserService,
    private toastrService: ToastrService,
    private rentalService: RentalService) { }

  ngOnInit(): void {
    this.activatedRoute.params.subscribe(async params => {
      if (params["carId"]) {
        this.getCarDetail(params["carId"]).then(res=>{
          this.getUserDetail().then(res=>{
            this.IsFindexControl(this.customerId,this.carId);          
          })
        }).catch(err=>{
          console.log("hata")
        });
        
      }
    })
  }


  getCarDetail(carId: number) {
    return new Promise((resolve, reject) => {
      this.carService.getCarDetails(carId).subscribe(response => {
        this.carDetails = response.data
        this.carId = response.data[0].carId;
        resolve(this.carDetails);
      })
     
    });
  }
  getUserDetail() {
    return new Promise((resolve, reject) => {
      this.userMail = this.localStorage.get("email");
      this.userService.getUserDetailByEmail(this.userMail).subscribe(response => {
        this.userDetail = response.data
        this.customerId = response.data.customerId
        this.findexScore = response.data.findexScore        
        resolve(this.userDetail)
      })
    });



  }
  IsFindexControl(customerId: number, carId: number) {
    this.rentalService.getFindexControl(customerId, carId).subscribe(response => {
      this.findexControl = response.success
    },
      (responseError) => {
        this.toastrService.error(ErrorHelper.getMessage(responseError), "Hata")
      })
  }
}
