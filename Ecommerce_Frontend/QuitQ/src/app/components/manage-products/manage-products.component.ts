import { Component ,OnInit} from '@angular/core';
import { CommonModule } from '@angular/common'; // Import CommonModule
import { Product } from '../../models/product.model';
import { ProductService } from '../../services/product.service';
import { FormsModule, ReactiveFormsModule } from '@angular/forms'; // Required for ngModel
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { SubCategory } from '../../models/sub-category.model';
import { ParentCategory } from '../../models/parent-category.model';
import { BrandDTO } from '../../models/brand.model';
import { AddProductRequest } from '../../models/product.model';
import { AdminFooterComponent } from '../admin-footer/admin-footer.component';
import { AdminHeaderComponent } from '../admin-header/admin-header.component';
import { UploadImageService } from '../../services/upload-image.service';
declare var bootstrap: any;

@Component({
  selector: 'app-manage-products',
  standalone: true,
  imports: [CommonModule, FormsModule, ReactiveFormsModule, AdminHeaderComponent, AdminFooterComponent],
  templateUrl: './manage-products.component.html',
  styleUrl: './manage-products.component.css'
})
export class ManageProductComponent implements OnInit {
  products: Product[] = [];
  productForm: FormGroup;
  isFormVisible = false;
  isEditing = false;
  confirmProductId: number|null = null;
  isDeleteConfirmVisible = false;
  searchQuery = '';
  parentCategories: ParentCategory[] = []; 
  filteredSubCategories: SubCategory[] = []; 
  brands: BrandDTO[] = [];
  selectedFile: File | null = null;
  

  constructor(
    private productService: ProductService,
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
      imageUrl:['',Validators.required],
      subCategoryId: [0, Validators.required],
      brandId: [0, Validators.required],
      isActive: [true]
    });
  }

  ngOnInit(): void {
    this.loadProducts();
    this.loadParentCategories();
    this.loadBrands();
  }

  loadProducts(): void {
    this.productService.getAllProducts().subscribe(
      (response) => {
        this.products = response;
      },
      (error) => {
        console.error('Error loading products:', error);
      }
    );
  }

  searchProducts(): void {
    // Implement search functionality based on this.searchQuery
    this.productService.getAllProducts().subscribe(
      (response) => {
        this.products = response.filter(product =>
          product.productName.includes(this.searchQuery) || product.productId.toString().includes(this.searchQuery)
        );
      }
    );
  }

  openAddProductForm(): void {
    this.isFormVisible = true;
    this.isEditing = false;
    this.productForm.reset();
    this.filteredSubCategories = []; 

    const modal = new bootstrap.Modal(document.getElementById('productModal'));
    modal.show();
  }

  openEditProductForm(product: Product): void {
    this.isFormVisible = true;
    this.isEditing = true;
    this.productForm.patchValue({
      productId: product.productId,
      productName: product.productName,
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
    this.onParentCategoryChange({ target: { value: product.subCategoryId } });

     // Show the modal
     const modal = new bootstrap.Modal(document.getElementById('productModal'));
     modal.show();
  }

  closeForm(): void {
    this.isFormVisible = false;
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
            this.closeForm();
          });
        } else {
          this.productService.addProduct(productData).subscribe((response) => {
            alert(response.message);
            this.loadProducts();
            this.closeForm();
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