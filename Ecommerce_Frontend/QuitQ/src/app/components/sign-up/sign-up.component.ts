import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators, AbstractControl, ReactiveFormsModule, FormsModule } from '@angular/forms';
import { Router } from '@angular/router';
import { CommonModule } from '@angular/common';
import { FooterComponent } from '../footer/footer.component';
import { UserRegistration } from '../../models/userRegistration.model';
import { RegistrationService } from '../../services/registration-service.service';
import { CountryStateCityService } from '../../services/country-state-city.service';

@Component({
  selector: 'app-sign-up',
  standalone: true,
  imports: [FormsModule, FooterComponent, ReactiveFormsModule, CommonModule],
  templateUrl: './sign-up.component.html',
  styleUrls: ['./sign-up.component.css']
})
export class SignUpComponent implements OnInit {
  signUpForm!: FormGroup;
  currentStep:number = 1;
  countries: any[] = [];

  constructor(
    private fb: FormBuilder,
    private userService: RegistrationService,
    private route: Router,
    private countryService: CountryStateCityService
  ) {}

  ngOnInit(): void {
    // this.getAllCountries();
    this.signUpForm = this.fb.group({
      firstName: ['', Validators.required],
      lastName: ['', Validators.required],
      email: ['', [Validators.required, Validators.email]],
      username: ['', Validators.required],
      phonenumber: ['', Validators.required],
      password: ['', [Validators.required, Validators.minLength(6)]],
      confirmPassword: ['', Validators.required],
      dob: ['', Validators.required],
      gender: ['', Validators.required],
      addressLine1: ['', Validators.required],
      addressLine2: [''],
      city: ['', Validators.required],
      state: ['', Validators.required],
      country: ['', Validators.required],
      postalCode: ['', Validators.required]
    }, { validator: this.passwordMatchValidator });
  }

  passwordMatchValidator(formGroup: AbstractControl): { [key: string]: boolean } | null {
    const password = formGroup.get('password')?.value;
    const confirmPassword = formGroup.get('confirmPassword')?.value;
    return password === confirmPassword ? null : { mismatch: true };
  }

  // getAllCountries(): void {
  //   this.countryService.getCountries().subscribe(
  //     (data) => {
  //       this.countries = data;
  //     },
  //     (error) => {
  //       console.error('Error fetching countries:', error);
  //     }
  //   );
  // }

  nextStep(): void {
    if (this.currentStep < 3) {
      this.currentStep++;
    }
  }

  previousStep(): void {
    if (this.currentStep > 1) {
      this.currentStep--;
    }
  }

  onSubmit(): void {
    if (this.signUpForm.valid) {
      const formData: UserRegistration = {
        username: this.signUpForm.get('username')?.value,
        password: this.signUpForm.get('password')?.value,
        email: this.signUpForm.get('email')?.value,
        personalDetails: {
          firstName: this.signUpForm.get('firstName')?.value,
          lastName: this.signUpForm.get('lastName')?.value,
          gender: this.signUpForm.get('gender')?.value,
          dateOfBirth: this.signUpForm.get('dob')?.value,
          phoneNumber: this.signUpForm.get('phonenumber')?.value
        },
        address: {
          addressLine1: this.signUpForm.get('addressLine1')?.value,
          addressLine2: this.signUpForm.get('addressLine2')?.value,
          city: this.signUpForm.get('city')?.value,
          state: this.signUpForm.get('state')?.value,
          postalCode: this.signUpForm.get('postalCode')?.value,
          country: this.signUpForm.get('country')?.value
        }
      };

      this.userService.registerUser(formData).subscribe(
        (response) => {
          console.log('User registered successfully:', response);
          this.route.navigate(['/login']);
        },
        (error) => {
          console.error('Error during registration:', error);
        }
      );
    } else {
      console.error('Form is invalid');
    }
  }
}
