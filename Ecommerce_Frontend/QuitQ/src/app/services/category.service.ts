import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { ParentCategory } from '../models/parent-category.model';
import { SubCategory } from '../models/sub-category.model';

@Injectable({
  providedIn: 'root'
})
export class CategoryService {
  private baseUrl = 'https://localhost:7264/api/Category';

  constructor(private http: HttpClient) { }

  // Get all parent categories
  getAllParentCategories(): Observable<ParentCategory[]> {
    return this.http.get<ParentCategory[]>(`${this.baseUrl}/All-parent-categories`);
  }

  // Get all sub-categories
  getAllSubCategories(): Observable<SubCategory[]> {
    return this.http.get<SubCategory[]>(`${this.baseUrl}/sub-categories`);
  }

  // Add a new parent category
  addParentCategory(parentCategory: ParentCategory): Observable<any> {
    return this.http.post<any>(`${this.baseUrl}/Add-parent-category`, parentCategory);
  }

  // Add a new sub-category
  addSubCategory(subCategory: SubCategory): Observable<any> {
    return this.http.post<any>(`${this.baseUrl}/Add-sub-category`, subCategory);
  }
  // Update an existing parent category
  updateParentCategory(category: ParentCategory): Observable<ParentCategory> {
    return this.http.put<ParentCategory>(`${this.baseUrl}/update-parent-category`, category);
  }

  // Update an existing subcategory
  updateSubCategory(subCategory: SubCategory): Observable<SubCategory> {
    return this.http.put<SubCategory>(`${this.baseUrl}/sub-category`, subCategory);
  }

  // Delete a parent category by ID
  deleteParentCategory(parentCategoryId: number): Observable<any> {
    return this.http.delete<any>(`${this.baseUrl}/parent-category/${parentCategoryId}`);
  }

  // Delete a sub-category by ID
  deleteSubCategory(subCategoryId: number): Observable<any> {
    return this.http.delete<any>(`${this.baseUrl}/sub-category/${subCategoryId}`);
  }
}
