using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EcomLib.Dtos.UserDtos
{
    public class RegisterSellerDTO : RegisterUserDTO //inherit common fields
    {
        public SellerDetailsDTO SellerDetails { get; set; }
    }



}
