export interface Discount {
    discountId: number;
    discountCode: string;
    description: string;
    discountType: DiscountType; // Use enum
    discountValue: number;
    startDate: Date;
    endDate: Date;
    isActive: boolean;
  }
  
  export enum DiscountType {
    Percentage = 0,
    FixedAmount = 1
  }
  