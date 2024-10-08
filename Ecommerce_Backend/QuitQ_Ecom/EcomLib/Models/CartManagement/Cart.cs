
using Ecomlib.Models.UserManagemnt;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EcomLib.Models.Cartmanagement
{
    public class Cart
    {
        public int CartId { get; set; } // Primary Key
        public int UserId { get; set; } // Foreign Key from Users
        public decimal TotalAmount { get; set; }
        public DateTime DateCreated { get; set; }
        public bool IsActive { get; set; }
        public DateTime UpdatedDate { get; set; }

        // Navigation properties
        public User User { get; set; }
        public ICollection<CartItem> CartItems { get; set; }
    }

}
