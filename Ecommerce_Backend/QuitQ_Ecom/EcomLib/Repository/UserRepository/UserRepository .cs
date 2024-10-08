using Ecomlib.Models.UserManagemnt;
using EcomLib.Dtos;
using EcomLib.Dtos.UserDtos;
using EcomLib.Exceptionhandling;
using EcomLib.Repository.UserRepository;
using EcomQuitQ.Data;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;

namespace EcomQuitQ.BusinessLogicLayer.UserRepository
{
    public class UserRepository:IUserRepository
    {
        private readonly AppDbContext _context;
        private readonly IConfiguration _configuration;

        public UserRepository(AppDbContext context,IConfiguration configuration)
        {
            _context = context;
            _configuration = configuration;
        }

        public async Task<User> GetUserById(int userId)
        {
            return await _context.Users.FindAsync(userId);
        }

        public async Task<GetUserDTO> GetUserByIdAsync(int userId)
        {
            return await _context.Users
                .Where(u => u.UserId == userId)
                .Select(u => new GetUserDTO
                {
                    UserId = u.UserId,
                    UserName = u.Username,
                    Email = u.Email,
                    Role = u.Role.ToString(),
                    DateCreated = u.DateCreated,
                    IsActive = u.IsActive,
                    FullName = $"{u.PersonalDetails.FirstName ?? "N/A"} {u.PersonalDetails.LastName ?? "N/A"}",  
                    Gender = u.PersonalDetails.Gender ?? "Unknown",  
                    DateOfBirth = u.PersonalDetails.DateOfBirth, 
                    PhoneNumber = u.PersonalDetails.PhoneNumber ?? "N/A", 
                    Address = $"{u.Address.AddressLine1 ?? "N/A"}, {u.Address.AddressLine2 ?? "N/A"}, {u.Address.City ?? "N/A"}, {u.Address.State ?? "N/A"}, Pin - {u.Address.PostalCode ?? "N/A"}, {u.Address.Country ?? "N/A"}" // Combine all address fields
                })
                .FirstOrDefaultAsync();
        }

        public async Task<IEnumerable<GetUserDTO>> GetAllUsersAsync()
        {
            return await _context.Users
            .Select(u => new GetUserDTO
            {
                UserId = u.UserId,
                UserName = u.Username,
                Email = u.Email,
                Role = u.Role.ToString(),
                DateCreated = u.DateCreated,
                IsActive = u.IsActive,
                FullName = $"{u.PersonalDetails.FirstName ?? "N/A"} {u.PersonalDetails.LastName ?? "N/A"}",  // Handle nulls
                Gender = u.PersonalDetails.Gender ?? "Unknown",  // Handle null
                DateOfBirth = u.PersonalDetails.DateOfBirth,  // Nullable as is
                PhoneNumber = u.PersonalDetails.PhoneNumber ?? "N/A",  // Handle null
                Address = $"{u.Address.AddressLine1 ?? "N/A"}, {u.Address.AddressLine2 ?? "N/A"}, {u.Address.City ?? "N/A"}, {u.Address.State ?? "N/A"}, Pin - {u.Address.PostalCode ?? "N/A"}, {u.Address.Country ?? "N/A"}" // Combine all address fields
            })
            .ToListAsync();
        }
        public async Task<GetUserDTO> GetUserByUsernameAsync(string username)
        {
            return await _context.Users.Where(u => u.Username == username)
                .Select(u => new GetUserDTO
                {
                    UserId = u.UserId,
                    UserName = u.Username,
                    Email = u.Email,
                    Role = u.Role.ToString(),
                    DateCreated = u.DateCreated,
                    IsActive = u.IsActive,
                    FullName = $"{u.PersonalDetails.FirstName ?? "N/A"} {u.PersonalDetails.LastName ?? "N/A"}",  // Handle nulls
                    Gender = u.PersonalDetails.Gender ?? "Unknown",  // Handle null
                    DateOfBirth = u.PersonalDetails.DateOfBirth,  // Nullable as is
                    PhoneNumber = u.PersonalDetails.PhoneNumber ?? "N/A",  // Handle null
                    Address = $"{u.Address.AddressLine1 ?? "N/A"}, {u.Address.AddressLine2 ?? "N/A"}, {u.Address.City ?? "N/A"}, {u.Address.State ?? "N/A"}, Pin - {u.Address.PostalCode ?? "N/A"}, {u.Address.Country ?? "N/A"}" // Combine all address fields
                })
                .FirstOrDefaultAsync();
        }

