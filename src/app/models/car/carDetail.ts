import { CarImage } from "./carImage";

export interface CarDetail {
carId:number;
carName:string;
colorName:string;
colorId:number;
brandId:number;
brandName:string;
dailyPrice:number;
modelYear:number;
description:string;
carImages:CarImage[];
minFindexScore:number;
}