using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ecomlib.Models.UserManagemnt
{
    public class SellerDetails
    {
        public int SellerId { get; set; } // Primary Key
        public int UserId { get; set; } // Foreign Key from Users

        public string CompanyName { get; set; }
        public string CompanyRegistrationNumber { get; set; }
        public string GSTNumber { get; set; }
        public string BusinessType { get; set; }

        // Navigation property
        public User User { get; set; }
    }

}
