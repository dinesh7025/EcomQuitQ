using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Ecomlib.Models.UserManagemnt;
using System.Linq;
using EcomLib.Dtos.UserDtos;
using EcomLib.Dtos;
using EcomLib.Exceptionhandling;
using EcomLib.Repository.UserRepository;

namespace EcomLib.Service
{
    public class UserService
    {
        private readonly IUserRepository _userRepository;

        public UserService(IUserRepository userRepository)
        {
            _userRepository = userRepository;
        }

        // Register a new user
        public async Task<int> RegisterUserAsync(RegisterUserDTO registerUserDto)
        {
            if (await _userRepository.GetUserByEmailAsync(registerUserDto.Email) != null)
            {
                throw new InvalidInputException("A user with this email already exists.");
            }

            var user = new User
            {
                Username = registerUserDto.Username,
                PasswordHash = HashPassword(registerUserDto.Password),
                Email = registerUserDto.Email,
                Role = UserRole.User,
                IsActive = true,
                DateCreated = DateTime.Now,
                PersonalDetails = new PersonalDetails
                {
                    FirstName = registerUserDto.PersonalDetails.FirstName,
                    LastName = registerUserDto.PersonalDetails.LastName,
                    Gender = registerUserDto.PersonalDetails.Gender,
                    DateOfBirth = registerUserDto.PersonalDetails.DateOfBirth,
                    PhoneNumber = registerUserDto.PersonalDetails.PhoneNumber
                },
                Address = new Address
                {
                    AddressLine1 = registerUserDto.Address.AddressLine1,
                    AddressLine2 = registerUserDto.Address.AddressLine2,
                    City = registerUserDto.Address.City,
                    State = registerUserDto.Address.State,
                    PostalCode = registerUserDto.Address.PostalCode,
                    Country = registerUserDto.Address.Country
                }
            };

            var newUserId = await _userRepository.AddUserAsync(user);
            await _userRepository.LogUserAction(newUserId, "Register", "Users", newUserId, "New user registration");
            return newUserId;
        }

        // Register a new seller
        public async Task<int> RegisterSellerAsync(RegisterSellerDTO registerSellerDto)
        {
            if (await _userRepository.GetUserByEmailAsync(registerSellerDto.Email) != null)
            {
                throw new InvalidInputException("A seller with this email already exists.");
            }

            var user = new User
            {
                Username = registerSellerDto.Username,
                PasswordHash = HashPassword(registerSellerDto.Password),
                Email = registerSellerDto.Email,
                Role = UserRole.Seller,
                IsActive = true,
                DateCreated = DateTime.Now,
                PersonalDetails = new PersonalDetails
                {
                    FirstName = registerSellerDto.PersonalDetails.FirstName,
                    LastName = registerSellerDto.PersonalDetails.LastName,
                    Gender = registerSellerDto.PersonalDetails.Gender,
                    DateOfBirth = registerSellerDto.PersonalDetails.DateOfBirth,
                    PhoneNumber = registerSellerDto.PersonalDetails.PhoneNumber
                },
                Address = new Address
                {
                    AddressLine1 = registerSellerDto.Address.AddressLine1,
                    AddressLine2 = registerSellerDto.Address.AddressLine2,
                    City = registerSellerDto.Address.City,
                    State = registerSellerDto.Address.State,
                    PostalCode = registerSellerDto.Address.PostalCode,
                    Country = registerSellerDto.Address.Country
                },
                SellerDetails = new SellerDetails
                {
                    CompanyName = registerSellerDto.SellerDetails.CompanyName,
                    CompanyRegistrationNumber = registerSellerDto.SellerDetails.CompanyRegistrationNumber,
                    GSTNumber = registerSellerDto.SellerDetails.GSTNumber,
                    BusinessType = registerSellerDto.SellerDetails.BusinessType
                }
            };

            var newSellerId= await _userRepository.AddUserAsync(user);
            await _userRepository.LogUserAction(newSellerId, "Register", "Users", newSellerId, "New Seller registration");
            return newSellerId;
        }
        public async Task UpdateUserAsync(UserDTO userDto, int userId)
        {
            var user = await _userRepository.GetUserByIdAsync(userId);
            if (user == null)
            {
                throw new UserNotFoundException($"User with Id {userId}Not Found in the records");
            }
            await _userRepository.UpdateUserAsync(userDto, userId);
        }

        // Update personal details
        public async Task UpdateAddressAsync(int userId, AddressDTO addressDto)
        {
            var user = await _userRepository.GetUserById(userId);
            if (user == null)
            {
                throw new UserNotFoundException($"User with Id {userId}Not Found in the records");
            }

            user.Address.AddressLine1 = addressDto.AddressLine1;
            user.Address.AddressLine2 = addressDto.AddressLine2;
            user.Address.City = addressDto.City;
            user.Address.State = addressDto.State;
            user.Address.PostalCode = addressDto.PostalCode;
            user.Address.Country = addressDto.Country;

            await _userRepository.UpdateUserAsync(user);
        }



