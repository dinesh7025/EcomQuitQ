import { Component, OnInit, Input, SimpleChanges, OnChanges } from '@angular/core';
import { ProductService } from '../../services/product.service';
import { Product } from '../../models/product.model';
import { CommonModule } from '@angular/common';
import { CartService } from '../../services/cart.service';
import { CartItemDTO } from '../../models/cart.model';
import { AuthService } from '../../services/auth-service.service';
import { Router } from '@angular/router';
import { BrandDTO } from '../../models/brand.model';
import { Subject } from 'rxjs';
import { takeUntil } from 'rxjs/operators';

@Component({
  selector: 'app-product-listing',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './product-listing.component.html',
  styleUrls: ['./product-listing.component.css']
})
export class ProductListingComponent implements OnInit, OnChanges {
  
  @Input() searchTerm: string = '';
  @Input() minPrice: number | null = null; 
  @Input() maxPrice: number | null = null; 
  @Input() products: Product[] = []; 
  filteredProducts: Product[] = [];
  @Input() selectedBrandId: number | null = null; 
  brands: BrandDTO[] = []; 
  private unsubscribe$ = new Subject<void>();

  constructor(
      private productService: ProductService, 
      private cartService: CartService,
      private authService: AuthService,
      private router: Router) {}

  ngOnInit(): void {
    this.loadProducts();
    this.loadBrands();
  }

  ngOnChanges(changes: SimpleChanges): void {
    if (changes['products'] || changes['searchTerm'] || changes['minPrice'] || changes['maxPrice'] || changes['selectedBrandId']) {
      this.filterProducts(); 
    }
  }

  loadProducts(): void {
    this.productService.getAllProducts()
      .pipe(takeUntil(this.unsubscribe$))
      .subscribe(products => {
        this.products = products;
        this.filterProducts(); 
      });
  }

  loadBrands(): void {
    this.productService.getAllBrands()
      .pipe(takeUntil(this.unsubscribe$))
      .subscribe(brands => {
        this.brands = brands;
      });
  }

  addToCart(product: Product): void {
    const userId = this.authService.getUserIdFromToken();

    if (userId === null) {
      console.error('User is not logged in');
      alert('Please Login to Add Product to Cart');
      this.router.navigate(['/login']);
      return;
    }

    const cartItem: CartItemDTO = {
      productId: product.productId,
      quantity: 1, 
      price: product.price,
      totalPrice: product.price, 
      productName: product.productName, 
      imageUrl: product.imageUrl,
      cartItemId: 0
    };

    this.cartService.addToCart(userId, cartItem).subscribe(
      response => {
        console.log('Product added to cart:', response);
        // Optionally show success message
      },
      error => {
        console.error('Error adding product to cart:', error);
        // Optionally show error message
      }
    );
  }

  filterProducts(): void {
    console.log('Selected Brand ID:', this.selectedBrandId); // Log the selected brand ID
    console.log('Products:', this.products); // Log the products array

    this.filteredProducts = this.products.filter(product => {
        const matchesSearchTerm = product.productName.toLowerCase().includes(this.searchTerm.toLowerCase());
        const matchesPriceRange = (!this.minPrice || product.price >= this.minPrice) && 
                                   (!this.maxPrice || product.price <= this.maxPrice);
        const matchesBrand = this.selectedBrandId == null || product.brandId == this.selectedBrandId; // Filter by brand
        const isActive = product.isActive; // Ensure the product is active

        // Log the evaluation of each product
        console.log(`Product: ${product.productName}, Matches: ${matchesSearchTerm && matchesPriceRange && matchesBrand && isActive}`);
        return matchesSearchTerm && matchesPriceRange && matchesBrand && isActive; // Return products that match all criteria
    });

    // Log filtered products
    console.log('Filtered Products:', this.filteredProducts);
}


  viewProductDetails(productId: number): void {
    this.router.navigate(['/product-details', productId]);
  }

  trackByProductId(index: number, product: Product): number {
    return product.productId; // or any unique identifier
  }

  animateCart(event: Event): void {
    const button = (event.target as HTMLElement).closest('.add-to-cart-btn');
    
    if (button) {
      button.classList.add('cart-animate');

      setTimeout(() => {
        button.classList.remove('cart-animate');
      }, 1000); 
    }
  }

  ngOnDestroy(): void {
    this.unsubscribe$.next();
    this.unsubscribe$.complete();
  }
}
