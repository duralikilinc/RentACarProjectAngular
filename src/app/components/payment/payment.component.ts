import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import { CarDetail } from 'src/app/models/car/carDetail';
import { CarService } from 'src/app/services/car.service';
import { PaymentService } from './../../services/payment.service';
import { CrediCard } from './../../models/crediCard/crediCard';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { LocalStorageService } from './../../services/local-storage.service';
import { RentalService } from 'src/app/services/rental.service';
import { ErrorHelper } from './../../helpers/errorHelper';


@Component({
  selector: 'app-payment',
  templateUrl: './payment.component.html',
  styleUrls: ['./payment.component.css']
})
export class PaymentComponent implements OnInit {

  carDetails!: CarDetail[];
  carFindexScore: number;
  crediCards: CrediCard[];
  paymentform: FormGroup;
  rentalData: any;
  isChecked: boolean = false;


  constructor(
    private paymentService: PaymentService,
    private toastrService: ToastrService,
    private formBuilder: FormBuilder,
    private rentalService: RentalService,
    private localStorage: LocalStorageService,
    private router: Router) { }

  ngOnInit(): void {
    this.getRentalData();
    this.createPaymentForm();
  }

  createPaymentForm() {
    this.paymentform = this.formBuilder.group({
      number: ["", Validators.required],
      fullName: ["", Validators.required],
      cvv: ["", Validators.required],
      expirationDate: ["", Validators.required]
    })
  }

  getRentalData() {
    this.rentalData = JSON.parse((this.localStorage.get('payment-data') || '{}'));
    this.getAllByUserId(this.rentalData.customerId);
  }
  payWithSavedCard(card: any) {
    this.addRental();
  }
  setCardClass() {

    if (this.crediCards != null) {
      return 'col-md-7';
    } else {
      return 'col-md-12';
    }
  }

  //müşterinin kayıtlı kredi kart listesi
  getAllByUserId(customerId: number) {
    this.paymentService.getAllByUserId(customerId).subscribe(response => {
      this.crediCards = response.data
    }, responseError => {
      console.log(responseError)
    })
  }
  SaveCard() {
    if (this.isChecked == true) {
      let cardModel = Object.assign({}, Number(this.rentalData.customerId), this.paymentform.value
      );
      this.paymentService.crediCardAdd(cardModel).subscribe(
        (response) => {
          this.toastrService.success(response.message);
        },
        (responseError) => {
          this.toastrService.error(
            responseError.error.message,
            'Kart Kaydedilemedi'
          );
        }
      );
    }
  }

  addRental() {
   
    if (this.isChecked) {
      this.SaveCard();
    } else {
      this.rentalService.rentalAdd(this.rentalData).subscribe(response => {
        this.toastrService.info(response.message, "")
        this.router.navigate(['']);
        setTimeout(function () {
          location.reload();
        });
      },
        (responseError) => {
          this.toastrService.error(ErrorHelper.getMessage(responseError), " 'Ödeme Başarısız'")
        }

      )
    }
  }
}
