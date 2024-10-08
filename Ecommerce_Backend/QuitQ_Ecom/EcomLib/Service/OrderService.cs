using EcomLib.Dtos.OrderDtos;
using EcomLib.Models;
using EcomLib.Models.OrderManagement;
using EcomLib.Repository.OrderRepository;
using EcomLib.Repository.PaymentRepository;
using EcomLib.Repository.ProductRepository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EcomLib.Service
{
    public class OrderService
    {
        private readonly IOrderRepository _orderRepository;
        private readonly IOrderItemRepository _orderItemRepository;
        private readonly IProductRepository _productRepository;
        private readonly IPaymentRepository _paymentRepository;

        public OrderService(IOrderRepository orderRepository, IOrderItemRepository orderItemRepository, IProductRepository productRepository, IPaymentRepository paymentRepository)
        {
            _orderRepository = orderRepository;
            _orderItemRepository = orderItemRepository;
            _productRepository = productRepository;
            _paymentRepository = paymentRepository;
        }

        public async Task<PlaceOrderResponseDto> PlaceOrderAsync(PlaceOrderDto orderDto)
        {
            // Create an Order entity from the DTO
            var order = new Order
            {
                UserId = orderDto.UserId,
                OrderDate = orderDto.OrderDate,
                TotalAmount = orderDto.TotalAmount,
                ShippingAddressId = orderDto.ShippingAddressId,
                BillingAddressId = orderDto.BillingAddressId,
                OrderStatus = orderDto.OrderStatus,
                OrderItems = new List<OrderItem>()
            };

            // Update product quantities and add order items
            foreach (var itemDto in orderDto.OrderItems)
            {
                var product = await _productRepository.GetProductByIdAsync(itemDto.ProductId);
                if (product == null)
                {
                    throw new Exception($"Product with ID {itemDto.ProductId} not found.");
                }
                var orderItem = new OrderItem
                {
                    ProductId = itemDto.ProductId,
                    SellerId = product.SellerId,
                    Quantity = itemDto.Quantity,
                    UnitPrice = itemDto.UnitPrice,
                    TotalPrice = itemDto.TotalPrice,
                    ItemStatus = itemDto.ItemStatus // Set initial status
                };

                order.OrderItems.Add(orderItem);
                await _productRepository.UpdateProductQuantityAsync(orderItem.ProductId, -orderItem.Quantity);//change product quatity in DB
            }

            // Add order to the database
            var newOrder = await _orderRepository.AddOrderAsync(order);

            // Process payments
            foreach (var paymentDto in orderDto.Payments)
            {
                var payment = new Payment
                {
                    OrderId = newOrder.OrderId, // Link payment to the new order
                    PaymentDate = paymentDto.PaymentDate,
                    PaymentAmount = paymentDto.PaymentAmount,
                    PaymentMethod = paymentDto.PaymentMethod,
                    PaymentStatus = paymentDto.PaymentStatus
                };

                await _paymentRepository.AddPaymentAsync(payment);
            }

            // Create the response DTO
            var response = new PlaceOrderResponseDto
            {
                OrderId = newOrder.OrderId,
                TotalAmount = newOrder.TotalAmount,
                OrderDate = newOrder.OrderDate,
                OrderStatus = newOrder.OrderStatus,
                OrderItems = newOrder.OrderItems.Select(oi => new OrderItemResponseDto
                {
                    ProductId = oi.ProductId,
                    SellerId = oi.SellerId,
                    Quantity = oi.Quantity,
                    UnitPrice = oi.UnitPrice,
                    TotalPrice = oi.TotalPrice,
                    ItemStatus = oi.ItemStatus
                }).ToList(),
                Payments = orderDto.Payments.Select(p => new PaymentResponseDto
                {
                    PaymentDate = p.PaymentDate,
                    PaymentAmount = p.PaymentAmount,
                    PaymentMethod = p.PaymentMethod,
                    PaymentStatus = p.PaymentStatus
                }).ToList()
            };

            return response;
        }


        public async Task UpdateOrderItemStatusAsync(int orderItemId, OrderItemStatus status)
        {
            await _orderItemRepository.UpdateOrderItemStatusAsync(orderItemId, status);

            // Get the orderId from the order item
            var orderItem = await _orderItemRepository.GetOrderItemByIdAsync(orderItemId);
            var orderId = orderItem.OrderId;

            // Check for all shipped items
            var orderItems = await _orderItemRepository.GetOrderItemsByOrderIdAsync(orderId);
            if (orderItems.All(oi => oi.ItemStatus == OrderItemStatus.Shipped))
            {
                await _orderRepository.UpdateOrderStatusAsync(orderId, OrderStatus.Shipped);
            }

            // Check for all delivered items
            if (orderItems.All(oi => oi.ItemStatus == OrderItemStatus.Delivered))
            {
                await _orderRepository.UpdateOrderStatusAsync(orderId, OrderStatus.Delivered);
            }
        }

        public async Task<IEnumerable<AdminOrderDTO>> GetAllOrdersAsync()
        {
            return await _orderRepository.GetAllOrdersAsync();
        }
        public async Task<IEnumerable<SellerOrderItemDTO>> GetOrderItemsBySellerAsync(int sellerId)
        {
            return await _orderItemRepository.GetOrderItemsBySellerIdAsync(sellerId);
        }
        // Get total revenue across all orders
        public async Task<decimal> GetTotalRevenueAsync()
        {
            return await _orderRepository.GetTotalRevenueAsync();
        }

        // Get total revenue by a specific seller
        public async Task<decimal> GetTotalRevenueBySellerAsync(int sellerId)
        {
            return await _orderItemRepository.GetTotalRevenueBySellerAsync(sellerId);
        }
        public async Task<List<OrderItemuserDTO>> GetUserOrderHistoryAsync(int userId)
        {
            return await _orderItemRepository.GetOrderItemsByUserIdAsync(userId);
        }
    }
}

