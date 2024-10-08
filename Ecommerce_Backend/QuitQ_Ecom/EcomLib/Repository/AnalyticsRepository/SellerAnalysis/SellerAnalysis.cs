using EcomLib.Dtos.AnalyticsDtos;
using EcomLib.Repository.OrderRepository;
using EcomQuitQ.Data;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EcomLib.Repository.AnalyticsRepository.SellerAnalysis
{
    public class SellerAnalysisRepository : ISellerAnalysisRepository
    {
        private readonly AppDbContext _context;

        public SellerAnalysisRepository(AppDbContext context)
        {
            _context = context;
        }

        // Sales by product for a specific seller
        public async Task<List<SalesByProductDTO>> GetSalesByProductAsync(int sellerId)
        {
            return await _context.OrderItems
                .Where(oi => oi.SellerId == sellerId)
                .GroupBy(oi => oi.ProductId)
                .Select(group => new SalesByProductDTO
                {
                    ProductId = group.Key,
                    ProductName = group.FirstOrDefault().Product.ProductName, // assuming Product is navigational property
                    TotalQuantitySold = group.Sum(oi => oi.Quantity),
                    TotalSalesAmount = group.Sum(oi => oi.TotalPrice)
                })
                .ToListAsync();
        }

        // Sales by month for a specific seller
        public async Task<List<SalesByMonthDto>> GetSalesByMonthAsync(int sellerId)
        {
            return await _context.OrderItems
                .Where(oi => oi.SellerId == sellerId)
                .GroupBy(oi => new { oi.Order.OrderDate.Year, oi.Order.OrderDate.Month })
                .Select(group => new SalesByMonthDto
                {
                    Year = group.Key.Year,
                    Month = group.Key.Month,
                    TotalOrders = group.Count(),
                    TotalSalesAmount = group.Sum(oi => oi.TotalPrice)
                })
                .ToListAsync();
        }

        // Top-selling product for a specific seller
        public async Task<TopSellingProductDto> GetTopSellingProductBySellerAsync(int sellerId)
        {
            return await _context.OrderItems
                .Where(oi => oi.SellerId == sellerId)
                .GroupBy(oi => new { oi.ProductId, oi.Product.ProductName})
                .OrderByDescending(group => group.Sum(oi => oi.Quantity)) // Order by total quantity sold
                .Select(group => new TopSellingProductDto
                {
                    SellerId = sellerId,
                    ProductId = group.Key.ProductId,
                    ProductName = group.Key.ProductName,
                    TotalQuantitySold = group.Sum(oi => oi.Quantity),
                    TotalSalesAmount = group.Sum(oi => oi.TotalPrice)
                })
                .FirstOrDefaultAsync(); // Get the top product
        }
    }

}