        public async Task<GetUserDTO> GetUserByEmailAsync(string email)
        {
            return await _context.Users
                .Where(u => u.Email == email)  // Filter by email
                .Select(u => new GetUserDTO
                {
                    UserId = u.UserId,
                    UserName = u.Username,
                    Email = u.Email,
                    Role = u.Role.ToString(),
                    DateCreated = u.DateCreated,
                    IsActive = u.IsActive,
                    FullName = $"{u.PersonalDetails.FirstName ?? "N/A"} {u.PersonalDetails.LastName ?? "N/A"}",  // Handle nulls
                    Gender = u.PersonalDetails.Gender ?? "Unknown",  // Handle null
                    DateOfBirth = u.PersonalDetails.DateOfBirth,  // Nullable as is
                    PhoneNumber = u.PersonalDetails.PhoneNumber ?? "N/A",  // Handle null
                    Address = $"{u.Address.AddressLine1 ?? "N/A"}, {u.Address.AddressLine2 ?? "N/A"}, {u.Address.City ?? "N/A"}, {u.Address.State ?? "N/A"}, Pin - {u.Address.PostalCode ?? "N/A"}, {u.Address.Country ?? "N/A"}"  // Combine all address fields
                })
                .FirstOrDefaultAsync();
        }

        public async Task<User> GetUserByEmailOrUsernameAsync(string emailOrUsername)
        {
            return await _context.Users
                .SingleOrDefaultAsync(u => u.Email == emailOrUsername || u.Username == emailOrUsername);
        }

        public async Task<int> AddUserAsync(User user)
        {
            await _context.Users.AddAsync(user);
            await _context.SaveChangesAsync();
            return user.UserId;
        }

        public async Task DeleteUserAsync(int userId)
        {
            var user = _context.Users.SingleOrDefault(u => u.UserId== userId);
            if (user != null)
            {
                _context.Users.Remove(user);
                await _context.SaveChangesAsync();
            }
        }

        public async Task<bool> UserExistsAsync(string emailOrUsername)
        {
            return await _context.Users.AnyAsync(u => u.Email == emailOrUsername || u.Username == emailOrUsername);
        }

        public async Task UpdateUserAsync(User user)
        {
            _context.Users.Update(user);
            await _context.SaveChangesAsync();
        }
        public async Task UpdateUserAsync(UserDTO userDto, int userId)
        {
            var user = await _context.Users.FindAsync(userId);
            if (user == null)
            {
                throw new UserNotFoundException("User not found");
            }

            // Update only the fields in UserDTO
            user.Username = userDto.Username;
            user.Email = userDto.Email;
            user.IsActive = userDto.IsActive;

            _context.Users.Update(user);
            await _context.SaveChangesAsync();
        }

        public async Task UpdatePersonalDetailsAsync(PersonalDetails personalDetails)
        {
            _context.PersonalDetails.Update(personalDetails);
            await _context.SaveChangesAsync();
        }


        public async Task<SellerDetails> GetSellerDetailsByUserIdAsync(int userId)
        {
            return await _context.SellerDetails.FirstOrDefaultAsync(s => s.UserId == userId);
        }

        public async Task AddSellerDetailsAsync(SellerDetails sellerDetails)
        {
            await _context.SellerDetails.AddAsync(sellerDetails);
            await _context.SaveChangesAsync();
        }

        public async Task UpdateSellerDetailsAsync(User updatedSellerDetails)
        {
            _context.Users.Update(updatedSellerDetails);
            await _context.SaveChangesAsync();
        }

        public async Task<IEnumerable<LastRegisteredDTO>> GetUsersLast24HoursAsync()
        {
            var usersList = _context.Users
                .FromSqlRaw("EXEC sp_GetUsersLast24Hours")
                .AsEnumerable() 
                .Select(u => new LastRegisteredDTO
                {
                    UserId = u.UserId,
                    UserName = u.Username,
                    Email = u.Email,
                    Role = u.Role.ToString(),
                    DateCreated = u.DateCreated,
                    IsActive = u.IsActive
                })
                .ToList(); 

            if (usersList.Count == 0)
            {
                throw new UserNotFoundException("There are no users registered in the last 24 hours.");
            }

            return usersList;
        }

