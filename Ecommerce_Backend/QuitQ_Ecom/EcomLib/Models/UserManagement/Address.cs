using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ecomlib.Models.UserManagemnt
{
    public class Address
    {
        public int AddressId { get; set; } //Primary Key
        public int UserId { get; set; } //Foreign Key from Users

        public string AddressLine1 { get; set; }
        public string AddressLine2 { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string PostalCode { get; set; }
        public string Country { get; set; }

        // Navigation property
        public User User { get; set; }
    }

}
