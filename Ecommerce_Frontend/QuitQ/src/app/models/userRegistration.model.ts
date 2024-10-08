// src/app/models/user.model.ts

export interface PersonalDetails {
    firstName: string;
    lastName: string;
    gender: string;
    dateOfBirth: string; // Use string format for dates, or consider using Date type with appropriate conversion.
    phoneNumber: string;
  }
  
  export interface Address {
    addressLine1: string;
    addressLine2?: string; // Optional field
    city: string;
    state: string;
    postalCode: string;
    country: string;
  }
  
  export interface UserRegistration {
    username: string;
    password: string;
    email: string;
    personalDetails: PersonalDetails;
    address: Address;
  }
  