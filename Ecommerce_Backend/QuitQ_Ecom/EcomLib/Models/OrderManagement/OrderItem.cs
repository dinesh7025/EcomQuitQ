using Ecomlib.Models.UserManagemnt;
using EcomLib.Models.ProductManagment;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EcomLib.Models.OrderManagement
{
    public class OrderItem
    {
        public int OrderItemId { get; set; } // Primary Key
        public int OrderId { get; set; } // Foreign Key from Order
        public int ProductId { get; set; } // Foreign Key from Product
        public int SellerId { get; set; } // Foreign Key from User (Seller)
        public int Quantity { get; set; }
        public decimal UnitPrice { get; set; }
        public decimal TotalPrice { get; set; }

        // New Properties
        public OrderItemStatus ItemStatus { get; set; } // Enum for item status

        // Navigation properties
        public Order Order { get; set; }
        public Product Product { get; set; }
        public User Seller { get; set; } // Navigation to Seller
    }

    // Enum for Order Item Status
    public enum OrderItemStatus
    {
        Pending,
        Processed,
        Shipped,
        Delivered,
        Cancelled
    }


}
