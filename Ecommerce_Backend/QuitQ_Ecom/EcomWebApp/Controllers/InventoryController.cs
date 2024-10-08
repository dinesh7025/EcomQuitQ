using EcomLib.Exceptionhandling;
using EcomLib.Service;
using Microsoft.AspNetCore.Mvc;

namespace EcomWebApp.Controllers
{
    [Route("api/v{version:apiVersion}")]
    [ApiController]
    public class InventoryController : ControllerBase
    {
        private readonly InventoryService _inventoryService;
        private readonly ILogger<InventoryController> _logger;

        public InventoryController(InventoryService inventoryService, ILogger<InventoryController> logger)
        {
            _inventoryService = inventoryService;
            _logger = logger;
        }

        [HttpGet]
        public async Task<IActionResult> GetAllInventories()
        {
            try
            {
                var inventories = await _inventoryService.GetAllInventoriesAsync();
                return Ok(inventories);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while retrieving all inventories.");
                return StatusCode(500, "Internal server error. Please try again later.");
            }
        }

        [HttpGet("{inventoryId}")]
        public async Task<IActionResult> GetInventoryById(int inventoryId)
        {
            try
            {
                var inventory = await _inventoryService.GetInventoryByIdAsync(inventoryId);
                return Ok(inventory);
            }
            catch (InventoryNotFoundException ex)
            {
                _logger.LogWarning(ex, "Inventory with ID {InventoryId} not found.", inventoryId);
                return NotFound(ex.Message);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while retrieving inventory with ID {InventoryId}.", inventoryId);
                return StatusCode(500, "Internal server error. Please try again later.");
            }
        }

        [HttpGet("byProductId/{productId}")]
        public async Task<IActionResult> GetInventoriesByProductId(int productId)
        {
            try
            {
                var inventories = await _inventoryService.GetInventoriesByProductIdAsync(productId);
                return Ok(inventories);
            }
            catch (InventoryNotFoundException ex)
            {
                _logger.LogWarning(ex, "No inventory found for ProductId {ProductId}.", productId);
                return NotFound(ex.Message);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while retrieving inventories by ProductId {ProductId}.", productId);
                return StatusCode(500, "Internal server error. Please try again later.");
            }
        }

        [HttpGet("byProductName/{productName}")]
        public async Task<IActionResult> GetInventoriesByProductName(string productName)
        {
            try
            {
                var inventories = await _inventoryService.GetInventoriesByProductNameAsync(productName);
                return Ok(inventories);
            }
            catch (InventoryNotFoundException ex)
            {
                _logger.LogWarning(ex, "No inventory found for ProductName '{ProductName}'.", productName);
                return NotFound(ex.Message);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while retrieving inventories for ProductName '{ProductName}'.", productName);
                return StatusCode(500, "Internal server error. Please try again later.");
            }
        }
    }
}
