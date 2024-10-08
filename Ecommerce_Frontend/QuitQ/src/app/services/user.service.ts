import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { User, UpdateUser} from '../models/user.model';
import { HttpClient } from '@angular/common/http';
import { Address } from '../models/address.model';
import { UserProfile } from '../models/userProfile.model';

@Injectable({
  providedIn: 'root'
})
export class UserService {

  private baseUrl = 'https://localhost:7264/api/User';

  constructor(private http: HttpClient) {}

  // Method to get all users
  getUsers(): Observable<User[]> {
    return this.http.get<User[]>(`${this.baseUrl}/get-all-users`);
  }

  updateUser(userId: number, user: UpdateUser): Observable<UpdateUser> {
    return this.http.put<UpdateUser>(`${this.baseUrl}/UpdateUser/${userId}`, user);
  }
  // Method to delete a user (or seller) by ID
  deleteUser(userId: number): Observable<void> {
    return this.http.delete<void>(`${this.baseUrl}/DeleteUser/${userId}`);
  }

  // Method to get user address by userId
  getUserAddress(userId: number): Observable<Address[]> {
    return this.http.get<Address[]>(`${this.baseUrl}/userAddress/${userId}`);
  }
   // Get user profile by ID
   getUserProfile(userId: number): Observable<UserProfile> {
    return this.http.get<UserProfile>(`${this.baseUrl}/${userId}`);
  }

  // Update user profile
  updateUserProfile(user: UserProfile): Observable<UserProfile> {
    return this.http.put<UserProfile>(this.baseUrl, user);
  }
}
