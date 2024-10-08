
using EcomLib.Models.ProductManagment;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EcomLib.Models.Cartmanagement
{
    public class CartItem
    {
        public int CartItemId { get; set; } // Primary Key
        public int CartId { get; set; } // Foreign Key from Cart
        public int ProductId { get; set; } // Foreign Key from Product
        public int Quantity { get; set; }
        public decimal UnitPrice { get; set; }
        public decimal TotalPrice { get; set; }

        // Navigation properties
        public Cart Cart { get; set; }
        public Product Product { get; set; }
    }

}
