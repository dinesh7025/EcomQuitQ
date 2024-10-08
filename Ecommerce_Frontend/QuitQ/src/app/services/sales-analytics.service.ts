import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { SalesByCategory,SalesByProduct,SalesBySeller,DailySales,TopSellingProduct } from '../models/salesAnalytics.model';

@Injectable({
  providedIn: 'root'
})
export class SalesAnalyticsService {
  private baseUrl = 'https://localhost:7264/api/SalesAnalytics';
  private apiUrl = 'https://localhost:7264/api/Analytics';

  constructor(private http: HttpClient) {}

  getSalesByCategory(): Observable<SalesByCategory[]> {
    return this.http.get<SalesByCategory[]>(`${this.baseUrl}/SalesByCategory`);
  }

  getSalesByProduct(): Observable<SalesByProduct[]> {
    return this.http.get<SalesByProduct[]>(`${this.baseUrl}/SalesByProduct`);
  }

  getSalesBySeller(): Observable<SalesBySeller[]> {
    return this.http.get<SalesBySeller[]>(`${this.baseUrl}/SalesBySeller`);
  }

  getDailySales(): Observable<DailySales[]> {
    return this.http.get<DailySales[]>(`${this.baseUrl}/DailySales`);
  }

  getTopSellingProducts(): Observable<TopSellingProduct[]> {
    return this.http.get<TopSellingProduct[]>(`${this.baseUrl}/TopSellingProducts`);
  }

  getTotalUserRegistrations(): Observable<number> {
    return this.http.get<number>(`${this.apiUrl}/total-user-registrations`);
  }

  getTotalSellerRegistrations(): Observable<number> {
    return this.http.get<number>(`${this.apiUrl}/total-seller-registrations`);
  }
   // Method to get total revenue overall
   getTotalRevenue(): Observable<{ totalRevenue: number }> {
    return this.http.get<{ totalRevenue: number }>(`${this.baseUrl}/totalRevenue`);
  }

  // Method to get total revenue by a specific seller
  getRevenueBySeller(sellerId: number): Observable<{ sellerId: number; totalRevenue: number }> {
    return this.http.get<{ sellerId: number; totalRevenue: number }>(`${this.baseUrl}/sellerRevenue/${sellerId}`);
  }

  // Fetch sales by product for a specific seller
  getSalesByProductofSeller(sellerId: number): Observable<any> {
    return this.http.get(`${this.baseUrl}/sales-by-product/${sellerId}`);
  }

  // Fetch sales by month for a specific seller
  getSalesByMonth(sellerId: number): Observable<any> {
    return this.http.get(`${this.baseUrl}/sales-by-month/${sellerId}`);
  }

  // Fetch top-selling product for a specific seller
  getTopSellingProduct(sellerId: number): Observable<any> {
    return this.http.get(`${this.baseUrl}/top-selling-product/${sellerId}`);
  }
}