import { Component,Input, OnInit  } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { CarDetail } from 'src/app/models/car/carDetail';
import { ToastrService } from 'ngx-toastr';
import { Router } from '@angular/router';
import { LocalStorageService } from './../../services/local-storage.service';

@Component({
  selector: 'app-rent-add',
  templateUrl: './rent-add.component.html',
  styleUrls: ['./rent-add.component.css']
})
export class RentAddComponent implements OnInit {

  rentform: FormGroup;
  rentDate: Date;
  returnDate: Date;
  totalPrice: number = 0;
  totalDay: number;
  date: Date;


  constructor(private formBuilder: FormBuilder,
    private router: Router,
    private toastrService: ToastrService,
    private localStorage:LocalStorageService) { }

  @Input() car: CarDetail[];
  @Input() customerId: number;

  ngOnInit(): void {
    this.createRentForm();
    this.priceCalculator();
  }

  createRentForm() {
    this.rentform = this.formBuilder.group({

      dailyPrice: [this.car[0].dailyPrice, Validators.required],
      rentDate: ["", Validators.required],
      returnDate: ["", Validators.required],
      totalDay: ["", Validators.required],
      totalPrice: [this.car[0].dailyPrice, Validators.required],
    });
  }

  onChangeEvent(event: any) {
    this.rentDate = event.target.value;
  }
  rentEndChangeEvent(event: any) {
    this.returnDate = event.target.value;
    this.priceCalculator();
  }


  getRentMinDate() {
    var today = new Date();
    today.setDate(today.getDate());
    return today.toISOString().slice(0, 10);
  }
  getReturnMinDate() {
    var today = new Date();
    today.setDate(today.getDate() + 1);
    return today.toISOString().slice(0, 10);
  }

  priceCalculator() {
    if (this.rentDate != null && this.returnDate != null) {
      var date1 = new Date(this.returnDate);
      var date2 = new Date(this.rentDate);

      var difference = date1.getTime() - date2.getTime();
      var numberOfDays = Math.ceil(difference / (1000 * 3600 * 24));
      this.totalDay = numberOfDays;
      this.totalPrice = this.totalDay * this.car[0].dailyPrice;
    }

  }

  createRental() {

    if (!this.rentform.valid) {
      this.toastrService.error("Form Alanları Eksik", "Dikkat");;
    } else {
      let rental = {
        customerId: this.customerId
      }
      let newRental = Object.assign({}, this.rentform.value, this.car[0], rental)
      this.toastrService.info('Ödeme Sayfasına Yönlendiliyorsunuz');
      this.localStorage.add('payment-data',JSON.stringify(newRental));
     
      this.router.navigate(['payments']);
      
    }
  }
}
