using EcomLib.Service;
using log4net;
using Microsoft.AspNetCore.Mvc;

namespace EcomWebApp.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AuthController : ControllerBase
    {
        // log4net static logger
        private static readonly ILog log = LogManager.GetLogger(typeof(AuthController));

        private readonly AuthService _authService;

        public AuthController(AuthService authService)
        {
            _authService = authService;
        }

        // POST api/auth/login
        [HttpPost("login")]
        public async Task<IActionResult> Login([FromBody] LoginRequestDto loginRequest)
        {
            if (!ModelState.IsValid)
            {
                log.Warn("Invalid model state for login request.");
                return BadRequest(ModelState);
            }

            try
            {
                log.Info($"Login attempt for user: {loginRequest.UsernameOrEmail}");

                // Attempt to login and generate JWT token
                var token = await _authService.LoginAndGenerateTokenAsync(loginRequest.UsernameOrEmail, loginRequest.Password);

                log.Info($"Token generated successfully for user: {loginRequest.UsernameOrEmail}");

                // Return token in response
                return Ok(new { Token = token });
            }
            catch (UnauthorizedAccessException ex)
            {
                log.Error($"Unauthorized login attempt: {ex.Message}");
                return Unauthorized(new { Message = ex.Message });
            }
            catch (Exception ex)
            {
                log.Error($"An error occurred during login: {ex.Message}");
                return StatusCode(500, "Internal server error");
            }
        }
    }

    // DTO for login request
    public class LoginRequestDto
    {
        public string UsernameOrEmail { get; set; }
        public string Password { get; set; }
    }
}
