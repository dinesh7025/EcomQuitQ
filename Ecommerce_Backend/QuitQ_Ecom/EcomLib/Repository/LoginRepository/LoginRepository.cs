using EcomLib.Exceptionhandling;
using EcomLib.Models;
using EcomLib.Repository.UserRepository;
using EcomQuitQ.Data;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EcomLib.Repository.LoginRepository
{
    public class LoginRepository : ILoginRepository
    {
        private readonly AppDbContext _context;
        private readonly IUserRepository _userRepository;

        public LoginRepository(AppDbContext context, IUserRepository userRepository)
        {
            _context = context;
            _userRepository = userRepository;
        }

        public async Task<bool> ValidateLoginAsync(string usernameOrEmail, string password)
        {
            // find the user based on username or email
            var user = await _context.Users
                .FirstOrDefaultAsync(u => (u.Username == usernameOrEmail || u.Email == usernameOrEmail) && u.IsActive);

            // If the user is null or password doesn't match, log the failure and return false
            if (user == null || !BCrypt.Net.BCrypt.Verify(password, user.PasswordHash))
            {
                //if user was found but the password was incorrect
                if (user != null)
                {
                    await _userRepository.LogUserAction(
                        user.UserId,
                        $"{user.Role.ToString()} Login Failed",
                        "Users",
                        user.UserId,
                        $"Failed login attempt with UserName: {user.Username}."
                    );
                }

                return false;
            }

            // If login is successful, log the success action
            await _userRepository.LogUserAction(
                user.UserId,
                $"{user.Role.ToString()} Logged In",
                "Users",
                user.UserId,
                $"{user.Role.ToString()} with UserName: {user.Username} logged in successfully."
            );

            return true;
        }
    }
}
