using EcomLib.JWT;
using EcomLib.Repository.LoginRepository;
using EcomLib.Repository.UserRepository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EcomLib.Service
{
    public class AuthService
    {
        private readonly ILoginRepository _loginRepository;
        private readonly IUserRepository _userRepository;
        private readonly TokenGeneration _tokenGeneration;


        public AuthService(ILoginRepository loginRepository, IUserRepository userRepository, TokenGeneration tokenGeneration)
        {
            _loginRepository = loginRepository;
            _userRepository = userRepository;
            _tokenGeneration = tokenGeneration;
        }

        public async Task<string> LoginAndGenerateTokenAsync(string usernameOrEmail, string password)
        {
            // Validate login
            var isValidLogin = await _loginRepository.ValidateLoginAsync(usernameOrEmail, password);
            if (!isValidLogin)
            {
                throw new UnauthorizedAccessException("Invalid username, email, or password.");
            }

            // Generate JWT token
            var user = await _userRepository.GetUserByEmailOrUsernameAsync(usernameOrEmail);
            return _tokenGeneration.GenerateJWT(user);
        }
    }
}
