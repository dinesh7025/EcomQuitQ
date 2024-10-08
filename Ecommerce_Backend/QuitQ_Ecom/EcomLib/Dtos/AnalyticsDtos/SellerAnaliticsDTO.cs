using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EcomLib.Dtos.AnalyticsDtos
{
    public class SalesByProductDTO
    {
        public int ProductId { get; set; }
        public string ProductName { get; set; }
        public int TotalQuantitySold { get; set; }
        public decimal TotalSalesAmount { get; set; }
    }
    public class SalesByMonthDto
    {
        public int Month { get; set; }
        public int Year { get; set; }
        public int TotalOrders { get; set; }
        public decimal TotalSalesAmount { get; set; }
    }
    public class TopSellingProductDto
    {
        public int SellerId { get; set; }
        public int ProductId { get; set; }
        public string ProductName { get; set; }
        public int TotalQuantitySold { get; set; }
        public decimal TotalSalesAmount { get; set; }
    }


}
