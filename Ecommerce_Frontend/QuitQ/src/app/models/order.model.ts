// models/order.model.ts
export interface Order {
    userId: number;
    orderDate: Date;
    totalAmount: number;
    shippingAddressId: number;
    billingAddressId: number;
    orderStatus: OrderStatus;
    orderItems: OrderItem[];
    payments: Payment[];
  }
  
  export interface OrderItem {
    productId: number;
    sellerId: number;
    quantity: number;
    unitPrice: number;
    totalPrice: number;
    itemStatus: OrderItemStatus;
  }
  
  export interface Payment {
    paymentDate: Date;
    paymentAmount: number;
    paymentMethod: PaymentMethod;
    paymentStatus: PaymentStatus;
  }
  
  // Enums for statuses
  export enum OrderStatus {
    Pending = 0,
    Processed = 1,
    Shipped = 2,
    Delivered = 3,
    Cancelled = 4
  }
  
  export enum OrderItemStatus {
    Pending = 0,
    Processed = 1,
    Shipped = 2,
    Delivered = 3,
    Cancelled =4
  }
  
 // models/order.model.ts
export enum PaymentMethod {
    CreditCard = 0,
    DebitCard = 1,
    NetBanking = 2,
    UPI = 3,
    COD = 4
  }
  
  
  export enum PaymentStatus {
    Pending = 0,
    Completed = 1,
    Failed = 2
  }
  
  export interface OrderItemUser {
    orderItemId: number; // Unique identifier for the order item
    productName: string; // Name of the product
    quantity: number; // Quantity of the product ordered
    unitPrice: number; // Unit price of the product
    totalPrice: number; // Total price for the ordered quantity
    itemStatus: string; // Status of the order item (e.g., Processed, Pending)
    userName: string; // Username of the user who placed the order
    imageUrl: string; // URL of the product image
}
