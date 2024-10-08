import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Discount } from '../models/discount.model';

@Injectable({
  providedIn: 'root'
})
export class DiscountService {

  private apiUrl = 'https://localhost:7264/api/Discount';

  constructor(private http: HttpClient) {}

  getDiscountByCode(discountCode: string): Observable<Discount> {
    return this.http.get<Discount>(`${this.apiUrl}/getByCode/${discountCode}`);
  }

}
