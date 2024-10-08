import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { ProductService } from '../../services/product.service';
import { PostReview, ProductDetails } from '../../models/product.model';
import { AuthService } from '../../services/auth-service.service';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { WishlistService } from '../../services/wish-list.service';
import { CartService } from '../../services/cart.service';
import { Subscription } from 'rxjs';
import { HeaderComponent } from '../header/header.component';
import { FooterComponent } from '../footer/footer.component';

@Component({
  selector: 'app-product-details',
  standalone: true,
  imports: [CommonModule,FormsModule, HeaderComponent,FooterComponent],
  templateUrl: './product-details.component.html',
  styleUrl: './product-details.component.css'
})
export class ProductDetailsComponent implements OnInit{

  productId!: number;
  productDetails: ProductDetails = { // Initialize with a default value
    productId: 0,
    productName: '',
    brandName: '',
    price: 0,
    description: '',
    imageUrl: '',
    stockQuantity:0,
    restockLevel:0,
    isLowStock: false,
    reviews: []
  };
  review = { rating: 0, comment: '' };
  averageRating: number = 0;
  stars: number[] = [1, 2, 3, 4, 5];
  isInWishlist = false; 
  userId!: number;
  private routeSubscription!: Subscription;

  constructor(
    private route: ActivatedRoute,
    private productService: ProductService,
    private authService: AuthService,
    private wishListService: WishlistService,
    private cartService: CartService
  ) {  
      this.userId = this.authService.getUserIdFromToken()!;
    }
  ngOnInit(): void {
   // Listen for route parameter changes
   this.routeSubscription = this.route.paramMap.subscribe(params => {
    this.productId = Number(params.get('id'));
    this.loadProductDetails();

    if (this.userId) {
      // Check if the product is in the user's wishlist when the route changes
      this.checkIfInWishlist();
    }
  });
  }

  checkIfInWishlist(): void {
    this.wishListService.getUserWishlist(this.userId).subscribe((wishlist) => {
      this.isInWishlist = wishlist.some((item) => item.productId === this.productDetails.productId);
    });
  }

  loadProductDetails(): void {
    this.productService.getProductDetails(this.productId).subscribe(
      (data) => {
        this.productDetails = data;
        console.log(data);
        this.calculateAverageRating();
      },
      (error) => {
        console.error('Error fetching product details:', error);
      }
    );
  }

  calculateAverageRating(): void {
    if (this.productDetails.reviews.length > 0) {
      const total = this.productDetails.reviews.reduce((sum, review) => sum + review.rating, 0);
      this.averageRating = total / this.productDetails.reviews.length || 0;
    }
  }
  toggleWishlist() {
    if (this.userId === null) {
      alert('Please Login to add or remove from Wishlist');
      return;
    }
    
    if (this.isInWishlist) {
      // Call service to remove from wishlist
      this.wishListService.removeFromWishlist(this.userId,this.productDetails.productId)
        .subscribe(() => {
          this.isInWishlist = false;
          console.log('removed');
        });
    } else {
      // Call service to add to wishlist
      this.wishListService.addToWishlist(this.userId,this.productDetails.productId)
        .subscribe(() => {
          this.isInWishlist = true;
          console.log('added');
        });
    }
  }
  addToCart(product: ProductDetails) {
    if (this.userId === null) {
      alert('Please Login to Add Product to Cart');
      return;
    }
    const cartItem = {
      productId: product.productId,
      quantity: 1,
      price: product.price,
      totalPrice: product.price,
      productName: product.productName,
      imageUrl: product.imageUrl,
      cartItemId: 0
    };
    
    this.cartService.addToCart(this.userId, cartItem).subscribe(
      response => {
        console.log('Product added to cart:', response);
      },
      error => {
        console.error('Error adding product to cart:', error);
      }
    );
  }

  setReviewRating(rating: number) {
    this.review.rating = rating;
  }
  selectStarRating(star: number): void {
    this.review.rating = star;
  }

  postReview() {
    if (!this.userId) {
      alert('Please login to post a review');
      return;
    }
    if (this.review.rating === 0) {
      alert('Please select a rating before submitting your review.');
      return;
    }

    const reviewDto:PostReview = {
      productId: this.productDetails.productId,
      userId: this.userId,
      rating: this.review.rating,
      comment: this.review.comment,
    };

    this.productService.postReview(reviewDto).subscribe(
      () => {
        this.review = { rating: 0, comment: '' };
        this.loadProductDetails(); 
      },
      error => {
        console.error('Error posting review:', error);
        alert('There was an error posting your review. Please try again.');
      }
    );
  }
  ngOnDestroy(): void {
    // Unsubscribe from the route observable to avoid memory leaks
    if (this.routeSubscription) {
      this.routeSubscription.unsubscribe();
    }
  }

}
