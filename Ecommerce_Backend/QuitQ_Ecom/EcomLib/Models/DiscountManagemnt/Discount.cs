using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EcomLib.Models.DiscountManagement
{
    public class Discount
    {
        public int DiscountId { get; set; } // Primary Key
        public string DiscountCode { get; set; }
        public string Description { get; set; }
        public DiscountType DiscountType { get; set; } // Enum: Percentage, FixedAmount
        public decimal DiscountValue { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }
        public bool IsActive { get; set; }

        public ICollection<ProductDiscount> ProductDiscounts { get; set; }
    }

    // Enum for DiscountType
    public enum DiscountType
    {
        Percentage,
        FixedAmount
    }

}