        // Update seller details
        public async Task UpdateSellerDetailsAsync(int userId, SellerDetailsDTO sellerDetailsDto)
        {
            var user = await _userRepository.GetUserById(userId);
            if (user == null)
            {
                throw new UserNotFoundException($"User with Id {userId}Not Found in the records");
            }

            user.SellerDetails = new SellerDetails
            {
                CompanyName = sellerDetailsDto.CompanyName,
                CompanyRegistrationNumber = sellerDetailsDto.CompanyRegistrationNumber,
                GSTNumber = sellerDetailsDto.GSTNumber,
                BusinessType = sellerDetailsDto.BusinessType
            };

            await _userRepository.UpdateSellerDetailsAsync(user);
        }

        // Get all users
        public async Task<IEnumerable<GetUserDTO>> GetAllUsersAsync()
        {
            return await _userRepository.GetAllUsersAsync();
        }

        // Get user by ID
        public async Task<GetUserDTO> GetUserByIdAsync(int userId)
        {
            var user = await _userRepository.GetUserByIdAsync(userId);
            if (user == null)
            {
                throw new UserNotFoundException($"User with Id {userId}Not Found in the records");
            }
            return user;
        }

        // Get user by username
        public async Task<GetUserDTO> GetUserByUsernameAsync(string username)
        {
            var user = await _userRepository.GetUserByUsernameAsync(username);
            if (user == null)
            {
                throw new UserNotFoundException($"User with username {username} was not found.");
            }
            return user;
        }

        // Get user by email
        public async Task<GetUserDTO> GetUserByEmailAsync(string email)
        {
            var user = await _userRepository.GetUserByEmailAsync(email);
            if (user == null)
            {
                throw new UserNotFoundException($"User with email {email} was not found.");
            }
            return user;
        }

        public async Task DeleteUserAsync(int userId)
        {
            var user = await _userRepository.GetUserByIdAsync(userId);
            if (user == null)
            {
                throw new UserNotFoundException($"User with Id {userId}Not Found in the records");
            }
            await _userRepository.DeleteUserAsync(userId);
        }

        public async Task<IEnumerable<LastRegisteredDTO>> GetUsersLast24HoursAsync()
        {
            return await _userRepository.GetUsersLast24HoursAsync();
        }

        public async Task<IEnumerable<LastRegisteredDTO>> GetUsersLast7DaysAsync()
        {
            return await _userRepository.GetUsersLast7DaysAsync();
        }

        public async Task<IEnumerable<LastRegisteredDTO>> GetUsersLastMonthAsync()
        {
            return await _userRepository.GetUsersLastMonthAsync();
        }
        public async Task<IEnumerable<LastRegisteredSellerDTO>> GetSellersLast24HoursAsync()
        {
            return await _userRepository.GetSellersLast24HoursAsync();
        }
        public async Task<IEnumerable<LastRegisteredSellerDTO>> GetSellersLast7DaysAsync()
        {
            return await _userRepository.GetSellersLast7DaysAsync();
        }
        public async Task<IEnumerable<LastRegisteredSellerDTO>> GetSellersLastMonthAsync()
        {
            return await _userRepository.GetSellersLastMonthAsync();
        }

        public IEnumerable<GetAddressDTO> GetAddressesByUserId(int userId)
        {
            var addresses = _userRepository.GetAddressesByUserId(userId);

            // Mapping Address to AddressDTO
            return addresses.Select(a => new GetAddressDTO
            {
                AddressId = a.AddressId,
                AddressLine1 = a.AddressLine1,
                AddressLine2 = a.AddressLine2,
                City = a.City,
                State = a.State,
                PostalCode = a.PostalCode,
                Country = a.Country
            }).ToList();
        }

        // Helper method for password hashing
        private string HashPassword(string password)
        {

            return BCrypt.Net.BCrypt.HashPassword(password);
        }
        // Call repository method to fetch seller details using UserId
        public async Task<SellerDTO> GetSellerByUserIdAsync(int userId)
        {
            return await _userRepository.GetSellerByUserIdAsync(userId);
        }

        public async Task<UserProfileDto> GetUserProfileAsync(int userId)
        {
            return await _userRepository.GetUserProfileByIdAsync(userId);
        }

        public async Task UpdateUserProfileAsync(UserProfileDto userProfileDto)
        {
            await _userRepository.UpdateUserProfileAsync(userProfileDto);
        }
    }
}
