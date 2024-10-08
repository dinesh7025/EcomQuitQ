using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ecomlib.Models.UserManagemnt
{
    public class PersonalDetails
    {
        public int PersonalDetailsId { get; set; } // Primary Key
        public int UserId { get; set; } // Foreign Key from Users

        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Gender { get; set; } // Consider using Enum if Gender has predefined values
        public DateTime DateOfBirth { get; set; }
        public string PhoneNumber { get; set; }

        // Navigation property
        public User User { get; set; }
    }

}
