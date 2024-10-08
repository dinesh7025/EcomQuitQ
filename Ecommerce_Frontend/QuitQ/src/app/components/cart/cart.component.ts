import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { CartService } from '../../services/cart.service';
import { CartDTO, CartItemDTO } from '../../models/cart.model';
import { AuthService } from '../../services/auth-service.service';
import { Observable } from 'rxjs';
import { Address } from '../../models/address.model';
import { UserService } from '../../services/user.service';
import { FormsModule } from '@angular/forms';
import { Discount, DiscountType } from '../../models/discount.model';
import { DiscountService } from '../../services/discount.service';
import { Order, OrderStatus, OrderItemStatus, PaymentMethod, PaymentStatus } from '../../models/order.model';
import { OrderService } from '../../services/order.service';
import { PlaceOrderResponse } from '../../models/orderResponse.model';
import { OrderDetailsComponent } from '../order-details/order-details.component';
import { ModalService } from '../../services/modal.service';
import { HeaderComponent } from '../header/header.component';
import { FooterComponent } from '../footer/footer.component';
import { RouterModule } from '@angular/router';

@Component({
  selector: 'app-cart',
  standalone: true,
  imports: [CommonModule, FormsModule, HeaderComponent, FooterComponent,RouterModule],
  templateUrl: './cart.component.html',
  styleUrls: ['./cart.component.css']
})
export class CartComponent implements OnInit {
  cart: CartDTO | null = null; // Cart object to hold fetched cart data
  loading: boolean = false; // Loading state for async operations
  discountCode: string = ''; // For storing the applied coupon code
  discount: Discount | null = null;
  discountedTotal: number = 0;
  DiscountType = DiscountType;
  selectedShippingAddressId: number | null = null;
  selectedBillingAddressId: number | null = null;
  addresses: Address[] = []; // Addresses for user

  selectedPaymentMethod: PaymentMethod | null = null;
  paymentMethods: { label: string; value: PaymentMethod }[] = [
    { label: 'Credit Card', value: PaymentMethod.CreditCard },
    { label: 'Debit Card', value: PaymentMethod.DebitCard },
    { label: 'Net Banking', value: PaymentMethod.NetBanking },
    { label: 'UPI', value: PaymentMethod.UPI },
    { label: 'Cash on Delivery', value: PaymentMethod.COD },
  ];

  totalPrice: number;

  constructor(
    private cartService: CartService, 
    private authService: AuthService,
    private userService: UserService,
    private discountService: DiscountService,
    private orderService: OrderService,
    private modalService: ModalService
  )
    {
      this.totalPrice = 0;
      this.discountedTotal = this.totalPrice;
    }

  ngOnInit(): void {
    this.getCart(); // Fetch cart on component load
    this.getAddresses(); //fetch adresses on load
    this.getTotalItems();
  }

  // Fetch the cart for the user
  getCart(): void {
    this.loading = true; // Start loading
    const userId = this.authService.getUserIdFromToken();

    if (userId === null) {
      console.error('User is not logged in');
      this.loading = false; // Stop loading
      return;
    }

    this.cartService.getCartByUserId(userId).subscribe(
      (data: CartDTO) => {
        this.cart = data;
        this.totalPrice = this.getTotalPrice();
      },
      error => {
        console.error('Error fetching cart:', error);
      },
      () => {
        this.loading = false; // Stop loading when done
      }
    );
    this.totalPrice= this.getTotalPrice();
  }

  // Add item to the cart
  addToCart(cartItem: CartItemDTO): void {
    const userId = this.authService.getUserIdFromToken();

    if (userId === null) {
      console.error('User is not logged in');
      return;
    }

    this.cartService.addToCart(userId, cartItem).subscribe(
      response => {
        console.log('Item added to cart:', response);
        this.getCart(); // Refresh cart after adding an item
      },
      error => {
        console.error('Error adding item to cart:', error);
      }
    );
  }

  // Increase quantity of an item
  increaseQuantity(item: CartItemDTO): void {
    if (this.cart) {
      item.quantity += 1;
      item.totalPrice = item.quantity * item.price;
      this.updateCart(); // Update the cart after changing quantity
      this.totalPrice = this.getTotalPrice();
    }
  }

  // Decrease quantity of an item
  decreaseQuantity(item: CartItemDTO): void {
    if (this.cart && item.quantity > 1) {
      item.quantity -= 1;
      item.totalPrice = item.quantity * item.price;
      this.updateCart(); // Update the cart after changing quantity
      this.totalPrice = this.getTotalPrice();
    }
  }

  // Update cart in backend after changing quantities
  updateCart(): void {
    if (this.cart) {
      this.cartService.updateCart(this.cart).subscribe(
        response => {
          console.log('Cart updated successfully:', response);
        },
        error => {
          console.error('Error updating cart:', error);
        }
      );
    }
  }

  // Remove an item from the cart
  removeItem(cartItemId: number): void {
    const userId = this.authService.getUserIdFromToken();

    if (userId === null) {
      console.error('User is not logged in');
      return;
    }

    this.cartService.removeFromCart(userId, cartItemId).subscribe({
      next: () => {
        this.getCart();
      },
      error: err => {
        console.error('Error removing item:', err);
      }
    });
  }

