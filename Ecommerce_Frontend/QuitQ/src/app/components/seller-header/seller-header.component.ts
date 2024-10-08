import { Component } from '@angular/core';
import { AuthService } from '../../services/auth-service.service';

@Component({
  selector: 'app-seller-header',
  standalone: true,
  imports: [],
  templateUrl: './seller-header.component.html',
  styleUrl: './seller-header.component.css'
})
export class SellerHeaderComponent {

  constructor(public authService: AuthService) {}
    // Logout function
    logout(): void {
      this.authService.logout();  
    }
}
