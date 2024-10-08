using EcomLib.Exceptionhandling;
using EcomLib.Service;
using log4net;
using Microsoft.AspNetCore.Mvc;

[ApiController]
[Route("api/[controller]")]
public class AdminController : ControllerBase
{
    private readonly UserService _userService;
    private static readonly ILog log = LogManager.GetLogger(typeof(AdminController));

    public AdminController(UserService userService)
    {
        _userService = userService;
    }

    [HttpGet("user-last-24-hours")]
    public async Task<IActionResult> GetUsersLast24Hours()
    {
        try
        {
            var users = await _userService.GetUsersLast24HoursAsync();
            return Ok(users);
        }
        catch (UserNotFoundException ex)
        {
            log.Error("UserNotFoundException: No users found in the last 24 hours.", ex);
            return NotFound(ex.Message);
        }
        catch (Exception ex)
        {
            log.Error("Error occurred while retrieving users from the last 24 hours.", ex);
            return StatusCode(500, "An error occurred while processing your request.");
        }
    }

    [HttpGet("user-last-7-days")]
    public async Task<IActionResult> GetUsersLast7Days()
    {
        try
        {
            var users = await _userService.GetUsersLast7DaysAsync();
            return Ok(users);
        }
        catch (UserNotFoundException ex)
        {
            log.Error("UserNotFoundException: No users found in the last 7 days.", ex);
            return NotFound(ex.Message);
        }
        catch (Exception ex)
        {
            log.Error("Error occurred while retrieving users from the last 7 days.", ex);
            return StatusCode(500, "An error occurred while processing your request.");
        }
    }

    [HttpGet("user-last-month")]
    public async Task<IActionResult> GetUsersLastMonth()
    {
        try
        {
            var users = await _userService.GetUsersLastMonthAsync();
            return Ok(users);
        }
        catch (UserNotFoundException ex)
        {
            log.Error("UserNotFoundException: No users found in the last month.", ex);
            return NotFound(ex.Message);
        }
        catch (Exception ex)
        {
            log.Error("Error occurred while retrieving users from the last month.", ex);
            return StatusCode(500, "An error occurred while processing your request.");
        }
    }
    [HttpGet("sellers-last-24-hours")]
    public async Task<IActionResult> GetSellersLast24Hours()
    {
        try
        {
            var users = await _userService.GetSellersLast24HoursAsync();
            return Ok(users);
        }
        catch (UserNotFoundException ex)
        {
            log.Warn("UserNotFoundException: " + ex.Message);
            return NotFound(ex.Message);
        }
        catch (DataAccessException ex)
        {
            log.Error("DataAccessException: " + ex.Message);
            return StatusCode(500, "An error occurred while processing your request.");
        }
        catch (Exception ex)
        {
            log.Error("Exception: " + ex.Message);
            return StatusCode(500, "An unexpected error occurred.");
        }
    }

    [HttpGet("sellers-last-7-days")]
    public async Task<IActionResult> GetSellersLast7Days()
    {
        try
        {
            var users = await _userService.GetSellersLast7DaysAsync();
            return Ok(users);
        }
        catch (UserNotFoundException ex)
        {
            log.Warn("UserNotFoundException: " + ex.Message);
            return NotFound(ex.Message);
        }
        catch (DataAccessException ex)
        {
            log.Error("DataAccessException: " + ex.Message);
            return StatusCode(500, "An error occurred while processing your request.");
        }
        catch (Exception ex)
        {
            log.Error("Exception: " + ex.Message);
            return StatusCode(500, "An unexpected error occurred.");
        }
    }

    [HttpGet("sellers-last-month")]
    public async Task<IActionResult> GetSellerLastMonth()
    {
        try
        {
            var users = await _userService.GetSellersLastMonthAsync();
            return Ok(users);
        }
        catch (UserNotFoundException ex)
        {
            log.Error("UserNotFoundException: " + ex.Message);
            return NotFound(ex.Message);
        }
        catch (DataAccessException ex)
        {
            log.Error("DataAccessException: " + ex.Message);
            return StatusCode(500, "An error occurred while processing your request.");
        }
        catch (Exception ex)
        {
            log.Error("Exception: " + ex.Message);
            return StatusCode(500, "An unexpected error occurred.");
        }
    }
}

