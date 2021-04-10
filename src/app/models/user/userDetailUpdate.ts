export interface UserDetailUpdateModel {
    id: number;
    customerId: number;
    firstName: string;
    lastName: string;
    companyName: string;
    currentPassword: string;
    newPassword: string;
  }