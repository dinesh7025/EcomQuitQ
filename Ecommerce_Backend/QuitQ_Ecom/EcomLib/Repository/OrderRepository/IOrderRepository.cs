using EcomLib.Dtos.OrderDtos;
using EcomLib.Models.OrderManagement;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EcomLib.Repository.OrderRepository
{
    public interface IOrderRepository
    {
        Task<Order> AddOrderAsync(Order order);
        Task<Order> GetOrderByIdAsync(int orderId);
        Task UpdateOrderStatusAsync(int orderId, OrderStatus status);
        Task<bool> AllOrderItemsProcessedAsync(int orderId);
        Task<IEnumerable<AdminOrderDTO>> GetAllOrdersAsync();
        Task<decimal> GetTotalRevenueAsync();

    }

}

