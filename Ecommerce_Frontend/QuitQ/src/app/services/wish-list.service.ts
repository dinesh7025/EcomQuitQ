import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { WishlistProduct } from '../models/wishList.model';

@Injectable({
  providedIn: 'root'
})
export class WishlistService {
  private baseUrl = 'https://localhost:7264/api/Wishlist'; // Base URL for the API

  constructor(private http: HttpClient) {}

  // Get the user's wishlist
  getUserWishlist(userId: number): Observable<WishlistProduct[]> {
    return this.http.get<WishlistProduct[]>(`${this.baseUrl}/user/${userId}`);
  }

  // Add a product to the wishlist
  addToWishlist(userId: number, productId: number): Observable<string> {
    return this.http.post<string>(`${this.baseUrl}/add?userId=${userId}&productId=${productId}`, {});
  }

  // Remove a product from the wishlist
  removeFromWishlist(userId: number, productId: number): Observable<string> {
    return this.http.delete<string>(`${this.baseUrl}/remove?userId=${userId}&productId=${productId}`);
  }
}
