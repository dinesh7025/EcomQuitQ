using Ecomlib.Models.UserManagemnt;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EcomLib.Models.OrderManagement
{
    public class Order
    {
        public int OrderId { get; set; } // Primary Key
        public int UserId { get; set; } // Foreign Key from Users
        public DateTime OrderDate { get; set; }
        public decimal TotalAmount { get; set; }
        public int ShippingAddressId { get; set; } // Foreign Key from Address
        public int BillingAddressId { get; set; } // Foreign Key from Address
        public OrderStatus OrderStatus { get; set; } // Enum for order status

        // Navigation properties
        public User User { get; set; }
        public Address ShippingAddress { get; set; }
        public Address BillingAddress { get; set; }
        public ICollection<OrderItem> OrderItems { get; set; } // One-to-many relationship with OrderItem
        public ICollection<Payment> Payments { get; set; }
    }

    // Enum for Order Status
    public enum OrderStatus
    {
        Pending,
        Processed,
        Shipped,
        Delivered,
        Cancelled
    }


}
