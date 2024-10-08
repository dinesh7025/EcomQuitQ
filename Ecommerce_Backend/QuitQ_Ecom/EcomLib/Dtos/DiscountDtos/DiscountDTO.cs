using EcomLib.Models.DiscountManagement;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EcomLib.Dtos.DiscountDtos
{
    public class DiscountDTO
    {
        public int DiscountId { get; set; }
        public string DiscountCode { get; set; }
        public string Description { get; set; }
        public DiscountType DiscountType { get; set; }
        public decimal DiscountValue { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }
        public bool IsActive { get; set; }
    }

}
