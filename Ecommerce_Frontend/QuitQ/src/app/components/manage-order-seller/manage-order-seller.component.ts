import { Component, OnInit } from '@angular/core';
import { OrderService } from '../../services/order.service';
import { ItemStatus, SellerOrderItem } from '../../models/sellerOrderItem.model';
import { AuthService } from '../../services/auth-service.service';
import { SellerService } from '../../services/seller.service';
import { CommonModule } from '@angular/common';
import { EnumToStringPipe } from '../../enum-to-string.pipe';
import { AdminFooterComponent } from '../admin-footer/admin-footer.component';
import { SellerHeaderComponent } from '../seller-header/seller-header.component';

@Component({
  selector: 'app-manage-order-seller',
  standalone: true,
  imports: [CommonModule,EnumToStringPipe, AdminFooterComponent,SellerHeaderComponent],
  templateUrl: './manage-order-seller.component.html',
  styleUrl: './manage-order-seller.component.css'
})
export class ManageOrderSellerComponent implements OnInit {

  orderItems: SellerOrderItem[] = [];
  userId: number | null = null; 
  sellerId: number | null = null; 
  itemStatuses= ItemStatus;
  itemStatusesList = [
    { value: ItemStatus.Pending, label: 'Pending' },
    { value: ItemStatus.Processed, label: 'Processed' },
    { value: ItemStatus.Shipped, label: 'Shipped' },
    { value: ItemStatus.Delivered, label: 'Delivered' },
    { value: ItemStatus.Cancelled, label: 'Cancelled' }
  ];

  constructor(
    private sellerService: SellerService,
    private authService: AuthService,
    private orderService: OrderService // Assuming you have an AuthService
  ) {}

  ngOnInit(): void {
    this.fetchUserId(); // Fetch userId from token
  }

  fetchUserId(): void {
    // Fetch userId from the AuthService
    const getuserId = this.authService.getUserIdFromToken()!;
    this.userId = getuserId
      this.getSellerDetails(getuserId);
  }

  getSellerDetails(userId: number): void {
    this.sellerService.getSellerDetails(userId).subscribe((sellerDetails) => {
      this.sellerId = sellerDetails.sellerId;
      this.getOrderItemsBySellerId(sellerDetails.sellerId);
    });
  }

  getOrderItemsBySellerId(sellerId: number): void {
    this.orderService.getOrderItemsForSeller(sellerId).subscribe((items) => {
      this.orderItems = items; 
    });
  }

  updateOrderItemStatus(orderItemId: number, newStatus: ItemStatus): void {
    console.log('update clicked')
    this.sellerService.updateOrderItemStatus(orderItemId, newStatus).subscribe(() => {
      // Update the local orderItems array after a successful update
      const item = this.orderItems.find(o => o.orderItemId === orderItemId);
      if (item) {
        item.itemStatus = newStatus;
      }
    });
  }
}