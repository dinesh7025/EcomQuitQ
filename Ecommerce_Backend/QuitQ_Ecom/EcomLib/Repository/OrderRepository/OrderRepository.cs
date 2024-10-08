using EcomLib.Dtos.OrderDtos;
using EcomLib.Exceptionhandling;
using EcomLib.Models.OrderManagement;
using EcomQuitQ.Data;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EcomLib.Repository.OrderRepository
{
    public class OrderRepository : IOrderRepository
    {
        private readonly AppDbContext _context;

        public OrderRepository(AppDbContext context)
        {
            _context = context;
        }
        public async Task<IEnumerable<AdminOrderDTO>> GetAllOrdersAsync()
        {
            return await _context.Orders
                .Include(o => o.User) // Join with User to get UserName
                .Select(o => new AdminOrderDTO
                {
                    OrderId = o.OrderId,
                    UserName = o.User.Username,
                    OrderDate = o.OrderDate,
                    TotalAmount = o.TotalAmount,
                    OrderStatus = o.OrderStatus
                }).ToListAsync();
        }
        public async Task<Order> AddOrderAsync(Order order)
        {
            await _context.Orders.AddAsync(order);
            await _context.SaveChangesAsync();
            return order;
        }

        public async Task<Order> GetOrderByIdAsync(int orderId)
        {
            var order = await _context.Orders.Include(o => o.OrderItems).FirstOrDefaultAsync(o => o.OrderId == orderId);
            if (order == null)
            {
                throw new OrderNotFoundException(orderId);
            }
            return order;
        }

        public async Task UpdateOrderStatusAsync(int orderId, OrderStatus status)
        {
            var order = await GetOrderByIdAsync(orderId);
            order.OrderStatus = status;
            await _context.SaveChangesAsync();
        }

        public async Task<bool> AllOrderItemsProcessedAsync(int orderId)
        {
            var orderItems = await _context.OrderItems.Where(oi => oi.OrderId == orderId).ToListAsync();
            return orderItems.All(oi => oi.ItemStatus == OrderItemStatus.Processed);
        }
        // Get total revenue across all orders (from the Orders table)
        public async Task<decimal> GetTotalRevenueAsync()
        {
            // Sum the total price from all orders
            var totalRevenue = await _context.Orders
                .SumAsync(o => o.TotalAmount);

            return totalRevenue;
        }
    }

}
