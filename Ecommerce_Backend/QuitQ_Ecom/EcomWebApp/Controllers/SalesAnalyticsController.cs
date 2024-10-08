using EcomLib.Service;
using log4net;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;


namespace EcomWebApp.Controllers
{

    [ApiController]
    [Route("api/[controller]")]
    public class SalesAnalyticsController : ControllerBase
    {
        private readonly SalesAnalyticsService _salesAnalyticsService;
        private readonly OrderService _orderService;
        private static readonly ILog _logger = LogManager.GetLogger(typeof(SalesAnalyticsController));

        public SalesAnalyticsController(SalesAnalyticsService salesAnalyticsService, OrderService orderService)
        {
            _salesAnalyticsService = salesAnalyticsService;
            _orderService = orderService;
        }

        [Authorize(Roles = "Admin")]
        [HttpGet("SalesByCategory")]
        public IActionResult GetSalesByCategory()
        {
            try
            {
                var result = _salesAnalyticsService.GetSalesByCategory();
                return Ok(result);
            }
            catch (Exception ex)
            {
                _logger.Error("Error occurred in GetSalesByCategory.", ex);
                return StatusCode(500, "Internal server error.");
            }
        }
        [Authorize(Roles = "Admin")]
        [HttpGet("SalesByProduct")]
        public IActionResult GetSalesByProduct()
        {
            try
            {
                var result = _salesAnalyticsService.GetSalesByProduct();
                return Ok(result);
            }
            catch (Exception ex)
            {
                _logger.Error("Error occurred in GetSalesByProduct.", ex);
                return StatusCode(500, "Internal server error.");
            }
        }
        [Authorize(Roles = "Admin")]
        [HttpGet("SalesBySeller")]
        public IActionResult GetSalesBySeller()
        {
            try
            {
                var result = _salesAnalyticsService.GetSalesBySeller();
                return Ok(result);
            }
            catch (Exception ex)
            {
                _logger.Error("Error occurred in GetSalesBySeller.", ex);
                return StatusCode(500, "Internal server error.");
            }
        }

        [Authorize(Roles = "Admin")]
        [HttpGet("DailySales")]
        public IActionResult GetDailySales()
        {
            try
            {
                var result = _salesAnalyticsService.GetDailySales();
                return Ok(result);
            }
            catch (Exception ex)
            {
                _logger.Error("Error occurred in GetDailySales.", ex);
                return StatusCode(500, "Internal server error.");
            }
        }

        [Authorize(Roles = "Admin")]
        [HttpGet("TopSellingProducts")]
        public IActionResult GetTopSellingProducts()
        {
            try
            {
                var result = _salesAnalyticsService.GetTopSellingProducts();
                return Ok(result);
            }
            catch (Exception ex)
            {
                _logger.Error("Error occurred in GetTopSellingProducts.", ex);
                return StatusCode(500, "Internal server error.");
            }
        }

        [Authorize(Roles = "Admin")]
        // GET: api/revenue/total
        [HttpGet("totalRevenue")]
        public async Task<IActionResult> GetTotalRevenue()
        {
            try
            {
                var totalRevenue = await _orderService.GetTotalRevenueAsync();
                return Ok(new { TotalRevenue = totalRevenue });
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal server error: {ex.Message}");
            }
        }

        [Authorize(Roles = "Seller,Admin")]
        // GET: api/revenue/seller/{sellerId}
        [HttpGet("sellerRevenue/{sellerId}")]
        public async Task<IActionResult> GetTotalRevenueBySeller(int sellerId)
        {
            try
            {
                var totalRevenueBySeller = await _orderService.GetTotalRevenueBySellerAsync(sellerId);
                return Ok(new { SellerId = sellerId, TotalRevenue = totalRevenueBySeller });
            }
            catch (Exception ex)
            {
                // Handle exceptions and log them
                return StatusCode(500, $"Internal server error: {ex.Message}");
            }
        }

        [Authorize(Roles = "Seller,Admin")]
        [HttpGet("sales-by-product/{sellerId}")]
        public async Task<IActionResult> GetSalesByProduct(int sellerId)
        {
            try
            {
                _logger.Info($"Fetching sales by product for sellerId: {sellerId}");
                var salesByProduct = await _salesAnalyticsService.GetSalesByProductAsync(sellerId);

                if (salesByProduct == null || !salesByProduct.Any())
                {
                    _logger.Warn($"No sales data found for sellerId: {sellerId}");
                    return NotFound($"No sales data found for seller with ID {sellerId}.");
                }

                return Ok(salesByProduct);
            }
            catch (Exception ex)
            {
                _logger.Error($"An error occurred while fetching sales by product for sellerId: {sellerId}", ex);
                return StatusCode(StatusCodes.Status500InternalServerError, "An error occurred while processing your request.");
            }
        }

        [Authorize(Roles = "Seller,Admin")]
        [HttpGet("sales-by-month/{sellerId}")]
        public async Task<IActionResult> GetSalesByMonth(int sellerId)
        {
            try
            {
                _logger.Info($"Fetching sales by month for sellerId: {sellerId}");
                var salesByMonth = await _salesAnalyticsService.GetSalesByMonthAsync(sellerId);

                if (salesByMonth == null || !salesByMonth.Any())
                {
                    _logger.Warn($"No monthly sales data found for sellerId: {sellerId}");
                    return NotFound($"No sales data found for seller with ID {sellerId}.");
                }

                return Ok(salesByMonth);
            }
            catch (Exception ex)
            {
                _logger.Error($"An error occurred while fetching sales by month for sellerId: {sellerId}", ex);
                return StatusCode(StatusCodes.Status500InternalServerError, "An error occurred while processing your request.");
            }
        }

        [Authorize(Roles = "Seller,Admin")]
        [HttpGet("top-selling-product/{sellerId}")]
        public async Task<IActionResult> GetTopSellingProductBySeller(int sellerId)
        {
            try
            {
                _logger.Info($"Fetching top-selling product for sellerId: {sellerId}");
                var topProduct = await _salesAnalyticsService.GetTopSellingProductBySellerAsync(sellerId);

                if (topProduct == null)
                {
                    _logger.Warn($"No top-selling product found for sellerId: {sellerId}");
                    return NotFound($"No top-selling product found for seller with ID {sellerId}.");
                }

                return Ok(topProduct);
            }
            catch (Exception ex)
            {
                _logger.Error($"An error occurred while fetching the top-selling product for sellerId: {sellerId}", ex);
                return StatusCode(StatusCodes.Status500InternalServerError, "An error occurred while processing your request.");
            }
        }
    }
}
