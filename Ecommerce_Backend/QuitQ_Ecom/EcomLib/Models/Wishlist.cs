﻿using EcomLib.Models.ProductManagment;
using Ecomlib.Models.UserManagemnt;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EcomLib.Models
{
    public class Wishlist
    {
        public int WishlistId { get; set; }
        public int UserId { get; set; } // Foreign Key from User
        public int ProductId { get; set; } // Foreign Key from Product
        public DateTime DateAdded { get; set; }

        // Navigation properties
        public User User { get; set; }
        public Product Product { get; set; }
    }

}
