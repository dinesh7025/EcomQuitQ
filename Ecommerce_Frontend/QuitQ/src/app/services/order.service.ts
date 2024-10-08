// services/order.service.ts
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Order, OrderItemStatus, OrderItemUser } from '../models/order.model';
import { PlaceOrderResponse } from '../models/orderResponse.model';
import { AdminOrder } from '../models/adminOrder.model';
import { SellerOrderItem } from '../models/sellerOrderItem.model';

@Injectable({
  providedIn: 'root'
})
export class OrderService {
  private readonly apiUrl = 'https://localhost:7264/api/Order';

  constructor(private http: HttpClient) {}

  // Place an order
  placeOrder(order: Order): Observable<PlaceOrderResponse> {
    return this.http.post<PlaceOrderResponse>(`${this.apiUrl}/place-order`, order);
  }

  // Update the status of an order item
  updateOrderItemStatus(orderItemId: number, status: OrderItemStatus): Observable<void> {
    return this.http.put<void>(`${this.apiUrl}/update-order-item-status/${orderItemId}`, { orderItemStatus: status });
  }
  // Fetch all orders for admin
  getAllOrders(): Observable<AdminOrder[]> {
    return this.http.get<AdminOrder[]>(`${this.apiUrl}/getAllOrders`);
  }

  // Fetch order items for seller
  getOrderItemsForSeller(sellerId: number): Observable<SellerOrderItem[]> {
    return this.http.get<SellerOrderItem[]>(`${this.apiUrl}/${sellerId}`);
  }
  getOrderHistory(userId: number): Observable<OrderItemUser[]> {
    return this.http.get<OrderItemUser[]>(`${this.apiUrl}/user/order-history/${userId}`);
  }
}
