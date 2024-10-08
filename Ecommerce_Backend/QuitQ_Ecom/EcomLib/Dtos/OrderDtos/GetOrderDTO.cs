using EcomLib.Models.OrderManagement;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EcomLib.Dtos.OrderDtos
{
    public class AdminOrderDTO
    {
        public int OrderId { get; set; }
        public string UserName { get; set; } // From User table based on UserId
        public DateTime OrderDate { get; set; }
        public decimal TotalAmount { get; set; }
        public OrderStatus OrderStatus { get; set; }
    }
    public class SellerOrderItemDTO
    {
        public int OrderItemId { get; set; }
        public string UserName { get; set; }
        public string ProductName { get; set; } // From Product table based on ProductId
        public int Quantity { get; set; }
        public decimal UnitPrice { get; set; }
        public decimal TotalPrice { get; set; }
        public OrderItemStatus ItemStatus { get; set; }
    }

    public class OrderItemuserDTO
    {
        public int OrderItemId { get; set; }
        public string ProductName { get; set; }
        public int Quantity { get; set; }
        public decimal UnitPrice { get; set; }
        public decimal TotalPrice { get; set; }
        public string ItemStatus { get; set; }
        public string UserName { get; set; }
        public string ImageUrl { get; set; } // Assuming you want to display the image
    }


}
