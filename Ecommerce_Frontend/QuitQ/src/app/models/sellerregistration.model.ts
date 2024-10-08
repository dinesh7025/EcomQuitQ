// src/app/models/user.model.ts

export interface PersonalDetails {
    firstName: string;
    lastName: string;
    gender: string;
    dateOfBirth: string;
    phoneNumber: string;
}

export interface Address {
    addressLine1: string;
    addressLine2?: string;
    city: string;
    state: string;
    postalCode: string;
    country: string;
}

export interface SellerDetails {
    companyName: string;
    companyRegistrationNumber: string;
    gstNumber: string;
    businessType: string;
}

export interface SellerRegistration {
    username: string;
    password: string;
    email: string;
    personalDetails: PersonalDetails;
    address: Address;
    sellerDetails: SellerDetails;
}
