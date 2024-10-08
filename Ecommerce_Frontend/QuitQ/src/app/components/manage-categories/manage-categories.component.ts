import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { CategoryService } from '../../services/category.service';
import { ParentCategory } from '../../models/parent-category.model';
import { SubCategory } from '../../models/sub-category.model'; 
import { FormsModule } from '@angular/forms';
import { AdminFooterComponent } from '../admin-footer/admin-footer.component';
import { AdminHeaderComponent } from '../admin-header/admin-header.component';

@Component({
  selector: 'app-manage-categories',
  standalone: true,
  imports: [CommonModule, FormsModule, AdminFooterComponent, AdminHeaderComponent],
  templateUrl: './manage-categories.component.html',
  styleUrls: ['./manage-categories.component.css']
})
export class ManageCategoriesComponent implements OnInit {

  parentCategories: ParentCategory[] = [];
  filteredParentCategories: ParentCategory[] = []; 
  subCategories: SubCategory[] = [];
  filteredSubCategories: SubCategory[] = [];    
  
  showDeleteModal: boolean = false;
  categoryToDelete: number | null = null;
  deleteType: 'parent' | 'sub' | null = null; 

  newParentCategory: ParentCategory = {
    parentCategoryId: 0,
    categoryName: '',
    description: ''
  };

  newSubCategory: SubCategory = {
    subCategoryId: 0,
    parentCategoryId: 0,
    parentcategoryName:'',
    subCategoryName: '',
    description: ''
  };

  // Track whether we're adding or editing
  isEditingParent = false;
  isEditingSub = false;

  // Search Queries
  searchParentQuery: string = '';  
  searchSubQuery: string = '';  
  
  // Show forms
  showAddParentCategoryForm = false;
  showAddSubCategoryForm = false;

  constructor(private categoryService: CategoryService) {}

  ngOnInit(): void {
    this.getCategories();
  }

  // Fetch categories and sub-categories
  getCategories(): void {
    this.categoryService.getAllParentCategories().subscribe((categories: ParentCategory[]) => {
      this.parentCategories = categories;
      this.filteredParentCategories = categories;  
    });

    this.categoryService.getAllSubCategories().subscribe((subCategories: SubCategory[]) => {
      this.subCategories = subCategories;
      this.filteredSubCategories = subCategories;  
    });
  }

  // Open the Add Parent Category form
  openAddParentCategoryForm() {
    this.newParentCategory = {
      parentCategoryId: 0,
      categoryName: '',
      description: ''
    };  // Reset the form fields
    this.isEditingParent = false;  // Set editing flag to false
    this.showAddParentCategoryForm = true;  // Show the form
  }

  // Open the Add Sub Category form
  openAddSubCategoryForm() {
    console.log(`opening add sub category`);
    this.newSubCategory = {
      subCategoryId: 0,
      parentCategoryId: 0,
      parentcategoryName: '',
      subCategoryName: '',
      description: ''
    };  // Reset the form fields
    this.isEditingSub = false;  // Set editing flag to false
    this.showAddSubCategoryForm = true;  // Show the form
  }

  // Close the Parent Category form
  closeAddParentCategoryForm() {
    this.showAddParentCategoryForm = false;
  }

  // Close the Sub Category form
  closeAddSubCategoryForm() {
    this.showAddSubCategoryForm = false;
  }

  // Add or edit Parent Category
  saveParentCategory() {
    if (this.isEditingParent) {
      // Update existing category
      this.categoryService.updateParentCategory(this.newParentCategory).subscribe(() => {
        this.getCategories();  // Refresh categories
        this.closeAddParentCategoryForm();
      });
    } else {
      // Add new category
      this.categoryService.addParentCategory(this.newParentCategory).subscribe(() => {
        this.getCategories(); 
        alert(`New caregory Added ${this.newParentCategory.categoryName}`) // Refresh categories
        this.closeAddParentCategoryForm();
      });
    }
  }

  // Add or edit Sub Category
  saveSubCategory() {
    if (this.isEditingSub) {
      // Update existing sub-category
      this.categoryService.updateSubCategory(this.newSubCategory).subscribe(() => {
        this.getCategories();  // Refresh sub-categories
        this.closeAddSubCategoryForm();
      });
    } else {
      // Add new sub-category
      this.categoryService.addSubCategory(this.newSubCategory).subscribe(() => {
        this.getCategories();
        alert(`New caregory Added ${this.newSubCategory.subCategoryName}`)  // Refresh sub-categories
        this.closeAddSubCategoryForm();
      });
    }
  }

  // Edit Parent Category
  editParentCategory(parentCategoryId: number) {
    const parentCategory = this.parentCategories.find(pc => pc.parentCategoryId === parentCategoryId);
    if (parentCategory) {
      this.newParentCategory = { ...parentCategory };  // Populate the form with category data
      this.isEditingParent = true;  // Set editing flag to true
      this.showAddParentCategoryForm = true;  // Show the form
    }
  }

  // Edit Sub Category
  editSubCategory(subCategoryId: number) {
    const subCategory = this.subCategories.find(sc => sc.subCategoryId === subCategoryId);
    if (subCategory) {
      this.newSubCategory = { ...subCategory };  // Populate the form with sub-category data
      this.isEditingSub = true;  // Set editing flag to true
      this.showAddSubCategoryForm = true;  // Show the form
    }
  }

  // Search Parent Categories
  searchParentCategories(): void {
    const query = this.searchParentQuery.toLowerCase();
    this.filteredParentCategories = this.parentCategories.filter(category =>
      category.categoryName.toLowerCase().includes(query) ||
      category.parentCategoryId.toString().includes(query)
    );
  }

  // Search Sub Categories
  searchSubCategories(): void {
    const query = this.searchSubQuery.toLowerCase();
    this.filteredSubCategories = this.subCategories.filter(subCategory =>
      subCategory.subCategoryName.toLowerCase().includes(query) ||
      subCategory.parentCategoryId.toString().includes(query)
    );
  }

  // Confirm and delete Parent Category
  confirmDeleteParentCategory(parentCategoryId: number) {
    this.showDeleteModal = true;
    this.categoryToDelete = parentCategoryId;
    this.deleteType = 'parent';
  }

  // Confirm and delete Sub Category
  confirmDeleteSubCategory(subCategoryId: number) {
    this.showDeleteModal = true;
    this.categoryToDelete = subCategoryId;
    this.deleteType = 'sub';
  }

  // Delete Category
  deleteCategory() {
    if (this.categoryToDelete && this.deleteType === 'parent') {
      this.deleteParentCategory(this.categoryToDelete);  // Call delete for parent category
    } else if (this.categoryToDelete && this.deleteType === 'sub') {
      this.deleteSubCategory(this.categoryToDelete);  // Call delete for sub-category
    }
    this.closeDeleteModal();  // Close the modal
  }

  // Close the delete confirmation modal
  closeDeleteModal() {
    this.showDeleteModal = false;
    this.categoryToDelete = null;
    this.deleteType = null;
  }

  // Delete Parent Category
  deleteParentCategory(parentCategoryId: number): void {
    this.categoryService.deleteParentCategory(parentCategoryId).subscribe(() => {
      this.getCategories();  // Refresh the list after deletion
    });
  }

  // Delete Sub Category
  deleteSubCategory(subCategoryId: number): void {
    this.categoryService.deleteSubCategory(subCategoryId).subscribe(() => {
      this.getCategories();  // Refresh the list after deletion
    });
  }
}
