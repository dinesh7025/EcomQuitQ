import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Router } from '@angular/router';
import {jwtDecode} from 'jwt-decode';  // Import jwtDecode
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class AuthService {

  private loginUrl = 'https://localhost:7264/api/Auth/login';  // Your login API endpoint
  private tokenKey = 'token';  // Key for storing the JWT token

  constructor(private http: HttpClient, private router: Router) {}

  // Method to handle login
  login(usernameOrEmail: string, password: string): Observable<any> {
    const body = { usernameOrEmail, password };
    return this.http.post(this.loginUrl, body);  // Sending login request to the API
  }

  // Save the token in local storage
  setToken(token: string): void {
    localStorage.setItem(this.tokenKey, token);
  }

  // Get the token from local storage
  getToken(): string | null {
    return localStorage.getItem(this.tokenKey);
  }

  // Decode the JWT token and return its payload
  decodeToken(): any | null {
    const token = this.getToken();
    if (token) {
      try {
        return jwtDecode(token);  // Decode the token and return its payload
      } catch (error) {
        console.error('Error decoding token:', error);
        return null;
      }
    }
    return null;
  }

  // Get token expiry date
  getTokenExpiry(): Date | null {
    const decodedToken = this.decodeToken();
    if (decodedToken && decodedToken.exp) {
      return new Date(decodedToken.exp * 1000);  // Convert expiry time to milliseconds
    }
    return null;
  }

  // Check if the user is logged in
  isLoggedIn(): boolean {
    const token = this.getToken();
    if (token) {
      const expiry = this.getTokenExpiry();
      return expiry ? expiry > new Date() : false;  // Check if the token has expired
    }
    return false;
  }
 // Check if the user is logged out (opposite of isLoggedIn)
 isLoggedOut(): boolean {
  return !this.isLoggedIn();
}
  // Log out by clearing the token
  logout(): void {
    localStorage.removeItem(this.tokenKey);
    this.router.navigate(['/login']);
  }
  // New method to extract userId from token
  getUserIdFromToken(): number | null {
    const token = this.getToken();
    if (!token) {
    return null;
  }

  const decodedToken = this.decodeToken();
  return decodedToken?.UserId || null;  // Assuming 'userId' is part of the payload
}
  // Attach token to the Authorization header
  getAuthHeaders(): HttpHeaders {
    const token = this.getToken();
    if (token) {
      return new HttpHeaders({
        Authorization: `Bearer ${token}`
      });
    }
    return new HttpHeaders();
  }
}
