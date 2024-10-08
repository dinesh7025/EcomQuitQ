using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EcomLib.Dtos.ProductDtos
{
    public class SellerProductDTO
    {
        public int ProductId { get; set; }
        public string Name { get; set; }
        public int SellerId { get; set; }
        public string Description { get; set; }
        public decimal Price { get; set; }
        public int StockQuantity { get; set; }
        public string ImageUrl { get; set; }
        public int SubCategoryId { get; set; }
        public int BrandId { get; set; }
        public string BrandName { get; set; } // Fetched from Brand table
        public bool IsActive { get; set; }    // From Inventory
        public int RestockLevel { get; set; } // From Inventory
        public DateTime LastRestocked { get; set; } // From Inventory
    }

}
