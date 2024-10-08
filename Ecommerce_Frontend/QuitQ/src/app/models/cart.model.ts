export interface CartItemDTO {
    cartItemId: number;
    productId: number;
    productName?: string;
    imageUrl?: string;
    price: number;
    quantity: number;
    totalPrice: number;
  }
  
  export interface CartDTO {
    cartId: number;
    userId: number;
    totalAmount: number;
    isActive: boolean;
    dateCreated: Date;
    cartItems: CartItemDTO[];
  }
  