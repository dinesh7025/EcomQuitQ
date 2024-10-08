using EcomLib.Service;
using log4net;
using Microsoft.AspNetCore.Mvc;

namespace EcomWebApp.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class AnalyticsController : ControllerBase
    {
        private readonly UserAnalyticsService _analyticsService;
        private readonly ILog _logger;

        public AnalyticsController(UserAnalyticsService analyticsService)
        {
            _analyticsService = analyticsService;
            _logger = LogManager.GetLogger(typeof(AnalyticsController));
        }

        [HttpGet("total-user-registrations")]
        public IActionResult GetTotalUserRegistrations()
        {
            try
            {
                var totalUsers = _analyticsService.GetTotalUserRegistrations();
                _logger.Info("Fetched total user registrations successfully.");
                return Ok(totalUsers);
            }
            catch (Exception ex)
            {
                _logger.Error("Error fetching total user registrations.", ex);
                return StatusCode(500, ex.Message);
            }
        }

        [HttpGet("total-seller-registrations")]
        public IActionResult GetTotalSellerRegistrations()
        {
            try
            {
                var totalSellers = _analyticsService.GetTotalSellerRegistrations();
                _logger.Info("Fetched total seller registrations successfully.");
                return Ok(totalSellers);
            }
            catch (Exception ex)
            {
                _logger.Error("Error fetching total seller registrations.", ex);
                return StatusCode(500, ex.Message);
            }
        }

        [HttpGet("top-active-users")]
        public IActionResult GetTopActiveUsers([FromQuery] int topN)
        {
            try
            {
                var topActiveUsers = _analyticsService.GetTopActiveUsers(topN);
                _logger.Info($"Fetched top {topN} active users successfully.");
                return Ok(topActiveUsers);
            }
            catch (Exception ex)
            {
                _logger.Error($"Error fetching top {topN} active users.", ex);
                return StatusCode(500, ex.Message);
            }
        }

        [HttpGet("user-activity-log")]
        public IActionResult GetUserActivityLog()
        {
            try
            {
                var activityLog = _analyticsService.GetUserActivityLog();
                _logger.Info($"Fetched activity log for users successfully.");
                return Ok(activityLog);
            }
            catch (Exception ex)
            {
                _logger.Error($"Error fetching activity log for user.", ex);
                return StatusCode(500, ex.Message);
            }
        }
    }

}
