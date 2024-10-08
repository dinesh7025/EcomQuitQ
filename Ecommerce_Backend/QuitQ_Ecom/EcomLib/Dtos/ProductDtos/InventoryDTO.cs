using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EcomLib.Dtos.ProductDtos
{
    public class InventoryDTO
    {
        public int InventoryId { get; set; }
        public int ProductId { get; set; }
        public int QuantityInStock { get; set; }
        public int ReorderLevel { get; set; }
        public DateTime LastRestockedDate { get; set; }
    }
}
