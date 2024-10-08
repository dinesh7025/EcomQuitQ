import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { SellerProduct } from '../models/product.model';
import { SellerDetails } from '../models/user.model';
import { ItemStatus } from '../models/sellerOrderItem.model';

@Injectable({
  providedIn: 'root'
})
export class SellerService {
  private apiUrl = 'https://localhost:7264/api';

  constructor(private http: HttpClient) {}

  // Fetch products for a specific seller
  getProductsBySellerId(sellerId: number): Observable<SellerProduct[]> {
      return this.http.get<SellerProduct[]>(`${this.apiUrl}/Product/seller/${sellerId}`);
  }

  // Fetch seller details using userId
  getSellerDetails(userId: number): Observable<SellerDetails> {
      return this.http.get<SellerDetails>(`${this.apiUrl}/User/sellerDetails/${userId}`);
  }
  // Update the status of an order item
  updateOrderItemStatus(orderItemId: number, status: ItemStatus): Observable<void> {
    return this.http.put<void>(`https://localhost:7264/api/Order/update-order-item-status/${orderItemId}`,status);
  }
}