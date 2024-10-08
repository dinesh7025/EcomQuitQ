import { Component, OnInit } from '@angular/core';
import { WishlistProduct } from '../../models/wishList.model';
import { WishlistService } from '../../services/wish-list.service';
import { AuthService } from '../../services/auth-service.service';
import { ActivatedRoute, Router,RouterModule } from '@angular/router';
import { CommonModule } from '@angular/common';
import { CartService } from '../../services/cart.service';
import { HeaderComponent } from '../header/header.component';
import { FooterComponent } from '../footer/footer.component';

@Component({
  selector: 'app-wish-list',
  standalone: true,
  imports: [CommonModule, HeaderComponent,FooterComponent,RouterModule],
  templateUrl: './wish-list.component.html',
  styleUrl: './wish-list.component.css'
})
export class WishlistComponent implements OnInit {
  wishlist: WishlistProduct[] = [];
  userId: number = 0;

  constructor(
      private wishlistService: WishlistService,
      private authService: AuthService,
      private router:Router,
      private cartService:CartService
    ) {
    this.userId = this.authService.getUserIdFromToken()!;
  }

  ngOnInit(): void {
    if (this.userId > 0) {
      this.loadWishlist();
    } else {
      console.error('User not authenticated');
    }
  }
  

  loadWishlist(): void {
    this.wishlistService.getUserWishlist(this.userId).subscribe(
        (data) => {
            // Check if the response is an array and handle accordingly
            if (Array.isArray(data) && data.length > 0) {
                this.wishlist = data; // Assign non-empty wishlist
            } else {
                this.wishlist = []; // Set to an empty array if no items
                console.warn('No products in wishlist.'); // Log a warning
            }
            console.log('Wishlist data:', data);
        },
        (error) => {
            // Handle any other errors that may occur
            console.error('Error fetching wishlist:', error);
            this.wishlist = []; // Set to an empty array in case of error
        }
    );
}

  addToWishlist(productId: number): void {
    this.wishlistService.addToWishlist(this.userId, productId).subscribe(
      (response) => {
        console.log(response);
        this.loadWishlist(); 
      },
      (error) => {
        console.error('Error adding product to wishlist:', error);
      }
    );
  }

  removeFromWishlist(productId: number): void {
    this.wishlistService.removeFromWishlist(this.userId, productId).subscribe(
      (response) => {
        console.log(response);
        alert("Product removed form Wish List");
        this.loadWishlist();
      },
      (error) => {
        console.error('Error removing product from wishlist:', error);
      }
    );
  }
  addToCart(product: any) {
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
        alert("Product Added cart");
      },
      error => {
        console.error('Error adding product to cart:', error);
      }
    );
  }

  navigateToProductDetails(productId: number): void {
    this.router.navigate(['/product-details', productId]); // Adjust the route as needed
    
}}
