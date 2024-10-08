import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule, FormBuilder, FormGroup, Validators } from '@angular/forms';
import { SellerService } from '../../services/seller.service';
import { AuthService } from '../../services/auth-service.service';
import { AddProductRequest, Product, SellerProduct } from '../../models/product.model';
import { BrandDTO } from '../../models/brand.model';
import { ParentCategory } from '../../models/parent-category.model';
import { SubCategory } from '../../models/sub-category.model';
import { SellerDetails } from '../../models/user.model';
import { ProductService } from '../../services/product.service';
import { AdminFooterComponent } from '../admin-footer/admin-footer.component';
import { SellerHeaderComponent } from '../seller-header/seller-header.component';
import { UploadImageService } from '../../services/upload-image.service';

@Component({
  selector: 'app-manage-products-seller',
  standalone: true,
  imports: [CommonModule, FormsModule, ReactiveFormsModule,SellerHeaderComponent,AdminFooterComponent],
  templateUrl: './manage-products-seller.component.html',
  styleUrl: './manage-products-seller.component.css'
})
export class ManageProductsSellerComponent {
  products: SellerProduct[] = [];
  productForm: FormGroup;
  isModalVisible = false;
  isEditing = false;
  confirmProductId: number | null = null;
  isDeleteConfirmVisible = false;
  searchQuery = '';
  parentCategories: ParentCategory[] = [];
  filteredSubCategories: SubCategory[] = [];
  brands: BrandDTO[] = [];
  sellerId: number | null = null;
  noProductsMessage: string = '';
  selectedFile: File | null = null;


  constructor(
    private sellerService: SellerService, // Use the SellerService
    private authService: AuthService,
    private productService: ProductService, // Use AuthService to get user ID
    private fb: FormBuilder,
    private uploadImageService: UploadImageService
  ) {
    this.productForm = this.fb.group({
      productId: [0],
      productName: ['', Validators.required],
      sellerId: ['', Validators.required],
      description: [''],
      price: [0, Validators.required],
      dateAdded: [new Date().toISOString()],
      stockQuantity: [0, Validators.required],
      imageUrl: ['', Validators.required],
      parentCategoryId: [null],
      subCategoryId: [0, Validators.required],
      brandId: [0, Validators.required],
      isActive: [true]
    });
  }
  ngOnInit(): void {
    const userId = this.authService.getUserIdFromToken()!;
    this.fetchSellerDetails(userId); 
    this.loadParentCategories();
    this.loadBrands();
  }
  fetchSellerDetails(userId: number): void {
    this.sellerService.getSellerDetails(userId).subscribe({
      next: (details) => {
        this.sellerId = details.sellerId;
        console.log('Seller ID:', this.sellerId); // Check if sellerId is set
        this.loadProducts(); // Load products only after sellerId is fetched
      },
      error: (error) => {
        console.error('Error fetching seller details:', error);
      }
    });
  }

  loadProducts(): void {
    if (this.sellerId) {
      this.sellerService.getProductsBySellerId(this.sellerId).subscribe(
        (response) => {
          this.products = response;
          if (this.products.length === 0) {
            this.noProductsMessage = 'No products found. Click "Add Product" to add new products.';
          } else {
            this.noProductsMessage = ''; // Clear message if products are found
          }
        },
        (error) => {
          if (error.status === 404) {
            this.noProductsMessage = 'No products found. Click "Add Product" to add new products.';
          } else {
            console.error('Error loading products:', error);
          }
        }
      );
    }
  }
  searchProducts(): void {
    // Implement search functionality based on this.searchQuery
    if (this.sellerId) {
      this.sellerService.getProductsBySellerId(this.sellerId).subscribe(
        (response) => {
          this.products = response.filter(product =>
            product.name.includes(this.searchQuery) || product.productId.toString().includes(this.searchQuery)
          );
        }
      );
    }
  }
  openAddProductForm(): void {
    
    this.isEditing = false;
    this.productForm.reset();
    this.productForm.get('sellerId')?.enable();
    this.productForm.get('parentCategoryId')?.enable(); 
    this.productForm.get('subCategoryId')?.enable();
    this.filteredSubCategories = [];
    this.isModalVisible = true;
  }
  openEditProductForm(product: SellerProduct): void {
    this.isModalVisible = true;
    
    this.productForm.patchValue({
      productId: product.productId,
      productName: product.name,
      sellerId: product.sellerId,
      description: product.description,
      price: product.price,
      imageUrl: product.imageUrl,
      stockQuantity: product.stockQuantity,
      subCategoryId: product.subCategoryId,
      brandId: product.brandId,
      dateAdded: new Date().toISOString(),
      isActive: product.isActive
    });
    // Disable specific fields while editing
    this.productForm.get('sellerId')?.disable();
    this.productForm.get('parentCategoryId')?.disable();
    this.productForm.get('subCategoryId')?.disable();
    this.onParentCategoryChange({ target: { value: product.subCategoryId } });
    this.isEditing = true;
  }

