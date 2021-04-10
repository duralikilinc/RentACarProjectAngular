import { Component, OnInit } from '@angular/core';
import { LocalStorageService } from 'src/app/services/local-storage.service';
import { UserService } from 'src/app/services/user.service';
import { UserDetail } from '../../models/user/userDetail';

@Component({
  selector: 'app-navi',
  templateUrl: './navi.component.html',
  styleUrls: ['./navi.component.css']
})
export class NaviComponent implements OnInit {

  userDetail: UserDetail;


  constructor(private userService: UserService,
    private localStorage:LocalStorageService) { }

  ngOnInit(): void {
    this.getUser(this.localStorage.get("email"))
  }

  getUser(userMail: string) {
    this.userService.getUserDetailByEmail(userMail).subscribe(response => {
      this.userDetail = response.data
     
    })
  }

}
