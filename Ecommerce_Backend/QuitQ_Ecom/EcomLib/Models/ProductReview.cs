using Ecomlib.Models.UserManagemnt;
using EcomLib.Models.ProductManagment;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EcomQuitQ.Models
{
    public class ProductReview
    {
        public int ReviewId { get; set; } // Primary Key
        public int ProductId { get; set; } // Foreign Key from Product
        public int UserId { get; set; } // Foreign Key from Users
        public int Rating { get; set; } // Rating 1-5
        public string Comment { get; set; }
        public DateTime ReviewDate { get; set; }

        // Navigation properties
        public Product Product { get; set; }
        public User User { get; set; }
    }

}
