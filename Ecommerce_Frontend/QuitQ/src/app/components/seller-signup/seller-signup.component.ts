import { Component ,OnInit} from '@angular/core';
import { FormBuilder, FormGroup, Validators ,FormsModule,AbstractControl,ReactiveFormsModule} from '@angular/forms';
import { Router } from '@angular/router';
import { CommonModule } from '@angular/common';
import { SellerService } from '../../services/seller.service';
import { SellerRegistration } from '../../models/sellerregistration.model';
import { RegistrationService } from '../../services/registration-service.service';
import { HeaderComponent } from '../header/header.component';
import { FooterComponent } from '../footer/footer.component';


@Component({
  selector: 'app-seller-signup',
  standalone:true,
  imports:[ReactiveFormsModule,CommonModule,HeaderComponent,FooterComponent],
  templateUrl: './seller-signup.component.html',
  styleUrls: ['./seller-signup.component.css']
})
export class SellerSignupComponent implements OnInit {

  sellerForm!: FormGroup;
  currentStep = 1;
  constructor(private fb: FormBuilder, private sellerService: RegistrationService, private route: Router) {}

  ngOnInit(): void {
    this.sellerForm = this.fb.group({
      firstName: ['', Validators.required],
      lastName: ['', Validators.required],
      email: ['', [Validators.required, Validators.email]],
      username: ['', Validators.required],
      phonenumber: ['', Validators.required],
      password: ['', [Validators.required]],
      confirmPassword: ['', Validators.required],
      dob: ['', Validators.required],
      gender: ['', Validators.required],
      addressLine1: ['', Validators.required],
      addressLine2: [''],
      city: ['', Validators.required],
      state: ['', Validators.required],
      country: ['', Validators.required],
      postalCode: ['', Validators.required],
      companyName: ['', Validators.required],
      companyRegistrationNumber: ['', Validators.required],
      gstNumber: ['', Validators.required],
      businessType: ['', Validators.required]
    }, { validator: this.passwordMatchValidator });
  }

  passwordMatchValidator(formGroup: AbstractControl): { [key: string]: boolean } | null {
    const password = formGroup.get('password')?.value;
    const confirmPassword = formGroup.get('confirmPassword')?.value;
    return password === confirmPassword ? null : { mismatch: true };
  }
  nextStep() {
    console.log('clicked next ')
    if (this.currentStep < 4) {
      this.currentStep++;
    }
  }

  previousStep() {
    if (this.currentStep > 1) {
      this.currentStep--;
    }
  }

  onSubmit(): void {
    if (this.sellerForm.valid) {
      const formData: SellerRegistration = {
        username: this.sellerForm.get('username')?.value,
        password: this.sellerForm.get('password')?.value,
        email: this.sellerForm.get('email')?.value,
        personalDetails: {
          firstName: this.sellerForm.get('firstName')?.value,
          lastName: this.sellerForm.get('lastName')?.value,
          gender: this.sellerForm.get('gender')?.value,
          dateOfBirth: this.sellerForm.get('dob')?.value,
          phoneNumber: this.sellerForm.get('phonenumber')?.value
        },
        address: {
          addressLine1: this.sellerForm.get('addressLine1')?.value,
          addressLine2: this.sellerForm.get('addressLine2')?.value,
          city: this.sellerForm.get('city')?.value,
          state: this.sellerForm.get('state')?.value,
          postalCode: this.sellerForm.get('postalCode')?.value,
          country: this.sellerForm.get('country')?.value
        },
        sellerDetails: {
          companyName: this.sellerForm.get('companyName')?.value,
          companyRegistrationNumber: this.sellerForm.get('companyRegistrationNumber')?.value,
          gstNumber: this.sellerForm.get('gstNumber')?.value,
          businessType: this.sellerForm.get('businessType')?.value
        }
      };

      // Use the service method to register the seller
      this.sellerService.registerSeller(formData).subscribe(
        (response) => {
          console.log('Seller registered successfully:', response);
          alert('Registration Successfull!')
          this.route.navigate(['/seller-dashboard']);
        },
        (error) => {
          console.error('Error during seller registration:', error);
        }
      );
    } else {
      console.error('Form is invalid');
      Object.keys(this.sellerForm.controls).forEach(key => {
        const control = this.sellerForm.get(key);
        if (control?.invalid) {
          console.error(`Control '${key}' is invalid. Errors:`, control.errors);
        }
      });
    }
  }
}