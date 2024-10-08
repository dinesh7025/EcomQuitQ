using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EcomLib.Dtos.UserDtos
{
    public class SellerDTO
    {
        public int SellerId { get; set; }
        public int UserId { get; set; }
        public string CompanyName { get; set; }
        public string CompanyRegistrationNumber { get; set; }
        public string GSTNumber { get; set; }
        public string BusinessType { get; set; }
    }

}
