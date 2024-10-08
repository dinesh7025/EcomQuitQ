export interface UserProfile {
    userId?: number;
    username?: string; // Made optional
    email: string;
    dateCreated?: string; // Made optional
    personalDetails: {
      firstName: string;
      lastName: string;
      gender: string;
      dateOfBirth: string;
      phoneNumber: string;
    };
    address: {
      addressLine1: string;
      addressLine2?: string; // Made optional
      city: string;
      state: string;
      postalCode: string;
      country: string;
    };
  }
  