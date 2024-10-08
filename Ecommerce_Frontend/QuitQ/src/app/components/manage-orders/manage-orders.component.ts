import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { OrderService } from '../../services/order.service';
import { AdminOrder, OrderStatus } from '../../models/adminOrder.model';
import { AdminFooterComponent } from '../admin-footer/admin-footer.component';
import { AdminHeaderComponent } from '../admin-header/admin-header.component';

@Component({
  selector: 'app-manage-orders',
  standalone: true,
  imports: [CommonModule,FormsModule, AdminFooterComponent,AdminHeaderComponent],
  templateUrl: './manage-orders.component.html',
  styleUrl: './manage-orders.component.css'
})
export class ManageOrdersComponent implements OnInit {
  orders: AdminOrder[] = [];
  filteredOrders: AdminOrder[] = [];

  constructor(private orderService: OrderService) {}

  ngOnInit(): void {
    this.fetchOrders();
  }

  // Fetch all orders
  fetchOrders(): void {
    this.orderService.getAllOrders().subscribe({
      next: (orders) => {
        this.orders = orders;
        this.filteredOrders = orders; // Initially no filters applied
      },
      error: (err) => console.error('Error fetching orders:', err)
    });
  }

  // Sort orders by total amount (high to low / low to high)
  sortOrdersByTotalAmount(order: string): void {
    this.filteredOrders = [...this.orders].sort((a, b) => {
      return order === 'highToLow' ? b.totalAmount - a.totalAmount : a.totalAmount - b.totalAmount;
    });
  }

  // Sort orders by user name (A-Z / Z-A)
  sortOrdersByUserName(order: string): void {
    this.filteredOrders = [...this.orders].sort((a, b) => {
      return order === 'az' ? a.userName.localeCompare(b.userName) : b.userName.localeCompare(a.userName);
    });
  }

  // Get status label
  getStatusLabel(status: OrderStatus): string {
    switch (status) {
      case OrderStatus.Pending:
        return 'Pending';
      case OrderStatus.Processed:
        return 'Processed';
      case OrderStatus.Shipped:
        return 'Shipped';
      case OrderStatus.Delivered:
        return 'Delivered';
      case OrderStatus.Cancelled:
        return 'Cancelled';
      default:
        return '';
    }
  }

  // Get status color based on status
  getStatusColor(status: OrderStatus): string {
    switch (status) {
      case OrderStatus.Pending:
        return 'status-pending';
      case OrderStatus.Processed:
        return 'status-processed';
      case OrderStatus.Shipped:
        return 'status-shipped';
      case OrderStatus.Delivered:
        return 'status-delivered';
      case OrderStatus.Cancelled:
        return 'status-cancelled';
      default:
        return '';
    }
  }
}
