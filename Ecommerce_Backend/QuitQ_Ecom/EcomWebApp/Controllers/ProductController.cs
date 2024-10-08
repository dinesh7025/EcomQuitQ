using EcomLib.Dtos.ProductDtos;
using EcomLib.Exceptionhandling;
using EcomLib.Service.EcomLib.Services;
using log4net;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace EcomWebApp.Controllers
{
    [Route("api/[controller]")]
    public class ProductController : ControllerBase
    {
        private readonly ProductService _productService;
        private static readonly ILog log = LogManager.GetLogger(typeof(ProductController));

        public ProductController(ProductService productService)
        {
            _productService = productService;
        }

        [HttpGet("all")]
        public async Task<IActionResult> GetAllProducts()
        {
            try
            {
                var products = await _productService.GetAllProductsAsync();
                return Ok(products);
            }
            catch (System.Exception ex)
            {
                log.Error("Error fetching all products", ex);
                return StatusCode(500, "Internal server error");
            }
        }
        [HttpGet("all-product-with-seller")]
        public async Task<IActionResult> GetAllProductsWithSeller()
        {
            try
            {
                var products = await _productService.GetAllProductswithSellerAsync();
                return Ok(products);
            }
            catch (System.Exception ex)
            {
                log.Error("Error fetching all products", ex);
                return StatusCode(500, "Internal server error");
            }
        }

        [HttpGet("{productId}")]
        public async Task<IActionResult> GetProductById(int productId)
        {
            try
            {
                var product = await _productService.GetProductByIdAsync(productId);
                return Ok(product);
            }
            catch (ProductNotFoundException ex)
            {
                log.Warn($"Product with id {productId} not found: {ex.Message}");
                return NotFound(new { Message = ex.Message });
            }
            catch (System.Exception ex)
            {
                log.Error($"Error fetching product with id {productId}", ex);
                return StatusCode(500, "Internal server error");
            }
        }

        [HttpGet("search")]
        public async Task<IActionResult> GetProductsByName([FromQuery] string productName)
        {
            try
            {
                var products = await _productService.GetProductsByNameAsync(productName);
                return Ok(products);
            }
            catch (ProductNotFoundException ex)
            {
                log.Warn($"No products found for name {productName}: {ex.Message}");
                return NotFound(new { Message = ex.Message });
            }
            catch (System.Exception ex)
            {
                log.Error($"Error fetching products by name {productName}", ex);
                return StatusCode(500, "Internal server error");
            }
        }

        [Authorize(Roles = "Seller,Admin")]
        [HttpPost("Addproduct")]
        public async Task<IActionResult> AddProduct([FromBody] ProductWithInventoryDTO productWithInventoryDto)
        {
            try
            {
                var newProductId = await _productService.AddProductAsync(productWithInventoryDto.Product);
                return Ok( new { message = $"Product added successfully with ID: {newProductId}" });
            }
            catch (Exception ex)
            {
                log.Error("Error adding product", ex);
                return StatusCode(StatusCodes.Status500InternalServerError, "Internal server error");
            }
        }
        
        [Authorize(Roles = "Seller,Admin")]
        [HttpPut("products/{id}")]
        public async Task<IActionResult> UpdateProduct(int id, [FromBody] ProductWithInventoryDTO productWithInventoryDto)
        {
            try
            {
                if (id != productWithInventoryDto.Product.ProductId)
                {
                    return BadRequest("Product ID mismatch.");
                }

                // Update the product and inventory
                await _productService.UpdateProductAsync(productWithInventoryDto.Product);

                // Return a success message
                return Ok(new { message = "Product updated successfully", productId = id });
            }
            catch (ProductNotFoundException ex)
            {
                log.Warn("Product not found for update", ex);
                return NotFound(ex.Message);
            }
            catch (Exception ex)
            {
                log.Error("Error updating product", ex);
                return StatusCode(StatusCodes.Status500InternalServerError, "Internal server error");
            }
        }

        [Authorize(Roles = "Seller,Admin")]
        [HttpDelete("{productId}")]
        public async Task<IActionResult> DeleteProduct(int productId)
        {
            try
            {
                await _productService.DeleteProductAsync(productId);
                return Ok(new { Message = "Product deleted successfully" });
            }
            catch (ProductNotFoundException ex)
            {
                log.Warn($"Error deleting product: {ex.Message}");
                return NotFound(new { Message = ex.Message });
            }
            catch (System.Exception ex)
            {
                log.Error($"Error deleting product with id {productId}", ex);
                return StatusCode(500, "Internal server error");
            }
        }

        [Authorize(Roles = "Seller,Admin")]
        [HttpGet("seller/{sellerId}")]
        public async Task<IActionResult> GetProductsBySellerId(int sellerId)
        {
            try
            {
                var products = await _productService.GetProductsBySellerIdAsync(sellerId);
                if (products == null || !products.Any())
                {
                    log.Info($"No products found for sellerId: {sellerId}");
                    return NotFound($"No products found for sellerId: {sellerId}");
                }
                return Ok(products);
            }
            catch (Exception ex)
            {
                log.Error($"Error fetching products for sellerId: {sellerId}. Exception: {ex.Message}");
                return StatusCode(500, "Internal server error.");
            }
        }
        [HttpGet("details/{productId}")]
        public async Task<ActionResult<ProductDetailsDTO>> GetProductDetails(int productId)
        {
            try
            {
                if (productId <= 0)
                {
                    log.Warn($"Invalid ProductId={productId}.");
                    return BadRequest("Invalid product ID.");
                }

                var productDetails = await _productService.GetProductDetailsFull(productId);

                if (productDetails == null)
                {
                    log.Warn($"Product with ProductId={productId} not found.");
                    return NotFound($"Product with ID {productId} not found.");
                }

                log.Info($"Fetched details for ProductId={productId}.");
                return Ok(productDetails);
            }
            catch (Exception ex)
            {
                log.Error($"An error occurred while fetching details for ProductId={productId}.", ex);
                return StatusCode(500, "An error occurred while processing your request.");
            }
        }
    }
}
