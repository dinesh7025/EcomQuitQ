using EcomLib.Dtos.CartDtos;
using EcomLib.Exceptionhandling;
using EcomLib.Models.Cartmanagement;
using EcomQuitQ.Data;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EcomLib.Repository.CartRepository
{
    public class CartRepository : ICartRepository
    {
        private readonly AppDbContext _context;

        public CartRepository(AppDbContext context)
        {
            _context = context;
        }

        public Cart GetCartByUserId(int userId)
        {
            // Fetch cart including cart items and product details for a specific user
            return _context.Carts
                .Include(c => c.CartItems)
                .ThenInclude(ci => ci.Product) // Include product details
                .FirstOrDefault(c => c.UserId == userId && c.IsActive);
        }

        public void AddToCart(CartItem cartItem)
        {
            _context.CartItems.Add(cartItem);
        }

        public void UpdateCart(Cart cart)
        {
            _context.Carts.Update(cart);
        }

        public void RemoveFromCart(int cartItemId)
        {
            var cartItem = _context.CartItems.FirstOrDefault(ci => ci.CartItemId == cartItemId);
            if (cartItem != null)
            {
                _context.CartItems.Remove(cartItem);
            }
        }

        public void Save()
        {
            _context.SaveChanges();
        }
    }

}
