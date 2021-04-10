import { Component, OnInit } from '@angular/core';
import { Brand } from 'src/app/models/brand/brand';
import { Color } from 'src/app/models/color/color';
import { BrandService } from 'src/app/services/brand.service';
import { ColorService } from 'src/app/services/color.service';

@Component({
  selector: 'app-car-filter',
  templateUrl: './car-filter.component.html',
  styleUrls: ['./car-filter.component.css']
})
export class CarFilterComponent implements OnInit {

  colors: Color[];
  brands: Brand[];
  brandIdFilter : number;
  colorIdFilter : number;
  constructor(private colorService:ColorService,private brandService:BrandService) { }

  ngOnInit(): void {
    this.getColors();
    this.getBrands(); 
  }
  getColors(){
    this.colorService.getColors().subscribe(response=>{
      this.colors=response.data;
    })
  }
  getBrands(){
    this.brandService.getBrands().subscribe(response=>{
      this.brands = response.data;
    })
  }
  getSelectedBrand(brandId:number){
    if (this.brandIdFilter == brandId) {
      return true;
    } else {
      return false;
    }
  }

  getSelectedColor(colorId:number){
    if (this.colorIdFilter == colorId) {
      return true;
    } else {
      return false;
    }
  }
}
