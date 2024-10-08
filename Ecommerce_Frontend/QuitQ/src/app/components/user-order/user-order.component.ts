import { Component, OnInit } from '@angular/core';
import { OrderService } from '../../services/order.service';
import { OrderItemUser } from '../../models/order.model';
import { CommonModule } from '@angular/common';
import { AuthService } from '../../services/auth-service.service';
import { trigger, state, style, transition, animate } from '@angular/animations';
import { HeaderComponent } from '../header/header.component';
import { FooterComponent } from '../footer/footer.component';

@Component({
  selector: 'app-user-order',
  standalone: true,
  imports: [CommonModule, HeaderComponent, FooterComponent],
  templateUrl: './user-order.component.html',
  styleUrl: './user-order.component.css',
  animations: [
    trigger('bounceIn', [
      transition(':enter', [
        style({ transform: 'scale(0)', opacity: 0 }),
        animate('500ms ease-out', style({ transform: 'scale(1)', opacity: 1 }))
      ])
    ])
  ]
})
export class UserOrderComponent implements OnInit{
  orderItems: OrderItemUser[] = [];
  totalAmount: number = 0;

  constructor(private orderService: OrderService, private authService: AuthService) {}

  ngOnInit(): void {
    const userId = this.authService.getUserIdFromToken()!;
    this.orderHistory(userId);
  }

  orderHistory(userId: number): void {
    this.orderService.getOrderHistory(userId).subscribe(
      (data) => {
        this.orderItems = data;
        this.totalAmount = this.orderItems.reduce((acc, item) => acc + item.totalPrice, 0);
      },
      (error) => {
        console.error('Error fetching order history:', error);
      }
    );
  }
  // user-order-history.component.ts (add this method)
getStatusClass(status: string): string {
  switch (status.toLowerCase()) {
    case 'processed':
      return 'bg-success'; // Green for processed
    case 'pending':
      return 'bg-warning'; // Yellow for pending
    case 'shipped':
      return 'bg-info'; // Blue for shipped
    case 'delivered':
      return 'bg-secondary'; // Grey for delivered
    case 'cancelled':
      return 'bg-danger'; // Red for cancelled
    default:
      return 'bg-light'; // Default color
  }
}

}