  closeModal(): void {
    this.isModalVisible = false;
    this.isEditing = false;
  }
  onFileSelected(event: any): void {
    const file: File = event.target.files[0];
    if (file) {
      this.selectedFile = file;
    }
  }

  submitProductForm(): void {
    if (this.selectedFile) {
      // Upload image to Azure Blob Storage
      this.uploadImageService.uploadFileToBlob(this.selectedFile).then((imageUrl) => {
        // Once the image is uploaded, set the imageUrl in the form
        this.productForm.patchValue({ imageUrl });

        // Proceed to submit the form
        const productData = {
         product:{
          productId: this.productForm.get('productId')!.value || 0,
          productName: this.productForm.get('productName')!.value,
          sellerId: this.productForm.get('sellerId')!.value || 0,
          description: this.productForm.get('description')!.value,
          price: this.productForm.get('price')!.value || 0,
          stockQuantity: this.productForm.get('stockQuantity')!.value || 0,
          imageUrl: imageUrl, // Use the uploaded image URL
          dateAdded: new Date().toISOString(),
          subCategoryId: this.productForm.get('subCategoryId')!.value,
          brandId: this.productForm.get('brandId')!.value || 0,
          isActive: this.productForm.get('isActive')!.value|| true
         }
        };

        console.log('Product Data:', productData);
       
        if (this.isEditing) {
          this.productService.updateProduct(productData).subscribe((response) => {
            alert('Product updated successfully!');
            this.loadProducts();
            this.closeModal();
          });
        } else {
          this.productService.addProduct(productData).subscribe((response) => {
            alert(response.message);
            this.loadProducts();
            this.closeModal();
          });
        }
      });
    } else {
      alert('Please select an image to upload.');
    }
  }
  confirmDelete(productId: number): void {
    this.confirmProductId = productId;
    this.isDeleteConfirmVisible = true;
  }

  deleteProduct(): void {
    if (this.confirmProductId !== null) {
      this.productService.deleteProduct(this.confirmProductId).subscribe(
        response => {
          this.loadProducts();
          alert(`Product with ID: ${this.confirmProductId} has been deleted successfully.`);
          this.isDeleteConfirmVisible = false;
          this.confirmProductId = null;
        },
        error => {
          alert('Error deleting product. Please check console.');
          console.error('Error deleting product:', error);
        }
      );
    }
  }
  // Call deleteProduct when the user confirms deletion
  onConfirmDelete(): void {
    this.deleteProduct();
  }

  loadParentCategories(): void {
    this.productService.getAllParentCategories().subscribe(categories => {
      this.parentCategories = categories;
    });
  }

  onParentCategoryChange(event: any): void {
    const selectedParentId = event.target.value;
    this.productService.getSubCategoriesByParentId(selectedParentId).subscribe(subCategories => {
      this.filteredSubCategories = subCategories;
    });
  }

  loadBrands(): void {
    this.productService.getAllBrands().subscribe(brands => {
      this.brands = brands;
    });
  }
}

