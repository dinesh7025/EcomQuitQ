using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EcomLib.Dtos.UserDtos
{
    public class RegisterUserDTO
    {
        public string Username { get; set; }
        public string Password { get; set; }
        public string Email { get; set; }
        public PersonalDetailsDTO PersonalDetails { get; set; }
        public AddressDTO Address { get; set; }
    }



}
