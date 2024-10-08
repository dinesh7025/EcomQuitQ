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
    public class OrderItemRepository : IOrderItemRepository
    {
        private readonly AppDbContext _context;

        public OrderItemRepository(AppDbContext context)
        {
            _context = context;
        }

        public async Task<OrderItem> AddOrderItemAsync(OrderItem orderItem)
        {
            await _context.OrderItems.AddAsync(orderItem);
            await _context.SaveChangesAsync();
            return orderItem;
        }

        public async Task UpdateOrderItemStatusAsync(int orderItemId, OrderItemStatus status)
        {
            var orderItem = await _context.OrderItems.FindAsync(orderItemId);
            if (orderItem == null)
            {
                throw new OrderItemNotFoundException(orderItemId);
            }

            orderItem.ItemStatus = status;
            await _context.SaveChangesAsync();
        }

        public async Task<List<OrderItem>> GetOrderItemsByOrderIdAsync(int orderId)
        {
            return await _context.OrderItems.Where(oi => oi.OrderId == orderId).ToListAsync();
        }
        public async Task<OrderItem> GetOrderItemByIdAsync(int orderItemId)
        {
            return await _context.OrderItems.FirstOrDefaultAsync(oi => oi.OrderItemId == orderItemId);
        }
        public async Task<IEnumerable<SellerOrderItemDTO>> GetOrderItemsBySellerIdAsync(int sellerId)
        {
            return await _context.OrderItems
                .Include(oi => oi.Product)           
                .Include(oi => oi.Order)             
                .ThenInclude(o => o.User)   
                .Where(oi => oi.Product.SellerId == sellerId)
                .Select(oi => new SellerOrderItemDTO
                {
                    OrderItemId = oi.OrderItemId,
                    ProductName = oi.Product.ProductName,
                    Quantity = oi.Quantity,
                    UnitPrice = oi.UnitPrice,
                    TotalPrice = oi.TotalPrice,
                    ItemStatus = oi.ItemStatus,
                    UserName = oi.Order.User.Username 
                }).ToListAsync();
        }
        // Get total revenue by seller (from the OrderItems table)
        public async Task<decimal> GetTotalRevenueBySellerAsync(int sellerId)
        {
            // Sum the price from OrderItems for the given seller
            var totalRevenueBySeller = await _context.OrderItems
                .Where(oi => oi.SellerId == sellerId)
                .SumAsync(oi => oi.TotalPrice);

            return totalRevenueBySeller;
        }

        public async Task<List<OrderItemuserDTO>> GetOrderItemsByUserIdAsync(int userId)
        {
            return await _context.OrderItems
                .Include(oi => oi.Product)
                .Include(oi => oi.Order)
                .ThenInclude(o => o.User)
                .Where(oi => oi.Order.UserId == userId) // Filter by UserId
                .Select(oi => new OrderItemuserDTO
                {
                    OrderItemId = oi.OrderItemId,
                    ProductName = oi.Product.ProductName,
                    Quantity = oi.Quantity,
                    UnitPrice = oi.UnitPrice,
                    TotalPrice = oi.TotalPrice,
                    ItemStatus = oi.ItemStatus.ToString(),
                    UserName = oi.Order.User.Username,
                    ImageUrl = oi.Product.ImageUrl // Adjust according to your model
                })
                .ToListAsync();
        }


    }

}
