import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { AuthService } from 'src/app/services/auth.service';
import { LocalStorageService } from 'src/app/services/local-storage.service';

@Component({
  selector: 'app-logout',
  templateUrl: './logout.component.html',
  styleUrls: ['./logout.component.css']
})
export class LogoutComponent implements OnInit {

  constructor( private router: Router,
    private authService: AuthService
   ) { }

  ngOnInit(): void {
    this.logout();
  }

  logout(){
    this.authService.logout();
    this.router.navigate(['login']);
    setTimeout(function () {
      location.reload();
    });
  }
}
