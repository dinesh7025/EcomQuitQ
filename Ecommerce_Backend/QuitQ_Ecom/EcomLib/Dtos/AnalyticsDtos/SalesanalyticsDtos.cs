using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EcomLib.Dtos.AnalyticsDtos
{
    public class SalesByCategoryDto
    {
        public string CategoryName { get; set; }
        public decimal TotalSales { get; set; }
    }

    public class SalesByProductDto
    {
        public string ProductName { get; set; }
        public decimal TotalSales { get; set; }
    }

    public class SalesBySellerDto
    {
        public string SellerName { get; set; }
        public decimal TotalSales { get; set; }
    }

    public class DailySalesDto
    {
        public DateTime Date { get; set; }
        public decimal TotalSales { get; set; }
    }

}
