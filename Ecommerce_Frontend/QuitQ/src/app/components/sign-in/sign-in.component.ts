import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { CommonModule } from '@angular/common';
import { MatIconModule } from '@angular/material/icon';
import { FormsModule } from '@angular/forms'; // Add this if you're using forms
import { AuthService } from '../../services/auth-service.service';

@Component({
  selector: 'app-sign-in',
  standalone: true,
  imports: [MatIconModule, FormsModule, CommonModule],
  templateUrl: './sign-in.component.html',
  styleUrls: ['./sign-in.component.css']
})
export class SignInComponent {
  usernameOrEmail: string = '';  // To bind the form input for username or email
  password: string = '';  // To bind the form input for password
  errorMessage: string = '';  // To show error messages

  constructor(private authService: AuthService, private router: Router) {}

  onLogin(): void {
    if (this.usernameOrEmail && this.password) {
      // Call the login method from AuthService and pass the form values
      this.authService.login(this.usernameOrEmail, this.password).subscribe({
        next: (response: any) => {
          if (response.token) {
            // Save the token in localStorage
            this.authService.setToken(response.token);
  
            // Decode the token to get user details
            const decodedToken = this.authService.decodeToken();
            if (decodedToken) {
              console.log('Decoded Token:', decodedToken);
  
              // Access the role using the full namespaced key
              const userRole = decodedToken['http://schemas.microsoft.com/ws/2008/06/identity/claims/role'];
              
              // Redirect based on the role
              if (userRole === 'Admin') {
                this.router.navigate(['/admin']);
              } else if (userRole === 'Seller') {
                this.router.navigate(['/seller-dashboard']);
              } else if (userRole === 'User') {
                this.router.navigate(['']);
              }
            }
          }
        },
        error: (err) => {
          this.errorMessage = err.error.message || 'Login failed. Please try again.'; 
        }
      });
    } else {
      this.errorMessage = 'Please fill in both fields.';
    }
  }
  
}
