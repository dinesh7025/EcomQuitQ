import { Component,EventEmitter, Output } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Router } from '@angular/router';
import { AuthService } from '../../services/auth-service.service';

@Component({
  selector: 'app-header',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './header.component.html',
  styleUrl: './header.component.css'
})
export class HeaderComponent {
  @Output() searchEvent = new EventEmitter<string>();
  searchTerm: string = ''; // Variable to hold the current search term
  constructor(public authService: AuthService) {}

  // Logout function
  logout(): void {
    this.authService.logout();  
  }

 onSearchInputChange(event: Event): void {
  const target = event.target as HTMLInputElement;
  if (target) {
    this.searchTerm = target.value; 
    this.searchEvent.emit(this.searchTerm);
  }
}

clearSearch(): void {
  this.searchTerm = '';
  this.onSearchInputChange({ target: { value: '' } } as unknown as Event);
}

  
}