using EcomLib.Dtos.CartDtos;
using EcomLib.Exceptionhandling;
using EcomLib.Service;
using log4net;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Cors.Infrastructure;
using Microsoft.AspNetCore.Mvc;

namespace EcomWebApp.Controllers
{

    [Route("api/[controller]")]
    [ApiController]

    public class CartController : ControllerBase
    {
        // Log4Net logger
        private readonly ILog _logger = LogManager.GetLogger(typeof(CartController));

        private readonly CartService _cartService;

        public CartController(CartService cartService)
        {
            _cartService = cartService;
        }

        // Get Cart by User ID
        [HttpGet("{userId}")]
        [Authorize(Roles = "Admin,User")]
        public IActionResult GetCart(int userId)
        {
            try
            {
                _logger.Info($"Fetching cart for User ID: {userId}");
                var cart = _cartService.GetCartByUserId(userId);

                if (cart == null)
                {
                    _logger.Warn($"No cart found for User ID: {userId}");
                    return NotFound("Cart not found");
                }

                _logger.Info($"Successfully fetched cart for User ID: {userId}");
                return Ok(cart);
            }
            catch (Exception ex)
            {
                _logger.Error($"Error while fetching cart for User ID {userId}: {ex.Message}", ex);
                return StatusCode(StatusCodes.Status500InternalServerError, "Internal server error");
            }
        }

        [Authorize(Roles = "User")]
        //Add item to cart for a user
        [HttpPost("add/{userId}")]
        public IActionResult AddToCart(int userId, [FromBody] CartItemDTO cartItemDto)
        {
            try
            {
                _logger.Info($"Adding item to cart for User ID: {userId}, Product ID: {cartItemDto.ProductId}");

                _cartService.AddToCart(userId, cartItemDto);

                _logger.Info($"Successfully added item to cart. User ID: {userId}, Product ID: {cartItemDto.ProductId}");
                return Ok(new { message = "Item Added successfully", success = true });
            }
            catch (Exception ex)
            {
                _logger.Error($"Error while adding item to cart for User ID {userId}: {ex.Message}", ex);
                return StatusCode(StatusCodes.Status500InternalServerError, "Internal server error");
            }
        }

        [Authorize(Roles = "User")]
        // Update cart for a user
        [HttpPut("update")]
        public IActionResult UpdateCart([FromBody] CartDTO cartDto)
        {
            try
            {
                _logger.Info($"Updating cart for User ID: {cartDto.UserId}");

                _cartService.UpdateCart(cartDto.UserId, cartDto);

                _logger.Info($"Successfully updated cart for User ID: {cartDto.UserId}");
                return Ok(new { message = "Cart updated successfully", success = true });
            }
            catch (Exception ex)
            {
                _logger.Error($"Error while updating cart for User ID {cartDto.UserId}: {ex.Message}", ex);
                return NotFound(new { message = "Cart not found", success = false });
            }
        }

        [Authorize(Roles = "User")]
        // Remove item from cart
        [HttpDelete("remove/{userId}/{cartItemId}")]
        public IActionResult RemoveFromCart(int userId, int cartItemId)
        {
            try
            {
                _logger.Info($"Removing item with CartItem ID: {cartItemId} from cart for User ID: {userId}");

                _cartService.RemoveFromCart(userId, cartItemId);

                _logger.Info($"Successfully removed item with CartItem ID: {cartItemId} for User ID: {userId}");
                return Ok(new { message = "Item removed successfully", success = true });
            }
            catch (Exception ex)
            {
                _logger.Error($"Error while removing item with CartItem ID {cartItemId} from cart for User ID {userId}: {ex.Message}", ex);
                return StatusCode(StatusCodes.Status500InternalServerError, "Internal server error");
            }
        }
    }


}
