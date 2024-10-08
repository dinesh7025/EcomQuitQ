using EcomLib.Dtos.DiscountDtos;
using EcomLib.Service;
using log4net;
using Microsoft.AspNetCore.Mvc;

namespace EcomWebApp.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class DiscountController : ControllerBase
    {
        private readonly DiscountService _discountService;
        private static readonly ILog _logger = LogManager.GetLogger(typeof(DiscountController));

        public DiscountController(DiscountService discountService)
        {
            _discountService = discountService;
        }

        [HttpGet]
        public async Task<IActionResult> GetAllDiscounts()
        {
            try
            {
                _logger.Info("Retrieving all discounts.");
                var discounts = await _discountService.GetAllDiscountsAsync();
                return Ok(discounts);
            }
            catch (Exception ex)
            {
                _logger.Error($"Error while retrieving all discounts. Error: {ex.Message}");
                return StatusCode(500, new { Message = "Internal Server Error" });
            }
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetDiscountById(int id)
        {
            try
            {
                _logger.Info($"Retrieving discount with ID: {id}");
                var discount = await _discountService.GetDiscountByIdAsync(id);
                if (discount == null)
                {
                    _logger.Warn($"Discount with ID: {id} not found.");
                    return NotFound(new { Message = "Discount not found." });
                }
                return Ok(discount);
            }
            catch (Exception ex)
            {
                _logger.Error($"Error while retrieving discount with ID: {id}. Error: {ex.Message}");
                return StatusCode(500, new { Message = "Internal Server Error" });
            }
        }
        // GET: api/Discount/{discountCode}
        [HttpGet("getByCode/{discountCode}")]
        public async Task<IActionResult> GetDiscountByCode(string discountCode)
        {
            try
            {
                var discount = await _discountService.GetDiscountByCodeAsync(discountCode);

                if (discount == null)
                {
                    return NotFound(new { message = "Invalid discount code" });
                }

                return Ok(discount);
            }
            catch (Exception ex)
            {
                {
                    _logger.Error($"Error while retrieving discount with code: {discountCode}. Error: {ex.Message}");
                    return StatusCode(500, new { Message = "Internal Server Error" });
                }
            }
        }

        [HttpPost]
        public async Task<IActionResult> CreateDiscount([FromBody] DiscountDTO discountDTO)
        {
            if (discountDTO == null)
            {
                _logger.Warn("Discount data is null.");
                return BadRequest(new { Message = "Discount data is required." });
            }

            try
            {
                _logger.Info("Creating new discount.");
                await _discountService.CreateDiscountAsync(discountDTO);
                return CreatedAtAction(nameof(GetDiscountById), new { id = discountDTO.DiscountId }, discountDTO);
            }
            catch (Exception ex)
            {
                _logger.Error($"Error while creating discount. Error: {ex.Message}");
                return StatusCode(500, new { Message = "Internal Server Error" });
            }
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> UpdateDiscount(int id, [FromBody] DiscountDTO discountDTO)
        {
            if (discountDTO == null)
            {
                _logger.Warn("Discount data is null.");
                return BadRequest(new { Message = "Discount data is required." });
            }

            if (id != discountDTO.DiscountId)
            {
                _logger.Warn($"Mismatch between route ID and discount ID.");
                return BadRequest(new { Message = "Discount ID mismatch." });
            }

            try
            {
                _logger.Info($"Updating discount with ID: {id}");
                await _discountService.UpdateDiscountAsync(id,discountDTO);
                return NoContent();
            }
            catch (KeyNotFoundException ex)
            {
                _logger.Warn($"Discount with ID: {id} not found. Error: {ex.Message}");
                return NotFound(new { Message = "Discount not found." });
            }
            catch (Exception ex)
            {
                _logger.Error($"Error while updating discount with ID: {id}. Error: {ex.Message}");
                return StatusCode(500, new { Message = "Internal Server Error" });
            }
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteDiscount(int id)
        {
            try
            {
                _logger.Info($"Deleting discount with ID: {id}");
                await _discountService.DeleteDiscountAsync(id);
                return NoContent();
            }
            catch (KeyNotFoundException ex)
            {
                _logger.Warn($"Discount with ID: {id} not found. Error: {ex.Message}");
                return NotFound(new { Message = "Discount not found." });
            }
            catch (Exception ex)
            {
                _logger.Error($"Error while deleting discount with ID: {id}. Error: {ex.Message}");
                return StatusCode(500, new { Message = "Internal Server Error" });
            }
        }
    }
}
