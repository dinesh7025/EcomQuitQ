import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';
import { UserRegistration } from '../models/userRegistration.model';
import { SellerRegistration } from '../models/sellerregistration.model';

@Injectable({
  providedIn: 'root'
})
export class RegistrationService {
  private apiUrl = 'https://localhost:7264/api/User';

  constructor(private http: HttpClient) {}
  registerUser(user: UserRegistration): Observable<UserRegistration> {
    return this.http.post<UserRegistration>(`${this.apiUrl}/RegisterUser`, user);    
  }

   registerSeller(seller: SellerRegistration): Observable<SellerRegistration> {
    return this.http.post<SellerRegistration>(`${this.apiUrl}/RegisterSeller`, seller);
  }
}
