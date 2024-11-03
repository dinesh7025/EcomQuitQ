using Ecomlib.Models.UserManagemnt;
using EcomLib.Dtos.UserDtos;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace EcomLib.Repository.UserRepository
{
    public interface IUserRepository
    {
        Task<User> GetUserById(int userId);
        Task<IEnumerable<GetUserDTO>> GetAllUsersAsync(); 
        Task<GetUserDTO> GetUserByIdAsync(int userId); 
        Task<GetUserDTO> GetUserByUsernameAsync(string username); 
        Task<GetUserDTO> GetUserByEmailAsync(string email);
        Task<User> GetUserByEmailOrUsernameAsync(string emailOrUsername);
        Task<SellerDetails> GetSellerDetailsByUserIdAsync(int userId);
        Task<int> AddUserAsync(User user);
        Task AddSellerDetailsAsync(SellerDetails sellerDetails);
        Task UpdateUserAsync(UserDTO userDto, int userId);
        Task UpdateUserAsync(User user);
        Task UpdatePersonalDetailsAsync(PersonalDetails updatedDetails); 
        Task UpdateSellerDetailsAsync(User updatedSellerDetails); 
        Task DeleteUserAsync(int userId);

        Task LogUserAction(int userId, string action, string tableAffected, int recordId, string details); //Audit Logs

        //Dashboard related
        Task<IEnumerable<LastRegisteredDTO>> GetUsersLast24HoursAsync();
        Task<IEnumerable<LastRegisteredDTO>> GetUsersLast7DaysAsync();
        Task<IEnumerable<LastRegisteredDTO>> GetUsersLastMonthAsync();

        Task<IEnumerable<LastRegisteredSellerDTO>> GetSellersLast24HoursAsync();
        Task<IEnumerable<LastRegisteredSellerDTO>> GetSellersLast7DaysAsync();
        Task<IEnumerable<LastRegisteredSellerDTO>> GetSellersLastMonthAsync();

        IEnumerable<Address> GetAddressesByUserId(int userId);

        Task<SellerDTO> GetSellerByUserIdAsync(int userId);

        Task<UserProfileDto> GetUserProfileByIdAsync(int userId);
        Task UpdateUserProfileAsync(UserProfileDto userProfileDto);
        void AddAddress(Address address);
        void UpdateAddress(Address address);
        Address GetAddressById(int addressId);
    }
}
