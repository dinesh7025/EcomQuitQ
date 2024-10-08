using Microsoft.AspNetCore.Mvc;
using log4net;
using System.Threading.Tasks;
using EcomLib.Models.OrderManagement;
using EcomLib.Service;
using EcomLib.Dtos.OrderDtos;
using Microsoft.AspNetCore.Authorization;
using Ecomlib.Models.UserManagemnt;
using System.Text.RegularExpressions;


[Route("api/[controller]")]
[Authorize]
public class OrderController : ControllerBase
{
    private readonly OrderService _orderService;
    private readonly UserService _userService;
    private readonly EmailService _emailService;
    private readonly ILog _logger = LogManager.GetLogger(typeof(OrderController));

    public OrderController(OrderService orderService, UserService userService, EmailService emailService)
    {
        _orderService = orderService;
        _userService = userService;
        _emailService = emailService;
    }

    [Authorize(Roles = "User")]
    [HttpPost("place-order")]
    public async Task<IActionResult> PlaceOrder([FromBody] PlaceOrderDto orderDto)
    {
        if (orderDto == null || orderDto.OrderItems == null || orderDto.OrderItems.Count == 0 || orderDto.Payments == null || orderDto.Payments.Count == 0)
        {
            _logger.Warn("Attempted to place an order with no items or payment details.");
            return BadRequest("Order cannot be empty.");
        }

        try
        {
             var orderResponse = await _orderService.PlaceOrderAsync(orderDto);
            _logger.Info($"Order placed successfully. Order ID: {orderResponse.OrderId}");
            //Fetch user details using UserService
            var user = await _userService.GetUserByIdAsync(orderDto.UserId);
            if (user != null)
            {
                var emailSubject = "Order Confirmation from QuitQ!";
                var emailBody = $"<div style='font-family: Arial, sans-serif;'>" +
                                $"<h2 style='color: #333;'>Hi {user.UserName},</h2>" +
                                $"<p>Thank you for placing an order with <strong>QuitQ!</strong></p>" +
                                $"<p><strong>Order Summary:</strong></p>" +
                                $"<table style='width: 100%; border-collapse: collapse;'>" +
                                $"  <tr style='background-color: #f2f2f2;'>" +
                                $"    <td style='padding: 8px;'><strong>Order ID:</strong></td>" +
                                $"    <td style='padding: 8px;'>{orderResponse.OrderId}</td>" +
                                $"  </tr>" +
                                $"  <tr>" +
                                $"    <td style='padding: 8px;'><strong>Total Amount:</strong></td>" +
                                $"    <td style='padding: 8px;'>{orderResponse.TotalAmount:C}</td>" +
                                $"  </tr>" +
                                $"  <tr style='background-color: #f2f2f2;'>" +
                                $"    <td style='padding: 8px;'><strong>Order Date:</strong></td>" +
                                $"    <td style='padding: 8px;'>{orderResponse.OrderDate}</td>" +
                                $"  </tr>" +
                                $"  <tr>" +
                                $"    <td style='padding: 8px;'><strong>Order Status:</strong></td>" +
                                $"    <td style='padding: 8px;'>{orderResponse.OrderStatus.ToString()}</td>" +
                                $"  </tr>" +
                                $"</table><br/>" +

                                $"<p><strong>Payment Details:</strong></p>" +
                                $"<table style='width: 100%; border-collapse: collapse;'>" +
                                $"  <thead style='background-color: #333; color: white;'>" +
                                $"    <tr>" +
                                $"      <th style='padding: 10px; text-align: left;'>Payment Amount</th>" +
                                $"      <th style='padding: 10px; text-align: left;'>Payment Method</th>" +
                                $"      <th style='padding: 10px; text-align: left;'>Payment Date</th>" +
                                $"      <th style='padding: 10px; text-align: left;'>Payment Status</th>" +
                                $"    </tr>" +
                                $"  </thead>" +
                                $"  <tbody>";

                foreach (var payment in orderResponse.Payments)
                {
                    emailBody += $"    <tr style='border-bottom: 1px solid #ddd;'>" +
                                 $"      <td style='padding: 8px;'>{payment.PaymentAmount:C}</td>" +
                                 $"      <td style='padding: 8px;'>{payment.PaymentMethod.ToString()}</td>" +
                                 $"      <td style='padding: 8px;'>{payment.PaymentDate.ToString("dddd, MMMM dd, yyyy h:mm tt")}</td>" +
                                 $"      <td style='padding: 8px;'>{payment.PaymentStatus.ToString()}</td>" +
                                 $"    </tr>";
                }

                emailBody += $"  </tbody></table><br/>" +

                             $"<p>We appreciate your business!</p>" +
                             $"<p>Best Regards,<br/>" +
                             $"<strong>QuitQ Team</strong></p>" +
                             $"</div>";

                // Send email to the user
                await _emailService.SendEmailAsync(user.Email, emailSubject, emailBody);

                _logger.Info($"Email sent to {user.Email} regarding order ID: {orderResponse.OrderId}");
            }
            // Return the response DTO
            return Ok(orderResponse);
        }
        catch (Exception ex)
        {
            _logger.Error("An error occurred while placing the order.", ex);
            return StatusCode(500, "Internal server error");
        }
    }
    [Authorize(Roles = "Admin")]
    [HttpGet("getAllOrders")]
    public async Task<IActionResult> GetAllOrders()
    {
        try
        {
            var orders = await _orderService.GetAllOrdersAsync();
            return Ok(orders);
        }
        catch (Exception ex)
        {
            _logger.Error("Error fetching all orders for admin", ex);
            return StatusCode(500, "Internal server error");
        }
    }
    [Authorize(Roles = "Seller,Admin")]
    [HttpPut("update-order-item-status/{orderItemId}")]
    public async Task<IActionResult> UpdateOrderItemStatus(int orderItemId, [FromBody] OrderItemStatus status)
    {
        try
        {
            await _orderService.UpdateOrderItemStatusAsync(orderItemId, status);
            _logger.Info($"Order item status updated. Order Item ID: {orderItemId}, New Status: {status}");
            return NoContent();
        }
        catch (Exception ex)
        {
            _logger.Error($"An error occurred while updating order item status for Order Item ID: {orderItemId}.", ex);
            return StatusCode(500, "Internal server error");
        }
    }
    [Authorize(Roles = "Seller,Admin")]
    [HttpGet("{sellerId}")]
    public async Task<IActionResult> GetOrderItemsBySeller(int sellerId)
    {
        try
        {
            var orderItems = await _orderService.GetOrderItemsBySellerAsync(sellerId);
            return Ok(orderItems);
        }
        catch (Exception ex)
        {
            _logger.Error( "Error fetching seller's order items",ex);
            return StatusCode(500, "Internal server error");
        }
    }

    [Authorize(Roles = "User,Admin")]
    [HttpGet("user/order-history/{userId}")]
    public async Task<IActionResult> GetUserOrderHistory(int userId)
    {
        _logger.Info($"Retrieving order history for the userId: {userId}");
        var orderItems = await _orderService.GetUserOrderHistoryAsync(userId);
        if (orderItems == null || !orderItems.Any())
        {
            _logger.Warn("No order found for user with ID " + userId);
            return NotFound("No orders found for this user.");
        }

        return Ok(orderItems);
    }
}
