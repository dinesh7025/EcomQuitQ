using EcomLib.Dtos.AnalyticsDtos;
using EcomLib.Repository.AnalyticsRepository.SalesAnalytics;
using EcomLib.Repository.AnalyticsRepository.SellerAnalysis;
using EcomLib.Repository.OrderRepository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EcomLib.Service
{
    public class SalesAnalyticsService
    {
        private readonly ISalesAnalyticsRepository _salesAnalyticsRepository;
        private readonly ISellerAnalysisRepository _sellerAnalysisRepository;

        public SalesAnalyticsService(ISalesAnalyticsRepository salesAnalyticsRepository, ISellerAnalysisRepository sellerAnalysisRepository)
        {
            _salesAnalyticsRepository = salesAnalyticsRepository;
            _sellerAnalysisRepository = sellerAnalysisRepository;
        }

        public List<SalesByCategoryDto> GetSalesByCategory()
        {
            return _salesAnalyticsRepository.GetSalesByCategory();
        }

        public List<SalesByProductDto> GetSalesByProduct()
        {
            return _salesAnalyticsRepository.GetSalesByProduct();
        }

        public List<SalesBySellerDto> GetSalesBySeller()
        {
            return _salesAnalyticsRepository.GetSalesBySeller();
        }

        public List<DailySalesDto> GetDailySales()
        {
            return _salesAnalyticsRepository.GetDailySales();
        }

        public List<SalesByProductDto> GetTopSellingProducts()
        {
            return _salesAnalyticsRepository.GetTopSellingProducts();
        }
        private readonly IOrderItemRepository _orderItemRepository;
        public async Task<List<SalesByProductDTO>> GetSalesByProductAsync(int sellerId)
        {
            return await _sellerAnalysisRepository.GetSalesByProductAsync(sellerId);
        }

        public async Task<List<SalesByMonthDto>> GetSalesByMonthAsync(int sellerId)
        {
            return await _sellerAnalysisRepository.GetSalesByMonthAsync(sellerId);
        }

        public async Task<TopSellingProductDto> GetTopSellingProductBySellerAsync(int sellerId)
        {
            return await _sellerAnalysisRepository.GetTopSellingProductBySellerAsync(sellerId);
        }
    }
}
