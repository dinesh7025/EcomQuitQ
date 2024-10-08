import { Component } from '@angular/core';
import { AuthService } from '../../services/auth-service.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-admin-header',
  standalone: true,
  imports: [],
  templateUrl: './admin-header.component.html',
  styleUrl: './admin-header.component.css'
})
export class AdminHeaderComponent {
  
  constructor(public authService: AuthService, private router:Router) {}
  // Logout function
  logout(): void {
    this.authService.logout();  
  }
  goToUserProfile(): void { // Step 3: Create Navigation Method
    this.router.navigate(['/user-profile']);
  }
}
