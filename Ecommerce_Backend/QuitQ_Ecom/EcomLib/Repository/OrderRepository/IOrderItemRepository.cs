using EcomLib.Dtos.OrderDtos;
using EcomLib.Models.OrderManagement;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EcomLib.Repository.OrderRepository
{
    public interface IOrderItemRepository
    {
        Task<OrderItem> AddOrderItemAsync(OrderItem orderItem);
        Task UpdateOrderItemStatusAsync(int orderItemId, OrderItemStatus status);
        Task<List<OrderItem>> GetOrderItemsByOrderIdAsync(int orderId);
        Task<IEnumerable<SellerOrderItemDTO>> GetOrderItemsBySellerIdAsync(int sellerId);
        Task<decimal> GetTotalRevenueBySellerAsync(int sellerId);
        Task<OrderItem> GetOrderItemByIdAsync(int orderItemId);

        Task<List<OrderItemuserDTO>> GetOrderItemsByUserIdAsync(int userId);


    }

}
