import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { CartDTO, CartItemDTO } from '../models/cart.model';

@Injectable({
  providedIn: 'root'
})
export class CartService {

  private baseUrl = 'https://localhost:7264/api/Cart';

  constructor(private http: HttpClient) {}

  // Get cart by user ID
  getCartByUserId(userId: number): Observable<CartDTO> {
    return this.http.get<CartDTO>(`${this.baseUrl}/${userId}`);
  }

  // Add item to cart
  addToCart(userId: number, cartItem: CartItemDTO): Observable<any> {
    return this.http.post(`${this.baseUrl}/add/${userId}`, cartItem);
  }

  // Update cart
  updateCart(cart: CartDTO): Observable<any> {
    return this.http.put<any>(`${this.baseUrl}/update`, cart);
  }

  // Remove item from cart
  removeFromCart(userId: number, cartItemId: number): Observable<any> {
    return this.http.delete(`${this.baseUrl}/remove/${userId}/${cartItemId}`);
  }
}
