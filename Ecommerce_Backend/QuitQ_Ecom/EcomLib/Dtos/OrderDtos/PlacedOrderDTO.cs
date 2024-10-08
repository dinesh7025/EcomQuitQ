using EcomLib.Models.OrderManagement;
using EcomLib.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EcomLib.Dtos.OrderDtos
{
    public class PlaceOrderResponseDto
    {
        public int OrderId { get; set; }
        public decimal TotalAmount { get; set; }
        public DateTime OrderDate { get; set; }
        public OrderStatus OrderStatus { get; set; }
        public List<OrderItemResponseDto> OrderItems { get; set; }
        public List<PaymentResponseDto> Payments { get; set; }
    }

    public class OrderItemResponseDto
    {
        public int ProductId { get; set; }
        public int SellerId { get; set; }
        public int Quantity { get; set; }
        public decimal UnitPrice { get; set; }
        public decimal TotalPrice { get; set; }
        public OrderItemStatus ItemStatus { get; set; }
    }

    public class PaymentResponseDto
    {
        public DateTime PaymentDate { get; set; }
        public decimal PaymentAmount { get; set; }
        public PaymentMethod PaymentMethod { get; set; }
        public PaymentStatus PaymentStatus { get; set; }
    }

}
