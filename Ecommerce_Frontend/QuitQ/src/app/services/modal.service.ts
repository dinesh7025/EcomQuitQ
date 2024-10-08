// modal.service.ts
import { Injectable } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { OrderDetailsComponent } from '../components/order-details/order-details.component';
import { PlaceOrderResponse } from '../models/orderResponse.model';

@Injectable({
  providedIn: 'root',
})
export class ModalService {
  constructor(private dialog: MatDialog) {}

  openOrderDetailsModal(order: PlaceOrderResponse): void {
    this.dialog.open(OrderDetailsComponent, {
      data: order,
      panelClass: 'custom-modal-panel', // Optional: add a custom class for styling
    });
  }
}
