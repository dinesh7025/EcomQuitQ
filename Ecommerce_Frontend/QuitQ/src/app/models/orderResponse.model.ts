import { OrderItemStatus, OrderStatus, PaymentMethod, PaymentStatus } from "./order.model";

// models/place-order-response.model.ts
export interface PlaceOrderResponse {
    orderId: number;
    totalAmount: number;
    orderDate: Date;
    orderStatus: OrderStatus;
    orderItems: OrderItemResponse[];
    payments: PaymentResponse[];
  }
  
  export interface OrderItemResponse {
    productId: number;
    sellerId: number;
    quantity: number;
    unitPrice: number;
    totalPrice: number;
    itemStatus: OrderItemStatus;
  }
  
  export interface PaymentResponse {
    paymentDate: Date;
    paymentAmount: number;
    paymentMethod: PaymentMethod;
    paymentStatus: PaymentStatus;
  }
  