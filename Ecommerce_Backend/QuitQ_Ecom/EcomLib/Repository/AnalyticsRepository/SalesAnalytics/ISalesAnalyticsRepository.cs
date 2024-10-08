using EcomLib.Dtos.AnalyticsDtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EcomLib.Repository.AnalyticsRepository.SalesAnalytics
{
    public interface ISalesAnalyticsRepository
    {
        List<SalesByCategoryDto> GetSalesByCategory();
        List<SalesByProductDto> GetSalesByProduct();
        List<SalesBySellerDto> GetSalesBySeller();
        List<DailySalesDto> GetDailySales();
        List<SalesByProductDto> GetTopSellingProducts();
    }

}
