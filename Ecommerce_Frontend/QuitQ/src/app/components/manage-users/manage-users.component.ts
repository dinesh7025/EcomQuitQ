import { Component, OnInit } from '@angular/core';
import { UserService } from '../../services/user.service';
import { User, UpdateUser } from '../../models/user.model';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms'; 
import { AdminFooterComponent } from '../admin-footer/admin-footer.component';
import { AdminHeaderComponent } from '../admin-header/admin-header.component';

@Component({
  selector: 'app-manage-users',
  standalone: true,
  imports: [CommonModule,FormsModule,AdminFooterComponent ,AdminHeaderComponent],
  templateUrl: './manage-users.component.html',
  styleUrl: './manage-users.component.css'
})
export class ManageUsersComponent implements OnInit {
  users: User[] = [];
  sellers: User[] = [];
  filteredUsers: User[] = [];
  filteredSellers: User[] = [];
  userSearchQuery: string = '';   // Separate search query for users
  sellerSearchQuery: string = '';  // Separate search query for sellers
  confirmDelete: boolean = false;
  selectedUserId: number | null = null;
  selectedUser: UpdateUser | null = null;

  constructor(private userService: UserService) {}

  ngOnInit(): void {
    this.getUsersAndSellers();
  }

  getUsersAndSellers(): void {
    this.userService.getUsers().subscribe((response: User[]) => {
      this.users = response.filter(user => user.role === 'User');
      this.sellers = response.filter(user => user.role === 'Seller');
      this.filteredUsers = this.users; // Show all users by default
      this.filteredSellers = this.sellers; // Show all sellers by default
    });
  }

  searchUsers(): void {
    this.filteredUsers = this.users.filter(user =>
      user.userName.toLowerCase().includes(this.userSearchQuery.toLowerCase()) ||
      user.userId.toString().includes(this.userSearchQuery)
    );
  }

  searchSellers(): void {
    this.filteredSellers = this.sellers.filter(seller =>
      seller.userName.toLowerCase().includes(this.sellerSearchQuery.toLowerCase()) ||
      seller.userId.toString().includes(this.sellerSearchQuery)
    );
  }
// Set the selected userId and show the confirmation modal
confirmDeleteUser(userId: number): void {
  this.selectedUserId = userId;
  this.confirmDelete = true;
}

// Method to delete the user (or seller)
deleteUser(userId: number | null): void {
  if (userId) {
    this.userService.deleteUser(userId).subscribe(() => {
      this.users = this.users.filter(user => user.userId !== userId);
      this.sellers = this.sellers.filter(seller => seller.userId !== userId);
      this.getUsersAndSellers();
      this.confirmDelete = false;  // Hide the confirmation modal
      this.selectedUserId = null;  // Reset the selected userId
    });
  }
}

// Cancel the delete action
cancelDelete(): void {
  this.confirmDelete = false;
  this.selectedUserId = null;
}

// Method to edit a user
editUser(userId: number) {
  const user = this.filteredUsers.find(u => u.userId === userId);
  if (user) {
    this.selectedUser = {
      userId:user.userId,
      username: user.userName,
      email: user.email,
      isActive: user.isActive
    };
  }
}

// Method to update user details
updateUser() {
  console.log(`updateclicked`);
  if (this.selectedUser) {
    const userId = this.filteredUsers.find(u => u.userId === this.selectedUser?.userId)?.userId; 
    if (userId) {
      this.userService.updateUser(userId, this.selectedUser)
        .subscribe(
          (updatedUser) => {
            console.log('User updated:', updatedUser);
            this.getUsersAndSellers();
            this.selectedUser = null; 
          },
          (error) => {
            console.error('Error updating user:', error);
          }
        );
    }
  }
}

// Method to cancel editing
cancelEdit() {
  this.selectedUser = null; // Clear selected user
}
}