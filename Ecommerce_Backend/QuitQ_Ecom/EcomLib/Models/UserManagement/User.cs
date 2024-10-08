
using EcomLib.Models;
using EcomLib.Models.Cartmanagement;
using EcomLib.Models.OrderManagement;
using EcomQuitQ.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ecomlib.Models.UserManagemnt    
{
    public class User
    {
        public int UserId { get; set; }
        public string Username { get; set; }
        public string PasswordHash { get; set; }
        public string Email { get; set; }
        public UserRole Role { get; set; }
        public DateTime DateCreated { get; set; }
        public bool IsActive { get; set; }

        // Navigation properties
        public PersonalDetails PersonalDetails { get; set; }
        public SellerDetails SellerDetails { get; set; }
        public Address Address { get; set; }

        // One-to-Many relationship with Cart
        public ICollection<Cart> Carts { get; set; }
        public ICollection<Order> Orders { get; set; }
        public ICollection<ProductReview> ProductReviews { get; set; }
        public ICollection<OrderItem> OrderItems { get; set; } // One-to-many relationship for seller's order items
        public ICollection<Wishlist> Wishlists { get; set; }
    }

    // Enum for User Role
    public enum UserRole
    {
        Admin,
        Seller,
        User
    }

}