  // Calculate the total number of items in the cart
  getTotalItems(): number {
    return this.cart?.cartItems?.reduce((acc, item) => acc + item.quantity, 0) || 0;
  }

  // Calculate total price of items in the cart
  getTotalPrice(): number {
    return this.cart?.cartItems?.reduce((total, item) => total + item.totalPrice, 0) || 0;
  }

 // Fetch user addresses for checkout
 getAddresses(): void {
  const userId = this.authService.getUserIdFromToken();

  if (userId) {
    this.userService.getUserAddress(userId).subscribe(
      (addresses: Address[]) => {
        this.addresses = addresses;
        this.selectedShippingAddressId= addresses[0]?.addressId || null;
        this.selectedBillingAddressId = addresses[0]?.addressId || null;
      },
      (error) => {
        console.error('Error fetching addresses:', error);
      }
    );
  }
}

applyDiscount(): void {
  if (!this.discountCode) {
    alert('Please enter a discount code');
    return;
  }

  this.discountService.getDiscountByCode(this.discountCode).subscribe({
    next: (discount: Discount) => {
      if (discount && this.isDiscountValid(discount)) {
        this.discount = discount;
        this.calculateDiscountedTotal();
      } else {
        alert('Discount code is invalid or expired');
      }
    },
    error: (err) => {
      console.error(err);
      alert('Invalid Discount Code');
    }
  });
}
// Check if the discount is valid based on the date and active status
private isDiscountValid(discount: Discount): boolean {
  const currentDate = new Date();
  return discount.isActive && currentDate >= new Date(discount.startDate) && currentDate <= new Date(discount.endDate);
}

private calculateDiscountedTotal(): void {
  if (!this.cart) return;

  const originalTotal = this.getTotalPrice();

  if (this.discount) {
    if (this.discount.discountType === DiscountType.Percentage) {
      // Apply percentage discount
      this.discountedTotal = originalTotal - (originalTotal * (this.discount.discountValue / 100));
    } else if (this.discount.discountType === DiscountType.FixedAmount) {
      // Apply fixed amount discount
      this.discountedTotal = originalTotal - this.discount.discountValue;
    }
    if (this.discountedTotal < 0) this.discountedTotal = 0; // Ensure no negative totals
  } else {
    this.discountedTotal = originalTotal; // No discount
  }
}

// Confirm checkout and proceed with payment
confirmCheckout(): void {
  if (this.selectedShippingAddressId == null || this.selectedBillingAddressId == null || this.selectedPaymentMethod == null) {
    alert('Please select a shipping address, billing address, and payment method');
    return;
  }
  

  const userInput = prompt('Type "PAY" to confirm payment:');
  if (userInput === 'PAY') {
    this.checkout(); // Proceed with checkout
  } else {
    alert('Please type "PAY" to proceed with payment.');
  }
}

// Checkout logic
checkout(): void {
  const order = this.createOrder(); // Create order object with necessary details
  console.log('created order:', order);
  this.orderService.placeOrder(order).subscribe({
    next: (response) => {
      console.log('Order placed successfully:', response);
      this.modalService.openOrderDetailsModal(response); // Call to show order details modal
      this.clearCart(); // Clear the cart after a successful order
    },
    error: (err) => {
      console.error('Error placing order:', err);
      const errorResponse: PlaceOrderResponse = {
        orderId: 0,
        totalAmount: 0,
        orderDate: new Date(),
        orderStatus: 1, // Assuming 1 means failed
        orderItems: [],
        payments: []
      };
      this.modalService.openOrderDetailsModal(errorResponse); // Show error modal
    }
  });
}

// Create order object
createOrder(): Order {
  const totalPriceToUse = this.discount ? this.discountedTotal : this.getTotalPrice();
  return {
    userId: this.authService.getUserIdFromToken() ?? 0,
    orderDate: new Date(),
    totalAmount: totalPriceToUse,
    shippingAddressId: this.selectedShippingAddressId ?? 0,
    billingAddressId: this.selectedBillingAddressId ?? 0,
    orderStatus: OrderStatus.Pending,
    orderItems: this.cart?.cartItems?.map(item => ({
      productId: item.productId,
      sellerId: 0,
      quantity: item.quantity,
      unitPrice: item.price,
      totalPrice: item.price * item.quantity,
      itemStatus: OrderItemStatus.Pending
    })) || [],
    payments: [{
      paymentDate: new Date(),
      paymentAmount: this.totalPrice,
      paymentMethod: this.selectedPaymentMethod ?? PaymentMethod.COD, // Use selected method or default to COD
      paymentStatus: this.selectedPaymentMethod === PaymentMethod.COD ? PaymentStatus.Pending : PaymentStatus.Completed
    }]
  };
}

// Clear all items from the cart
clearCart(): void {
  if (this.cart) {
    // Iterate over each item to remove it
    this.cart.cartItems.forEach((item) => this.removeItem(item.cartItemId));

    this.cart.cartItems = [];

    this.updateCart(); 
  }
}

}
