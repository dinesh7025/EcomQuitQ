export interface Product {
  productId: number;
  productName: string;
  sellerId: number;
  companyName: string;
  description: string;
  price: number;
  stockQuantity: number;
  imageUrl: string;
  dateAdded: Date;
  isActive: boolean;
  brandId: number;
  subCategoryId: number;
}

export interface AddProductRequest {
  product: {
    productId: number;
    productName: string;
    sellerId: number;
    description: string;
    price: number;
    stockQuantity: number;
    imageUrl: string;
    dateAdded: string;
    isActive: boolean;
    brandId: number;
    subCategoryId: number;
  }
}

export interface SellerProduct extends Product {
  productId: number;
  name: string;
  sellerId: number;
  description: string;
  price: number;
  stockQuantity: number;
  imageUrl: string;
  subCategoryId: number;
  brandId: number;
  brandName: string;
  isActive: boolean;
  restockLevel: number;
  lastRestocked: string; 
}


export interface ProductReview {
  reviewId: number;
  userId: number;
  username: string;
  rating: number;
  comment: string;
  reviewDate: Date;
}

export interface ProductDetails {
  productId: number;
  productName: string;
  brandName: string;
  price: number;
  description: string;
  imageUrl: string;
  stockQuantity: number;
  restockLevel: number;
  isLowStock: boolean;
  reviews: ProductReview[];
}
// src/app/models/review.model.ts
export interface PostReview {
  productId: number;
  userId: number;
  rating: number;
  comment: string;
}


