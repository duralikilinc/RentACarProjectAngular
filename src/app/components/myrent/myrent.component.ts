import { Component, OnInit } from '@angular/core';
import { Rental } from './../../models/rental/rental';
import { RentalService } from 'src/app/services/rental.service';
import { ActivatedRoute } from '@angular/router';
import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'app-myrent',
  templateUrl: './myrent.component.html',
  styleUrls: ['./myrent.component.css']
})
export class MyrentComponent implements OnInit {

  rents: Rental[] = [];

  constructor(private rentalService:RentalService,
    private activatedRoute: ActivatedRoute,
    private toastrService: ToastrService) { }

  ngOnInit(): void {

    this.activatedRoute.params.subscribe(params => {
      if (params["myrents"]){
          this.getRentalDetailByCustomerId(1);
      }

    })

  }


  getRentalDetailByCustomerId(customerId:number){
    this.rentalService.getRentalDetailByCustomerId(customerId).subscribe(response=>{
      this.rents=response.data
      this.toastrService.info(response.message,"")
    })
  }
}
