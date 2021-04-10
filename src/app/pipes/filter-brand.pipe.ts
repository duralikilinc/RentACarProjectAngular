import { Pipe, PipeTransform } from '@angular/core';
import { Brand } from './../models/brand/brand';

@Pipe({
  name: 'filterBrand'
})
export class FilterBrandPipe implements PipeTransform {

  transform(value: Brand[], filterText: string): Brand[] {
    filterText=filterText?filterText.toLowerCase():"";
    return filterText?value.filter((p:Brand)=>p.name.toLowerCase().indexOf(filterText)!==-1):value;
  }

}
