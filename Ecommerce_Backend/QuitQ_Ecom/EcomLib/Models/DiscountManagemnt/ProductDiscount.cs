using EcomLib.Models.ProductManagment;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EcomLib.Models.DiscountManagement
{
    public class ProductDiscount
    {
        public int ProductDiscountId { get; set; } // Primary Key
        public int ProductId { get; set; } // Foreign Key from Product
        public int DiscountId { get; set; } // Foreign Key from Discount

        // Navigation properties
        public Product Product { get; set; }
        public Discount Discount { get; set; }
    }

}