        public async Task<IEnumerable<LastRegisteredDTO>> GetUsersLast7DaysAsync()
        {
            var usersList = _context.Users
               .FromSqlRaw("EXEC sp_GetUsersLast7Days")
               .AsEnumerable()  
               .Select(u => new LastRegisteredDTO
               {
                   UserId = u.UserId,
                   UserName = u.Username,
                   Email = u.Email,
                   Role = u.Role.ToString(),
                   DateCreated = u.DateCreated,
                   IsActive = u.IsActive
               })
               .ToList(); 

            if (usersList.Count == 0)
            {
                throw new UserNotFoundException("There are no users registered in the last 7 days.");
            }

            return usersList;
        }

        public async Task<IEnumerable<LastRegisteredDTO>> GetUsersLastMonthAsync()
        {
            var usersList = _context.Users
                .FromSqlRaw("EXEC sp_GetUsersLastMonth")
                .AsEnumerable()  
                .Select(u => new LastRegisteredDTO
                {
                    UserId = u.UserId,
                    UserName = u.Username,
                    Email = u.Email,
                    Role = u.Role.ToString(),
                    DateCreated = u.DateCreated,
                    IsActive = u.IsActive
                })
                .ToList();  

            if (usersList.Count == 0)
            {
                throw new UserNotFoundException("There are no users registered in the last month.");
            }

            return usersList;
        }

        public async Task<IEnumerable<LastRegisteredSellerDTO>> GetSellersLast24HoursAsync()
        {
            var usersList = await SellerDetailsFromStoredProcAsync("sp_GetSellersLast24Hours");

            if (!usersList.Any())
                throw new UserNotFoundException("No users registered in the last 24 hours.");

            return usersList;
        }

        public async Task<IEnumerable<LastRegisteredSellerDTO>> GetSellersLast7DaysAsync()
        {
            var usersList = await SellerDetailsFromStoredProcAsync("sp_GetSellersLast7Days");

            if (!usersList.Any())
                throw new UserNotFoundException("No users registered in the last 7 Days.");

            return usersList;
        }

