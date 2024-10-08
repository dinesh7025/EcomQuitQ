using Ecomlib.Models.UserManagemnt;
using EcomLib.Models.Cartmanagement;
using EcomLib.Models.DiscountManagement;
using EcomLib.Models.OrderManagement;
using EcomQuitQ.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EcomLib.Models.ProductManagment
{
    public class Product
    {
        public int ProductId { get; set; }
        public int SubCategoryId { get; set; }
        public int SellerId { get; set; }
        public int BrandId { get; set; }  // Foreign Key for Brand
        public string ProductName { get; set; }
        public string Description { get; set; }
        public decimal Price { get; set; }
        public int StockQuantity { get; set; }
        public string ImageUrl { get; set; }
        public DateTime DateAdded { get; set; }
        public bool IsActive { get; set; }

        // Navigation Properties
        public SubCategory SubCategory { get; set; }
        public Brand Brand { get; set; }
        public ICollection<CartItem> CartItems { get; set; }
        public ICollection<OrderItem> OrderItems { get; set; }
        public Inventory Inventory { get; set; }
        public ICollection<ProductReview> ProductReviews { get; set; }
        public ICollection<ProductDiscount> ProductDiscounts { get; set; }
        public User Seller { get; set; }
        public ICollection<Wishlist> Wishlists { get; set; }
    }

}
