using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EcomLib.Dtos.UserDtos
{
    public class LastRegisteredDTO
    {
        public int UserId { get; set; }
        public string UserName { get; set; }
        public string Email { get; set; }
        public string Role { get; set; }
        public DateTime DateCreated { get; set; }
        public bool IsActive { get; set; }
    }

    public class LastRegisteredSellerDTO
    {
        public int UserId { get; set; }
        public string UserName { get; set; }
        public string Email { get; set; }
        public string Role { get; set; }
        public DateTime DateCreated { get; set; }
        public bool IsActive { get; set; }
        public int SellerId { get; set; }
        public string CompanyName { get; set; }
        public string CompanyRegistrationNumber { get; set; }
        public string GSTNumber { get; set; }
        public string BusinessType { get; set; }
    }

}