        public async Task<IEnumerable<LastRegisteredSellerDTO>> GetSellersLastMonthAsync()
        {
            var usersList = await SellerDetailsFromStoredProcAsync("sp_GetSellersLastMonth");

            if (!usersList.Any())
                throw new UserNotFoundException("No users registered in the last Month.");

            return usersList;
        }
        private async Task<IEnumerable<LastRegisteredSellerDTO>> SellerDetailsFromStoredProcAsync(string storedProcName)
        {
            var resultList = new List<LastRegisteredSellerDTO>();

            using (var connection = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
            {
                try
                {
                    await connection.OpenAsync();

                    using (var command = new SqlCommand(storedProcName, connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;

                        using (var reader = await command.ExecuteReaderAsync())
                        {
                            while (await reader.ReadAsync())
                            {
                                resultList.Add(new LastRegisteredSellerDTO
                                {
                                    UserId = reader.GetInt32(reader.GetOrdinal("UserId")),
                                    UserName = reader.GetString(reader.GetOrdinal("Username")),
                                    Email = reader.GetString(reader.GetOrdinal("Email")),
                                    Role = reader.GetString(reader.GetOrdinal("Role")),
                                    DateCreated = reader.GetDateTime(reader.GetOrdinal("DateCreated")),
                                    IsActive = reader.GetBoolean(reader.GetOrdinal("IsActive")),
                                    SellerId = reader.IsDBNull(reader.GetOrdinal("SellerId")) ? default : reader.GetInt32(reader.GetOrdinal("SellerId")),
                                    CompanyName = reader.IsDBNull(reader.GetOrdinal("CompanyName")) ? null : reader.GetString(reader.GetOrdinal("CompanyName")),
                                    CompanyRegistrationNumber = reader.IsDBNull(reader.GetOrdinal("CompanyRegistrationNumber")) ? null : reader.GetString(reader.GetOrdinal("CompanyRegistrationNumber")),
                                    GSTNumber = reader.IsDBNull(reader.GetOrdinal("GSTNumber")) ? null : reader.GetString(reader.GetOrdinal("GSTNumber")),
                                    BusinessType = reader.IsDBNull(reader.GetOrdinal("BusinessType")) ? null : reader.GetString(reader.GetOrdinal("BusinessType")),
                                });
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    throw new DataAccessException("An error occurred while executing the stored procedure.");
                }
            }
            return resultList;
        }

        public async Task LogUserAction(int userId, string action, string tableAffected, int recordId, string details)
        {
            var sql = "EXEC sp_LogUserActions @UserId, @Action, @TableAffected, @RecordId, @Details";

            await _context.Database.ExecuteSqlRawAsync(
                sql,
                new SqlParameter("@UserId", userId),
                new SqlParameter("@Action", action),
                new SqlParameter("@TableAffected", tableAffected),
                new SqlParameter("@RecordId", recordId),
                new SqlParameter("@Details", details)
            );
        }

        public IEnumerable<Address> GetAddressesByUserId(int userId)
        {
            return _context.Addresses
                .Where(a => a.UserId == userId)
                .ToList();
        }
        // Fetch seller details using UserId
        public async Task<SellerDTO> GetSellerByUserIdAsync(int userId)
        {
            var seller = await _context.SellerDetails
                .Where(s => s.UserId == userId)
                .Select(s => new SellerDTO
                {
                    SellerId = s.SellerId,
                    UserId = s.UserId,
                    CompanyName = s.CompanyName,
                    CompanyRegistrationNumber = s.CompanyRegistrationNumber,
                    GSTNumber = s.GSTNumber,
                    BusinessType = s.BusinessType
                })
                .FirstOrDefaultAsync();

            return seller;
        }

        public async Task<UserProfileDto> GetUserProfileByIdAsync(int userId)
        {
            var user = await _context.Users
                .Include(u => u.PersonalDetails)
                .Include(u => u.Address)
                .Include(u => u.SellerDetails)
                .FirstOrDefaultAsync(u => u.UserId == userId);

            if (user == null) return null;

            return new UserProfileDto
            {
                UserId = user.UserId,
                Username = user.Username,
                Email = user.Email,
                DateCreated = user.DateCreated,
                PersonalDetails = user.PersonalDetails != null ? new PersonalDetailsDto
                {
                    PersonalDetailsId = user.PersonalDetails.PersonalDetailsId,
                    FirstName = user.PersonalDetails.FirstName,
                    LastName = user.PersonalDetails.LastName,
                    Gender = user.PersonalDetails.Gender,
                    DateOfBirth = user.PersonalDetails.DateOfBirth,
                    PhoneNumber = user.PersonalDetails.PhoneNumber
                }:null,
                Address = user.Address != null ? new AddressDto
                {
                    AddressId = user.Address.AddressId,
                    AddressLine1 = user.Address.AddressLine1,
                    AddressLine2 = user.Address.AddressLine2,
                    City = user.Address.City,
                    State = user.Address.State,
                    PostalCode = user.Address.PostalCode,
                    Country = user.Address.Country
                }:null,
            };
        }

        public async Task UpdateUserProfileAsync(UserProfileDto userProfileDto)
        {
            var user = await _context.Users
                .Include(u => u.PersonalDetails)
                .Include(u => u.Address)
                .Include(u => u.SellerDetails)
                .FirstOrDefaultAsync(u => u.UserId == userProfileDto.UserId);

            if (user != null)
            {
                user.Email = userProfileDto.Email; // Allow email update
                user.PersonalDetails.FirstName = userProfileDto.PersonalDetails.FirstName;
                user.PersonalDetails.LastName = userProfileDto.PersonalDetails.LastName;
                user.PersonalDetails.PhoneNumber = userProfileDto.PersonalDetails.PhoneNumber;
                user.Address.AddressLine1 = userProfileDto.Address.AddressLine1;
                user.Address.AddressLine2 = userProfileDto.Address.AddressLine2;
                user.Address.City = userProfileDto.Address.City;
                user.Address.State = userProfileDto.Address.State;
                user.Address.PostalCode = userProfileDto.Address.PostalCode;
                user.Address.Country = userProfileDto.Address.Country;

                await _context.SaveChangesAsync();
            }
        }
    }
}
