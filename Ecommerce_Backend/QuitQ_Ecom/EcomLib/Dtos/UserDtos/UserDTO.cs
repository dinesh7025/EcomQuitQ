using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EcomLib.Dtos.UserDtos
{
    public class UserDTO
    {
        public string Username { get; set; }
        public string Email { get; set; }
        public bool IsActive { get; set; }
    }

}
