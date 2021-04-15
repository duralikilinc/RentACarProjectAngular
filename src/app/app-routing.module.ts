import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AccountComponent } from './components/account/account.component';
import { BrandComponent } from './components/brand/brand.component';
import { CarComponent } from './components/car/car.component';
import { LoginComponent } from './components/login/login.component';
import { LogoutComponent } from './components/logout/logout.component';
import { MyrentComponent } from './components/myrent/myrent.component';
import { PaymentComponent } from './components/payment/payment.component';
import { RegisterComponent } from './components/register/register.component';
import { RentAddComponent } from './components/rent-add/rent-add.component';
import { RentComponent } from './components/rent/rent.component';
import { LoginGuard } from './guards/login.guard';

const routes: Routes = [
  { path: "", pathMatch: "full", component: CarComponent }, // Anasayfa için
  { path: "cars", component: CarComponent },
  { path: "cars/brands/:brandId", component: CarComponent },
  { path: "cars/colors/:colorId", component: CarComponent },
  { path: "cars/filter/:brandId/:colorId", component: CarComponent },
  { path: "brands", component: BrandComponent },
  { path: "login", component: LoginComponent },
  { path: "myrents", component: MyrentComponent, canActivate: [LoginGuard] },
  { path: "logout", component: LogoutComponent },
  { path: "signup", component: RegisterComponent },
  { path: "account", component: AccountComponent, canActivate: [LoginGuard] },
  { path: "rent/:carId", component: RentComponent, canActivate: [LoginGuard] },
  { path: "payments", component: PaymentComponent, canActivate: [LoginGuard] },
  { path: 'rentCar', component: RentAddComponent, canActivate: [LoginGuard] }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
