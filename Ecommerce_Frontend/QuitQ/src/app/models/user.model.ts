export interface User {
    userId: number;
    userName: string;
    email: string;
    role: string;
    dateCreated: Date;
    isActive: boolean;
    fullName: string;
    gender: string;
    dateOfBirth: Date;
    phoneNumber: string;
    address: string;
  }
 // user.model.ts
export interface UpdateUser {
  userId:number,
  username: string;
  email: string;
  isActive: boolean;
}
export interface SellerDetails {
  sellerId: number;
  userId: number;
  companyName: string;
  companyRegistrationNumber: string;
  gstNumber: string;
  businessType: string;
}
