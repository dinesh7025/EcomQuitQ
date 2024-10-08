using EcomLib.Dtos.AnalyticsDtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EcomLib.Repository.AnalyticsRepository.SellerAnalysis
{
    public interface ISellerAnalysisRepository
    {
        Task<List<SalesByProductDTO>> GetSalesByProductAsync(int sellerId);
        Task<List<SalesByMonthDto>> GetSalesByMonthAsync(int sellerId);
        Task<TopSellingProductDto> GetTopSellingProductBySellerAsync(int sellerId);
    }
}
