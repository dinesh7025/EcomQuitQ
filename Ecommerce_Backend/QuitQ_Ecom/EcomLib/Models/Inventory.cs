
using EcomLib.Models.ProductManagment;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EcomLib.Models
{
    public class Inventory
    {
        public int InventoryId { get; set; } // Primary Key
        public int ProductId { get; set; } // Foreign Key from Product
        public int QuantityInStock { get; set; }
        public int ReorderLevel { get; set; }
        public DateTime LastRestockedDate { get; set; }

        // Navigation property
        public Product Product { get; set; }
    }

}
