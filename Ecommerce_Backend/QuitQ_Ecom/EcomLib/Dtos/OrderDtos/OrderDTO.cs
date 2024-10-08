using EcomLib.Models;
using EcomLib.Models.OrderManagement;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EcomLib.Dtos.OrderDtos
{
    public class PlaceOrderDto
    {
        public int UserId { get; set; }
        public DateTime OrderDate { get; set; }
        public decimal TotalAmount { get; set; }
        public int ShippingAddressId { get; set; }
        public int BillingAddressId { get; set; }
        public OrderStatus OrderStatus { get; set; }
        public List<OrderItemDto> OrderItems { get; set; }
        public List<PaymentDto> Payments { get; set; }
    }

    public class PaymentDto
    {
        public DateTime PaymentDate { get; set; }
        public decimal PaymentAmount { get; set; }
        public PaymentMethod PaymentMethod { get; set; }
        public PaymentStatus PaymentStatus { get; set; }
    }

    public class OrderItemDto
    {
        public int ProductId { get; set; }
        public int SellerId { get; set; }
        public int Quantity { get; set; }
        public decimal UnitPrice { get; set; }
        public decimal TotalPrice { get; set; }
        public OrderItemStatus ItemStatus { get; set; }
    }


}
