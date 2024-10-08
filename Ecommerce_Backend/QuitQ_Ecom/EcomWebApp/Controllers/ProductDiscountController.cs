using EcomLib.Dtos.DiscountDtos;
using EcomLib.Service;
using log4net;
using Microsoft.AspNetCore.Mvc;

namespace EcomWebApp.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductDiscountController : ControllerBase
    {
        private readonly ProductDiscountService _productDiscountService;
        private static readonly ILog _logger = LogManager.GetLogger(typeof(ProductDiscountController));

        public ProductDiscountController(ProductDiscountService productDiscountService)
        {
            _productDiscountService = productDiscountService;
        }

        [HttpGet]
        public async Task<IActionResult> GetAllProductDiscounts()
        {
            try
            {
                _logger.Info("Retrieving all product discounts.");
                var discounts = await _productDiscountService.GetAllProductDiscountsAsync();
                return Ok(discounts);
            }
            catch (Exception ex)
            {
                _logger.Error($"Error while retrieving all product discounts. Error: {ex.Message}");
                return StatusCode(500, new { Message = "Internal Server Error" });
            }
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetProductDiscountById(int id)
        {
            try
            {
                _logger.Info($"Retrieving product discount with ID: {id}");
                var discount = await _productDiscountService.GetProductDiscountByIdAsync(id);
                if (discount == null)
                {
                    _logger.Warn($"Product discount with ID: {id} not found.");
                    return NotFound(new { Message = "Product discount not found." });
                }
                return Ok(discount);
            }
            catch (Exception ex)
            {
                _logger.Error($"Error while retrieving product discount with ID: {id}. Error: {ex.Message}");
                return StatusCode(500, new { Message = "Internal Server Error" });
            }
        }

        [HttpPost]
        public async Task<IActionResult> CreateProductDiscount([FromBody] ProductDiscountDTO productDiscountDTO)
        {
            if (productDiscountDTO == null)
            {
                _logger.Warn("Product discount data is null.");
                return BadRequest(new { Message = "Product discount data is required." });
            }

            try
            {
                _logger.Info("Creating new product discount.");
                await _productDiscountService.CreateProductDiscountAsync(productDiscountDTO);
                return CreatedAtAction(nameof(GetProductDiscountById), new { id = productDiscountDTO.ProductDiscountId }, productDiscountDTO);
            }
            catch (Exception ex)
            {
                _logger.Error($"Error while creating product discount. Error: {ex.Message}");
                return StatusCode(500, new { Message = "Internal Server Error" });
            }
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> UpdateProductDiscount(int id, [FromBody] ProductDiscountDTO productDiscountDTO)
        {
            if (productDiscountDTO == null)
            {
                _logger.Warn("Product discount data is null.");
                return BadRequest(new { Message = "Product discount data is required." });
            }

            if (id != productDiscountDTO.ProductDiscountId)
            {
                _logger.Warn($"Mismatch between route ID and product discount ID.");
                return BadRequest(new { Message = "Product discount ID mismatch." });
            }

            try
            {
                _logger.Info($"Updating product discount with ID: {id}");
                await _productDiscountService.UpdateProductDiscountAsync(id, productDiscountDTO);
                return NoContent();
            }
            catch (KeyNotFoundException ex)
            {
                _logger.Warn($"Product discount with ID: {id} not found. Error: {ex.Message}");
                return NotFound(new { Message = "Product discount not found." });
            }
            catch (Exception ex)
            {
                _logger.Error($"Error while updating product discount with ID: {id}. Error: {ex.Message}");
                return StatusCode(500, new { Message = "Internal Server Error" });
            }
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteProductDiscount(int id)
        {
            try
            {
                _logger.Info($"Deleting product discount with ID: {id}");
                await _productDiscountService.DeleteProductDiscountAsync(id);
                return NoContent();
            }
            catch (KeyNotFoundException ex)
            {
                _logger.Warn($"Product discount with ID: {id} not found. Error: {ex.Message}");
                return NotFound(new { Message = "Product discount not found." });
            }
            catch (Exception ex)
            {
                _logger.Error($"Error while deleting product discount with ID: {id}. Error: {ex.Message}");
                return StatusCode(500, new { Message = "Internal Server Error" });
            }
        }
    }
}
