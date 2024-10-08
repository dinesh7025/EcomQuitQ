import { Component, OnInit } from '@angular/core';
import { HeaderComponent } from '../header/header.component';
import { FooterComponent } from '../footer/footer.component';
import { CommonModule } from '@angular/common';
import { CategoryService } from '../../services/category.service';
import { ParentCategory } from '../../models/parent-category.model';
import { SubCategory } from '../../models/sub-category.model';
import { ProductListingComponent } from '../product-listing/product-listing.component';
import { FormsModule } from '@angular/forms';
import { Product } from '../../models/product.model';
import { ProductService } from '../../services/product.service';
import { BrandDTO } from '../../models/brand.model';
import { RouterLink } from '@angular/router';

@Component({
  selector: 'app-home',
  standalone: true,
  imports: [HeaderComponent, FooterComponent, CommonModule, ProductListingComponent, FormsModule,RouterLink],
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css'],
})
export class HomeComponent implements OnInit {
  parentCategories: ParentCategory[] = [];
  subCategories: SubCategory[] = []; 
  selectedParentCategory: ParentCategory | null = null;
  selectedSubCategory: SubCategory | null = null;
  minPrice: number | null = null;
  maxPrice: number | null = null;
  products: Product[] = [];
  selectedBrandId: number | null = null; 
  brands: BrandDTO[] = []; 
  filteredProducts: Product[] = [];
  searchTerm: string = '';

  targetParentCategories = ['Electronics', 'Fashion', 'Home & Kitchen', 'Beauty & Personal Care', 'Toys & Games'];
  categoryImages: { [key: string]: string } = {
    'Electronics': 'electronics.jpeg',
    'Fashion': 'fashion.jpeg',
    'Home & Kitchen': 'home_kitchen.jpeg',
    'Beauty & Personal Care': 'beauty_personal_care.jpeg',
    'Toys & Games': 'toys_games.jpeg',
  };
  activeParentId: number | null = null;

  banners = [
    { image: 'banner4.jpg' },
    { image: 'banner5.jpg' },
    { image: 'banner6.jpg' }
  ];
  activeBannerIndex: number = 0;
  private bannerIntervalId: any;

  constructor(
    private categoryService: CategoryService,
    private productService: ProductService
  ) {}

  ngOnInit(): void {
    this.startBannerChange();
    this.fetchCategories();
    this.loadProducts();
    this.loadBrands();
  }
  ngOnDestroy(): void {
    this.stopBannerChange(); // Stop the auto-change when the component is destroyed
  }
  // Start changing the banner automatically
  startBannerChange(): void {
    this.bannerIntervalId = setInterval(() => {
      this.changeBanner(this.activeBannerIndex + 1); // Change to the next banner
    }, 3000); // Change every 5 seconds
  }

  stopBannerChange(): void {
    clearInterval(this.bannerIntervalId); // Clear the interval to avoid memory leaks
  }

  // Change the active banner index
  changeBanner(newIndex: number): void {
    if (newIndex >= this.banners.length) {
      newIndex = 0; // Loop back to first banner
    }
    
    // Move the banner slider to the new index
    const slider = document.querySelector('.banner-slider') as HTMLElement;
    slider.style.transform = `translateX(-${newIndex * 100}%)`; // Slide left

    // Update the active index
    this.activeBannerIndex = newIndex;
  }

  loadBrands(): void { // Fetch brands from the service
    this.productService.getAllBrands().subscribe(brands => {
      this.brands = brands;
    });
  }

  loadCategories() {
    this.categoryService.getAllParentCategories().subscribe(categories => {
      this.parentCategories = categories;
    });
  }

  loadProducts() {
    this.productService.getAllProducts().subscribe(products => {
      this.products = products;
      this.filteredProducts = [...this.products]; // Initially display all products
      this.filterProducts(); // Apply filtering immediately
    });
  }

  selectParentCategory(parent: ParentCategory) {
    this.selectedParentCategory = parent;
    this.selectedSubCategory = null; 
    this.getSubCategoriesForParent(parent.parentCategoryId);
    console.log('Selected Parent Category:', this.selectedParentCategory);
    this.filterProducts(); // Apply filtering on selection
  }
  

  selectSubCategory(sub: SubCategory) {
    this.selectedSubCategory = sub;
    console.log('Selected Sub Category:'+ this.selectedSubCategory.subCategoryName)
    console.log('Selected Sub Category:'+ this.selectedSubCategory.subCategoryId)
    this.filterProducts(); // Apply filtering on selection
  }
  
  onSearch(term: string): void {
    this.searchTerm = term;
    this.filterProducts();  // Call filterProducts after search term changes
  }
  
  filterProducts() {
    this.filteredProducts = this.products.filter(product => {
      const matchesSearchTerm = product.productName.toLowerCase().includes(this.searchTerm.toLowerCase());
  
      // If no parent or subcategory is selected, show all products
      const isInCategory = (!this.selectedParentCategory && !this.selectedSubCategory) || 
                           (!this.selectedSubCategory && this.selectedParentCategory && 
                            this.subCategories.find(sub => sub.parentCategoryId === this.selectedParentCategory?.parentCategoryId && sub.subCategoryId === product.subCategoryId)) ||
                           product.subCategoryId === this.selectedSubCategory?.subCategoryId;
  
      const isInPriceRange = (!this.minPrice || product.price >= this.minPrice) &&
                             (!this.maxPrice || product.price <= this.maxPrice);

  
      return matchesSearchTerm && isInCategory && isInPriceRange;  
    });
  
    console.log('Filtered Products:', this.filteredProducts);
  }

  showSubcategories(parentId: number): void {
    this.activeParentId = parentId;
  }

  hideSubcategories(): void {
    this.activeParentId = null;
  }

  fetchCategories(): void {
    this.categoryService.getAllParentCategories().subscribe((parentData) => {
      this.parentCategories = parentData.filter(pc => 
        this.targetParentCategories.includes(pc.categoryName)
      );
    });

    this.categoryService.getAllSubCategories().subscribe((subData) => {
      this.subCategories = subData;
    });
  }

  getSubCategoriesForParent(parentCategoryId: number): SubCategory[] {
    return this.subCategories.filter(subCat => subCat.parentCategoryId === parentCategoryId);
  }

  getImageUrl(categoryName: string): string {
    return this.categoryImages[categoryName] || 'default.jpg'; // Provide a default image if category name doesn't match
  }

  viewProduct(productId: number): void {
    console.log('View product:', productId);
  }
}
