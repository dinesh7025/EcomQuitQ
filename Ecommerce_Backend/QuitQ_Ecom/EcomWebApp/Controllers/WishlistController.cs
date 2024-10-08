using EcomLib.Service;
using log4net;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace EcomWebApp.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class WishlistController : ControllerBase
    {
        // Initializing log4net logger
        private static readonly ILog log = LogManager.GetLogger(typeof(WishlistController));

        private readonly WishlistService _wishlistService;

        public WishlistController(WishlistService wishlistService)
        {
            _wishlistService = wishlistService;
        }

        [Authorize(Roles = "User,Admin")]
        [HttpPost("add")]
        public async Task<IActionResult> AddToWishlist(int userId, int productId)
        {
            try
            {
                if (userId <= 0 || productId <= 0)
                {
                    log.Warn($"Invalid input: UserId={userId}, ProductId={productId}");
                    return BadRequest("Invalid user or product ID.");
                }

                await _wishlistService.AddToWishlist(userId, productId);
                log.Info($"Product with ProductId={productId} added to wishlist for UserId={userId}.");
                return Ok(new {message = "Product added to wishlist successfully." });
            }
            catch (Exception ex)
            {
                log.Error($"An error occurred while adding ProductId={productId} to UserId={userId}'s wishlist.", ex);
                return StatusCode(500, "An error occurred while processing your request.");
            }
        }
        [Authorize(Roles = "User,Admin")]
        [HttpGet("user/{userId}")]
        public async Task<IActionResult> GetUserWishlist(int userId)
        {
            try
            {
                if (userId <= 0)
                {
                    log.Warn($"Invalid UserId={userId}.");
                    return BadRequest("Invalid user ID.");
                }

                var wishlist = await _wishlistService.GetUserWishlist(userId);

                if (wishlist == null || !wishlist.Any())
                {
                    log.Warn($"No wishlist found for UserId={userId}.");
                    return NotFound("No items in wishlist.");
                }

                log.Info($"Fetched wishlist for UserId={userId}.");
                return Ok(wishlist);
            }
            catch (Exception ex)
            {
                log.Error($"An error occurred while fetching wishlist for UserId={userId}.", ex);
                return StatusCode(500, "An error occurred while processing your request.");
            }
        }
        [Authorize(Roles = "User,Admin")]
        [HttpDelete("remove")]
        public async Task<IActionResult> RemoveFromWishlist(int userId, int productId)
        {
            try
            {
                if (userId <= 0 || productId <= 0)
                {
                    log.Warn($"Invalid input: UserId={userId}, ProductId={productId}");
                    return BadRequest("Invalid user or product ID.");
                }

                await _wishlistService.RemoveFromWishlist(userId, productId);
                log.Info($"Product with ProductId={productId} removed from wishlist for UserId={userId}.");
                return Ok(new { message = "Product removed to wishlist successfully." });
            }
            catch (Exception ex)
            {
                log.Error($"An error occurred while removing ProductId={productId} from UserId={userId}'s wishlist.", ex);
                return StatusCode(500, "An error occurred while processing your request.");
            }
        }
    }
}
