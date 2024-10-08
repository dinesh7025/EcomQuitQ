using EcomLib.Dtos.CartDtos;
using EcomLib.Models.Cartmanagement;
using EcomLib.Repository.CartRepository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EcomLib.Service
{
    public class CartService 
    {
        private readonly ICartRepository _cartRepository;

        public CartService(ICartRepository cartRepository)
        {
            _cartRepository = cartRepository;
        }

        public CartDTO GetCartByUserId(int userId)
        {
            var cart = _cartRepository.GetCartByUserId(userId);
            if (cart == null) return null;

            var cartDto = new CartDTO
            {
                CartId = cart.CartId,
                UserId = cart.UserId,
                TotalAmount = cart.TotalAmount,
                DateCreated = cart.DateCreated,
                IsActive = cart.IsActive,
                CartItems = cart.CartItems.Select(ci => new CartItemDTO
                {
                    CartItemId = ci.CartItemId,
                    ProductId = ci.ProductId,
                    ProductName = ci.Product.ProductName,
                    ImageUrl = ci.Product.ImageUrl,
                    Price = ci.Product.Price,
                    Quantity = ci.Quantity,
                    TotalPrice = ci.TotalPrice
                }).ToList()
            };

            return cartDto;
        }

        public void AddToCart(int userId, CartItemDTO cartItemDto)
        {
            var cart = _cartRepository.GetCartByUserId(userId);
            if (cart == null)
            {
                cart = new Cart
                {
                    UserId = userId,
                    DateCreated = DateTime.Now,
                    IsActive = true,
                    CartItems = new List<CartItem>()
                };
            }
            // Save the new cart to the repository, which will generate the CartId
            _cartRepository.UpdateCart(cart);
            _cartRepository.Save(); // Save the cart to the database to get the CartId

            var cartItem = new CartItem
            {
                ProductId = cartItemDto.ProductId,
                CartId = cart.CartId,
                Quantity = cartItemDto.Quantity,
                UnitPrice = cartItemDto.Price,
                TotalPrice = cartItemDto.Quantity * cartItemDto.Price
            };

            _cartRepository.AddToCart(cartItem);
            _cartRepository.Save();
        }

        public void UpdateCart(int userId, CartDTO cartDto)
        {
            // Retrieve the existing cart for the user
            var cart = _cartRepository.GetCartByUserId(userId);

            if (cart != null)
            {
                // Initialize the total amount
                decimal totalAmount = 0;

                // Loop through the items from the DTO
                foreach (var itemDto in cartDto.CartItems)
                {
                    // Check if the item already exists in the cart
                    var existingItem = cart.CartItems.FirstOrDefault(ci => ci.ProductId == itemDto.ProductId);

                    if (existingItem != null)
                    {
                        // Update existing item
                        existingItem.Quantity = itemDto.Quantity;
                        existingItem.UnitPrice = itemDto.Price;
                        existingItem.TotalPrice = itemDto.Quantity * itemDto.Price; // Recalculate total price
                    }
                    else
                    {
                        // Create a new CartItem if it does not exist
                        var newCartItem = new CartItem
                        {
                            ProductId = itemDto.ProductId,
                            Quantity = itemDto.Quantity,
                            UnitPrice = itemDto.Price,
                            TotalPrice = itemDto.Quantity * itemDto.Price
                        };
                        cart.CartItems.Add(newCartItem);
                    }
                }

                // Recalculate total amount after updating all items
                totalAmount = cart.CartItems.Sum(ci => ci.TotalPrice);

                // Update the cart properties
                cart.TotalAmount = totalAmount;
                cart.UpdatedDate = DateTime.Now;

                // Persist the changes to the repository
                _cartRepository.UpdateCart(cart);
                _cartRepository.Save();
            }
        }


        public void RemoveFromCart(int userId, int cartItemId)
        {
            var cart = _cartRepository.GetCartByUserId(userId);
            if (cart != null)
            {
                _cartRepository.RemoveFromCart(cartItemId);
                _cartRepository.Save();
            }
        }
    }
}
