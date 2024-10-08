using Ecomlib.Models.UserManagemnt;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;

namespace EcomLib.JWT
{
    public class TokenGeneration
    {
     

        public string GenerateJWT(User validatedUser)
        {
            //Form Security Key and Credential
            var key = "CheckingLogin@CheckingLogin@CheckingLogin@CheckingLogin@CheckingLogin";
            var securedKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(key));
            var securityCredentials = new SigningCredentials(securedKey, SecurityAlgorithms.HmacSha256);

            //Define Claims with a List of Claims 
            var claims = new List<Claim>()
            {
                new Claim(JwtRegisteredClaimNames.UniqueName,validatedUser.Username),
                new Claim("UserId", validatedUser.UserId.ToString()),
                new Claim(ClaimTypes.Role,validatedUser.Role.ToString())
            };
            //Define the Token Object
            var token = new JwtSecurityToken(

                  issuer: "QuitQ.com",
                  audience: "QuitQ_Admin",
                  claims: claims,
                  expires: DateTime.Now.AddHours(1),
                  signingCredentials: securityCredentials
                );
            return new JwtSecurityTokenHandler().WriteToken(token);
        }
    }
}
