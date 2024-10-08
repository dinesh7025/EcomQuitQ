using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EcomLib.Dtos.UserDtos
{
    public class UserProfileDto
    {
        public int UserId { get; set; }
        public string Username { get; set; }
        public string Email { get; set; }
        public DateTime DateCreated { get; set; }

        // Personal Details
        public PersonalDetailsDto PersonalDetails { get; set; }

        // Address
        public AddressDto Address { get; set; }
    }

    public class PersonalDetailsDto
    {
        public int PersonalDetailsId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Gender { get; set; } // Consider using Enum if Gender has predefined values
        public DateTime DateOfBirth { get; set; }
        public string PhoneNumber { get; set; }
    }

    public class AddressDto
    {
        public int AddressId { get; set; }
        public string AddressLine1 { get; set; }
        public string AddressLine2 { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string PostalCode { get; set; }
        public string Country { get; set; }
    }

}
