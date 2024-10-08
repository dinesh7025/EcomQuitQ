import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Product, AddProductRequest, ProductDetails, PostReview } from '../models/product.model';
import { BrandDTO } from '../models/brand.model';
import { ParentCategory } from '../models/parent-category.model';
import { SubCategory } from '../models/sub-category.model';

@Injectable({
  providedIn: 'root',
})
export class ProductService {
  private baseUrl1 = 'https://localhost:7264/api/Product'; // Base URL for the Product API
  private baseUrl2 = 'https://localhost:7264/api/Category';// base URl for the category API

  constructor(private http: HttpClient) {}

  // Add a new product
  addProduct(productRequest: AddProductRequest): Observable<any> {
    return this.http.post<AddProductRequest>(`${this.baseUrl1}/Addproduct`, productRequest);
  }
  

  // Update an existing product
  updateProduct(productRequest: AddProductRequest): Observable<any> {
    return this.http.put<AddProductRequest>(`${this.baseUrl1}/products/${productRequest.product.productId}`, productRequest);
  }
  

  // Get all products
  getAllProducts(): Observable<Product[]> {
    return this.http.get<Product[]>(`${this.baseUrl1}/all-product-with-seller`);
  }

  // Delete a product
  deleteProduct(productId: number): Observable<any> {
    return this.http.delete(`${this.baseUrl1}/${productId}`);
  }

  // Get all parent categories
  getAllParentCategories(): Observable<ParentCategory[]> {
    return this.http.get<ParentCategory[]>(`${this.baseUrl2}/All-parent-categories`);
  }

  // Get sub-categories by parent category ID
  getSubCategoriesByParentId(parentId: number): Observable<SubCategory[]> {
    return this.http.get<SubCategory[]>(`${this.baseUrl2}/sub-categories/parent/${parentId}`);
  }

   // Get all sub-categories
   getAllSubCategories(): Observable<SubCategory[]> {
    return this.http.get<SubCategory[]>(`${this.baseUrl2}/sub-categories`);
  }

  // Get all brands
  getAllBrands(): Observable<BrandDTO[]> {
    return this.http.get<BrandDTO[]>(`${this.baseUrl2}/brands`);
  }

  getProductDetails(productId: number): Observable<ProductDetails> {
    return this.http.get<ProductDetails>(`${this.baseUrl1}/details/${productId}`);
  }

  postReview(reviewDto: PostReview): Observable<PostReview> {
    return this.http.post<PostReview>('https://localhost:7264/api/ProductReview/add', reviewDto);
  }
}
