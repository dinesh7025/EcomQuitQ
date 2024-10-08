export interface AdminOrder {
    orderId: number;
    userName: string;
    orderDate: Date;
    totalAmount: number;
    orderStatus: OrderStatus;
  }
  
  export enum OrderStatus {
    Pending = 0,
    Processed = 1,
    Shipped = 2,
    Delivered = 3,
    Cancelled = 4
  }
  