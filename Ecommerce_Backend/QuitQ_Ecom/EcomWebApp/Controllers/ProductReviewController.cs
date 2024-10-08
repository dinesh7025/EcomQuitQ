using EcomLib.Dtos;
using EcomLib.Exceptionhandling;
using EcomLib.Service;
using log4net;
using Microsoft.AspNetCore.Mvc;

namespace EcomWebApp.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class ProductReviewController : ControllerBase
    {
        private readonly ProductReviewService _productReviewService;
        private static readonly ILog log = LogManager.GetLogger(typeof(ProductReviewController));

        public ProductReviewController(ProductReviewService productReviewService)
        {
            _productReviewService = productReviewService;
        }

        [HttpPost("add")]
        public async Task<IActionResult> AddReviewAsync([FromBody] ReviewDTO reviewDto)
        {
            try
            {
                var reviewId = await _productReviewService.AddReviewAsync(reviewDto);
                log.Info($"Review added successfully with ID: {reviewId} by UserId: {reviewDto.UserId} for productId: {reviewDto.ProductId}");
                return Ok(new { reviewId, message = "Review added successfully" });
            }
            catch (ProductNotFoundException ex)
            {
                log.Warn($"Product not found: {ex.Message}");
                return NotFound(ex.Message);
            }
            catch (UserNotFoundException ex)
            {
                log.Warn($"User not found: {ex.Message}");
                return NotFound(ex.Message);
            }
            catch (Exception ex)
            {
                log.Error("An error occurred while adding the review.", ex);
                return StatusCode(500, "An error occurred while adding the review.");
            }
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetReviewByIdAsync(int id)
        {
            try
            {
                var review = await _productReviewService.GetReviewByIdAsync(id);
                return Ok(review);
            }
            catch (ReviewNotFoundException ex)
            {
                log.Warn($"Review not found: {ex.Message}");
                return NotFound(ex.Message);
            }
            catch (Exception ex)
            {
                log.Error("An error occurred while fetching the review.", ex);
                return StatusCode(500, "An error occurred while fetching the review.");
            }
        }

        [HttpGet("product/{productId}")]
        public async Task<IActionResult> GetReviewsByProductIdAsync(int productId)
        {
            try
            {
                var reviews = await _productReviewService.GetReviewsByProductIdAsync(productId);
                return Ok(reviews);
            }
            catch (ProductNotFoundException ex)
            {
                log.Warn($"Product not found: {ex.Message}");
                return NotFound(ex.Message);
            }
            catch (Exception ex)
            {
                log.Error("An error occurred while fetching the reviews.", ex);
                return StatusCode(500, "An error occurred while fetching the reviews.");
            }
        }
        [HttpGet("user/{userId}")]
        public async Task<IActionResult> GetReviewsByUserIdAsync(int userId)
        {
            try
            {
                var reviews = await _productReviewService.GetReviewsByUserIdAsync(userId);
                return Ok(reviews);
            }
            catch (UserNotFoundException ex)
            {
                log.Warn($"Product not found: {ex.Message}");
                return NotFound(ex.Message);
            }
            catch (Exception ex)
            {
                log.Error("An error occurred while fetching the reviews.", ex);
                return StatusCode(500, "An error occurred while fetching the reviews.");
            }
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> UpdateReviewAsync(int id, [FromBody] ReviewDTO reviewDto)
        {
            try
            {
                var updated = await _productReviewService.UpdateReviewAsync(id, reviewDto);
                if (updated)
                {
                    log.Info($"Review with ID {id} updated successfully.");
                    return Ok(new { message = "Review updated successfully" });
                }

                return BadRequest("Failed to update the review.");
            }
            catch (ReviewNotFoundException ex)
            {
                log.Warn($"Review not found: {ex.Message}");
                return NotFound(ex.Message);
            }
            catch (Exception ex)
            {
                log.Error("An error occurred while updating the review.", ex);
                return StatusCode(500, "An error occurred while updating the review.");
            }
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteReviewAsync(int id)
        {
            try
            {
                var deleted = await _productReviewService.DeleteReviewAsync(id);
                if (deleted)
                {
                    log.Info($"Review with ID {id} deleted successfully.");
                    return Ok(new { message = "Review deleted successfully" });
                }

                return BadRequest("Failed to delete the review.");
            }
            catch (ReviewNotFoundException ex)
            {
                log.Warn($"Review not found: {ex.Message}");
                return NotFound(ex.Message);
            }
            catch (Exception ex)
            {
                log.Error("An error occurred while deleting the review.", ex);
                return StatusCode(500, "An error occurred while deleting the review.");
            }
        }
    }

}
