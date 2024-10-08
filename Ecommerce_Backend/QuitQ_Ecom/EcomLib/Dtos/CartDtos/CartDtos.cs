using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EcomLib.Dtos.CartDtos
{
    public class CartItemDTO
    {
        public int CartItemId { get; set; }
        public int ProductId { get; set; }
        public string ProductName { get; set; }
        public string ImageUrl { get; set; }
        public decimal Price { get; set; }
        public int Quantity { get; set; }
        public decimal TotalPrice { get; set; }
    }

    public class CartDTO
    {
        public int CartId { get; set; }
        public int UserId { get; set; }
        public decimal TotalAmount { get; set; }
        public bool IsActive { get; set; }
        public DateTime DateCreated { get; set; }
        public List<CartItemDTO> CartItems { get; set; }
    }

}
