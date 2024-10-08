export interface SellerOrderItem {
    orderItemId: number;
    userName: string;
    productName: string;
    quantity: number;
    unitPrice: number;
    totalPrice: number;
    itemStatus: ItemStatus;
  }
  
  export enum ItemStatus {
    Pending = 0,
    Processed = 1,
    Shipped = 2,
    Delivered = 3,
    Cancelled = 4
  }
  