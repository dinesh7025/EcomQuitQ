using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EcomLib.Dtos.ProductDtos
{
    public class ProductDetailsDTO
    {
        public int ProductId { get; set; }
        public string ProductName { get; set; }
        public string BrandName { get; set; }
        public decimal Price { get; set; }
        public string Description { get; set; }
        public string ImageUrl { get; set; }
        public int StockQuantity { get; set; }
        public int RestockLevel { get; set; }
        public bool IsLowStock { get; set; }
        public List<ProductReviewDTO> Reviews { get; set; }
    }

    public class ProductReviewDTO
    {
        public int ReviewId { get; set; }
        public int UserId { get; set; }
        public string Username { get; set; }
        public int Rating { get; set; }
        public string Comment { get; set; }
        public DateTime ReviewDate { get; set; }
    }

    public class WishlistProductDTO
    {
        public int ProductId { get; set; }
        public string ProductName { get; set; }
        public DateTime WishlistAddedDate { get; set; }
        public string ImageUrl { get; set; }
        public decimal Price { get; set; }
        public string Description { get; set; }
    }



}
