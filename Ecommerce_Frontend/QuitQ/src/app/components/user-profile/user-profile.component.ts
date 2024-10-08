import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { FormBuilder, FormGroup, FormsModule, ReactiveFormsModule, Validators } from '@angular/forms';
import { UserProfile } from '../../models/userProfile.model';
import { UserService } from '../../services/user.service';
import { CommonModule } from '@angular/common';
import { AuthService } from '../../services/auth-service.service';
import { AdminFooterComponent } from '../admin-footer/admin-footer.component';
import { AdminHeaderComponent } from '../admin-header/admin-header.component';
import { SellerHeaderComponent } from '../seller-header/seller-header.component';
import { HeaderComponent } from '../header/header.component';


@Component({
  selector: 'app-user-profile',
  standalone: true,
  imports: [CommonModule, FormsModule,ReactiveFormsModule, AdminFooterComponent,AdminHeaderComponent,SellerHeaderComponent,HeaderComponent],
  templateUrl: './user-profile.component.html',
  styleUrl: './user-profile.component.css'
})
export class UserProfileComponent {
  headerComponent: any;

  userProfile: UserProfile | undefined;
  userProfileForm: FormGroup;
  isEditing: boolean = false;

  constructor(
    private userService: UserService,
    private fb: FormBuilder,
    private authService: AuthService
  ) {
    this.userProfileForm = this.fb.group({
      username: [{ value: '', disabled: true }],
      email: ['', [Validators.required, Validators.email]],
      dateCreated: [{ value: '', disabled: true }],
      firstName: ['', Validators.required],
      lastName: ['', Validators.required],
      gender: [{ value: '', disabled: true }],
      dateOfBirth: [{ value: '', disabled: true }],
      phoneNumber: ['', [Validators.required, Validators.pattern('^[0-9]+$')]],
      addressLine1: ['', Validators.required],
      addressLine2: [''],
      city: ['', Validators.required],
      state: ['', Validators.required],
      postalCode: ['', Validators.required],
      country: ['', Validators.required],
    });
  }

  ngOnInit(): void {
    this.setCurrentUserRole(); 
    const userId = this.authService.getUserIdFromToken()!;
    this.getUserProfile(userId);
    this.userProfileForm.disable()
  }
  setCurrentUserRole(): void {
    const decodedToken = this.authService.decodeToken();
    if (decodedToken) {
      console.log('Decoded Token:', decodedToken);
      
      // Access the role using the full namespaced key
      const userRole = decodedToken['http://schemas.microsoft.com/ws/2008/06/identity/claims/role'];
      this.setHeaderComponent(userRole);
    }
  }

  setHeaderComponent(role: string): void {
    switch (role) {
      case 'Admin':
        this.headerComponent = 'AdminHeaderComponent';
        break;
      case 'Seller':
        this.headerComponent = 'SellerHeaderComponent';
        break;
      case 'User':
        this.headerComponent = 'HeaderComponent';
        break;
      default:
        this.headerComponent = null; // or a default header
    }
  }
  getUserProfile(userId: number): void {
    this.userService.getUserProfile(userId).subscribe(profile => {
      this.userProfile = profile;
      this.populateForm(profile);
    });
  }

  populateForm(profile: UserProfile): void {
    this.userProfileForm.patchValue({
      username: profile.username,
      email: profile.email,
      dateCreated: profile.dateCreated,
      firstName: profile.personalDetails.firstName,
      lastName: profile.personalDetails.lastName,
      gender: profile.personalDetails.gender,
      dateOfBirth: profile.personalDetails.dateOfBirth,
      phoneNumber: profile.personalDetails.phoneNumber,
      addressLine1: profile.address.addressLine1,
      addressLine2: profile.address.addressLine2,
      city: profile.address.city,
      state: profile.address.state,
      postalCode: profile.address.postalCode,
      country: profile.address.country,
    });
  }

  editProfile(): void {
    this.isEditing = true;
    this.userProfileForm.enable()
    this.userProfileForm.get('username')?.disable();  
    this.userProfileForm.get('gender')?.enable();
    this.userProfileForm.get('dateOfBirth')?.disable();  
    this.userProfileForm.get('dateCreated')?.disable(); 
  }

  cancelEdit(): void {
    this.isEditing = false;
    if (this.userProfile) {
      this.populateForm(this.userProfile);
      this.userProfileForm.disable(); 
    }
  }
  
  saveProfile(): void {
    this.userProfileForm.markAllAsTouched();  // Always mark fields as touched before submitting
    
    if (!this.userProfileForm.valid) {
      return;  // Return if the form is invalid, preventing the update logic
    }
    
    const updatedUser: UserProfile = {
      userId: this.userProfile?.userId,
      username: this.userProfile?.username,
      email: this.userProfileForm.value.email,
      dateCreated: this.userProfile?.dateCreated,
      personalDetails: {
        firstName: this.userProfileForm.value.firstName,
        lastName: this.userProfileForm.value.lastName,
        gender: this.userProfile?.personalDetails.gender!,
        dateOfBirth: this.userProfile?.personalDetails.dateOfBirth!,
        phoneNumber: this.userProfileForm.value.phoneNumber
      },
      address: {
        addressLine1: this.userProfileForm.value.addressLine1,
        addressLine2: this.userProfileForm.value.addressLine2,
        city: this.userProfileForm.value.city,
        state: this.userProfileForm.value.state,
        postalCode: this.userProfileForm.value.postalCode,
        country: this.userProfileForm.value.country
      }
    };
  
    this.userService.updateUserProfile(updatedUser).subscribe(() => {
      this.isEditing = false;
      this.userProfileForm.disable();  // Disable the form after saving the profile
    });
  }
  
  }
