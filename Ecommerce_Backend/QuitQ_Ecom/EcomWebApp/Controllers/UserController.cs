using EcomLib.Dtos;
using EcomLib.Dtos.UserDtos;
using EcomLib.Exceptionhandling;
using EcomLib.Service;
using log4net;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace EcomWebApp.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class UserController : ControllerBase
    {
        private readonly UserService _userService;
        private readonly EmailService _emailService;
        private static readonly ILog log = LogManager.GetLogger(typeof(UserController));

        public UserController(UserService userService, EmailService emailService)
        {
            _userService = userService;
            _emailService = emailService;
        }

        [HttpGet("GetUserById/{id}")]
        public async Task<IActionResult> GetUserById(int id)
        {
            try
            {
                var user = await _userService.GetUserByIdAsync(id);
                if (user == null)
                {
                    log.Warn($"User with ID {id} not found.");
                    return NotFound(new { message = "User not found." });
                }
                log.Info($"Successfully retrieved user with ID {id}.");
                return Ok(user);
            }
            catch (Exception ex)
            {
                log.Error($"Error occurred while fetching user with ID {id}: {ex.Message}", ex);
                return StatusCode(500, new { message = "Internal server error." });
            }
        }

        [HttpGet("GetUserByUsername/{username}")]
        public async Task<IActionResult> GetUserByUsername(string username)
        {
            try
            {
                var user = await _userService.GetUserByUsernameAsync(username);
                if (user == null)
                {
                    log.Warn($"User with username {username} not found.");
                    return NotFound(new { message = "User not found." });
                }
                log.Info($"Successfully retrieved user with username {username}.");
                return Ok(user);
            }
            catch (Exception ex)
            {
                log.Error($"Error occurred while fetching user with username {username}: {ex.Message}", ex);
                return StatusCode(500, new { message = "Internal server error." });
            }
        }

        [HttpGet("GetUserByEmail/{email}")]
        public async Task<IActionResult> GetUserByEmail(string email)
        {
            try
            {
                var user = await _userService.GetUserByEmailAsync(email);
                if (user == null)
                {
                    log.Warn($"User with email {email} not found.");
                    return NotFound(new { message = "User not found." });
                }
                log.Info($"Successfully retrieved user with email {email}.");
                return Ok(user);
            }
            catch (Exception ex)
            {
                log.Error($"Error occurred while fetching user with email {email}: {ex.Message}", ex);
                return StatusCode(500, new { message = "Internal server error." });
            }
        }

        [HttpPost("RegisterUser")]
        public async Task<IActionResult> RegisterUser([FromBody] RegisterUserDTO userDto)
        {
            try
            {
                if (!ModelState.IsValid)
                {
                    log.Warn($"Invalid user data for registration.");
                    return BadRequest(ModelState);
                }

                var newUserId = await _userService.RegisterUserAsync(userDto);
                log.Info($"Successfully registered user with email {userDto.Email}.");

                //Send email to registerd user
                var emailSubject = "Welcome to QuitQ!";
                var emailBody = $"Hi {userDto.Username},<br/>Thank you for registering with QuitQ. We are excited to have you on board! <br/>Use the Email and password to login  QuitQ.com";
                await _emailService.SendEmailAsync(userDto.Email, emailSubject, emailBody);
                return Ok(new { message = $"User registered successfully with ID: {newUserId}" });
            }
            catch (Exception ex)
            {
                log.Error($"Error occurred while registering user with email {userDto.Email}: {ex.Message}", ex);
                return StatusCode(500, new { message = "Internal server error." });
            }
        }

        [HttpPost("RegisterSeller")]
        public async Task<IActionResult> RegisterSeller([FromBody] RegisterSellerDTO sellerDto)
        {
            try
            {
                if (!ModelState.IsValid)
                {
                    log.Warn($"Invalid user data for registration.");
                    return BadRequest(ModelState);
                }

                var newSellerId = await _userService.RegisterSellerAsync(sellerDto);
                
                log.Info($"Successfully registered Seller with email {sellerDto.Email}.");

                //Send email to registerd user
                var emailSubject = "Welcome to QuitQ!";
                var emailBody = $"Hi {sellerDto.Username},<br/>Thank you for registering as a seller with QuitQ. We look forward to a successful partnership! <br/>Use the Email and password to login  QuitQ.com";
                await _emailService.SendEmailAsync(sellerDto.Email, emailSubject, emailBody);
                return Ok(new { message = $"User registered successfully with ID: {newSellerId}" });
            }
            catch (Exception ex)
            {
                log.Error($"Error occurred while registering user with email {sellerDto.Email}: {ex.Message}", ex);
                return StatusCode(500, new { message = "Internal server error." });
            }
        }
        [Authorize(Roles = "Admin")]
        [HttpPut("UpdateUser/{id}")]
        public async Task<IActionResult> UpdateUser([FromBody] UserDTO userDto, int id)
        {
            try
            {
                if (!ModelState.IsValid)
                {
                    log.Warn($"Invalid user data for update.");
                    return BadRequest(ModelState);
                }

                await _userService.UpdateUserAsync(userDto, id);
                log.Info($"Successfully updated user with ID {id}.");
                return Ok(new { message = "User updated successfully." });
            }
            catch (KeyNotFoundException ex)
            {
                log.Warn(ex.Message);
                return NotFound(new { message = ex.Message });
            }
            catch (Exception ex)
            {
                log.Error($"Error occurred while updating user with ID {id}: {ex.Message}", ex);
                return StatusCode(500, new { message = "Internal server error." });
            }
        }
        [Authorize(Roles = "Admin")]
        [HttpDelete("DeleteUser/{id}")]
        public async Task<IActionResult> DeleteUser(int id)
        {
            try
            {
                await _userService.DeleteUserAsync(id);
                log.Info($"Successfully deleted user with ID {id}.");
                return Ok(new { message = "User deleted successfully." });
            }
            catch (Exception ex)
            {
                log.Error($"Error occurred while deleting user with ID {id}: {ex.Message}", ex);
                return StatusCode(500, new { message = "Internal server error." });
            }
        }

        [HttpPost("AddAdress-user")]
        public async Task<IActionResult> AddAddress([FromBody] AddAddressDTO addressDto)
        {
            try
            {
                log.Info($"Adding new address for user ID: {addressDto.UserId}");
                _userService.AddAddress(addressDto);
                log.Info($"Successfully added new address for user ID: {addressDto.UserId}");

                return Ok(new {message = "New Address Added"});
            }
            catch (Exception ex)
            {
                log.Error($"Error adding address for user ID: {addressDto.UserId}", ex);
                return StatusCode(500, "An error occurred while adding the address.");
            }
        }
        // PUT: api/useraddress/{id}
        [HttpPut("UpdateAdress-user/{id}")]
        public async Task<IActionResult> UpdateAddress(int id, [FromBody] UpdateAddressDTO addressDto)
        {
            if (id != addressDto.AddressId)
            {
                log.Warn($"Address ID mismatch. Path ID: {id}, DTO ID: {addressDto.AddressId}");
                return BadRequest("Address ID mismatch.");
            }

            try
            {
                log.Info($"Updating address with ID: {id}");
                _userService.UpdateAddress(addressDto);
                log.Info($"Address with ID: {id} updated successfully");

                return Ok(new {message= "Address updated successfully." });
            }
            catch (UserNotFoundException ex)
            {
                log.Warn($"UserNotFoundException: {ex.Message}");
                return NotFound(ex.Message);
            }
            catch (Exception ex)
            {
                log.Error($"Error while updating address with ID: {id}", ex);
                return StatusCode(500, "An error occurred while updating the address.");
            }
        }

        // PUT: api/user/update-seller-details
        [HttpPut("update-seller-details")]
        public async Task<IActionResult> UpdateSellerDetailsAsync(int userId, SellerDetailsDTO sellerDetailsDto)
        {
            try
            {
                log.Info($"Updating seller details for user ID: {userId}");
                await _userService.UpdateSellerDetailsAsync(userId, sellerDetailsDto);
                log.Info($"Seller details updated successfully for user ID: {userId}");
                return Ok("Seller details updated successfully.");
            }
            catch (UserNotFoundException ex)
            {
                log.Warn($"UserNotFoundException: User with ID {userId} not found.");
                return NotFound(ex.Message);
            }
            catch (Exception ex)
            {
                log.Error($"Error while updating seller details for user ID: {userId}", ex);
                return StatusCode(500, "An error occurred while updating seller details.");
            }
        }
        [Authorize(Roles = "Admin")]
        // GET: api/user/get-all-users
        [HttpGet("get-all-users")]
        public async Task<IActionResult> GetAllUsersAsync()
        {
            try
            {
                log.Info("Fetching all users.");
                var users = await _userService.GetAllUsersAsync();
                log.Info("Users fetched successfully.");
                return Ok(users);
            }
            catch (Exception ex)
            {
                log.Error("Error while fetching users.", ex);
                return StatusCode(500, "An error occurred while fetching users.");
            }
        }

        [Authorize(Roles = "User,Admin")]
        // GET: api/userAddress/{userId}
        [HttpGet("userAddress/{userId}")]
        public IActionResult GetAddressesByUserId(int userId)
        {
            try
            {
                log.Info($"Fetching address for user with Id {userId}");
                var addresses = _userService.GetAddressesByUserId(userId);

                if (!addresses.Any())
                {
                    log.Warn($"No addresses found for the given user with Id {userId}");
                    return NotFound("No addresses found for the given user.");
                }

                return Ok(addresses);
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Erroe fetching Address for user with Id:{userId}");
            }
        }

        [Authorize(Roles = "Seller,Admin")]
        // GET api/Seller/user/{userId}
        [HttpGet("sellerDetails/{userId}")]
        public async Task<IActionResult> GetSellerByUserId(int userId)
        {
            try
            {
                var seller = await _userService.GetSellerByUserIdAsync(userId);
                if (seller == null)
                {
                    log.Info($"No seller found for userId: {userId}");
                    return NotFound($"No seller found for userId: {userId}");
                }
                return Ok(seller);
            }
            catch (Exception ex)
            {
                log.Error($"Error fetching seller for userId: {userId}. Exception: {ex.Message}");
                return StatusCode(500, "Internal server error.");
            }
        }

        [Authorize(Roles = "Seller,Admin,User")]
        // GET: api/userprofile/{userId}
        [HttpGet("{userId}")]
        public async Task<IActionResult> GetUserProfile(int userId)
        {
            try
            {
                var userProfile = await _userService.GetUserProfileAsync(userId);
                if (userProfile == null)
                {
                    return NotFound();
                }
                return Ok(userProfile);
            }
            catch (Exception ex)
            {
                log.Error("Error retrieving user profile", ex);
                return StatusCode(500, "Internal server error");
            }
        }

        [Authorize(Roles = "Seller,Admin,User")]
        // PUT: api/userprofile
        [HttpPut]
        public async Task<IActionResult> UpdateUserProfile([FromBody] UserProfileDto userProfileDto)
        {
            try
            {
                if (userProfileDto == null || userProfileDto.UserId <= 0)
                {
                    return BadRequest("Invalid user data");
                }

                await _userService.UpdateUserProfileAsync(userProfileDto);
                return NoContent();
            }
            catch (Exception ex)
            {
                log.Error("Error updating user profile", ex);
                return StatusCode(500, "Internal server error");
            }
        }
    }
}
