import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class CountryStateCityService {

  private apiUrl = 'https://thingproxy.freeboard.io/fetch/https://restcountries.com/v3.1/all';

  constructor(private http: HttpClient) { }

  // Method to fetch all countries
  getCountries(): Observable<any> {
    return this.http.get<any>(this.apiUrl);
  }
}
