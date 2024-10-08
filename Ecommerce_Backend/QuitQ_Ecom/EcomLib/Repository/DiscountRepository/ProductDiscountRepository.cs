using EcomLib.Models.DiscountManagement;
using EcomQuitQ.Data;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EcomLib.Repository.DiscountRepository
{
    public class ProductDiscountRepository : IProductDiscountRepository
    {
        private readonly AppDbContext _context;

        public ProductDiscountRepository(AppDbContext context)
        {
            _context = context;
        }

        public async Task<IEnumerable<ProductDiscount>> GetAllProductDiscountsAsync()
        {
            return await _context.ProductDiscounts.ToListAsync();
        }

        public async Task<ProductDiscount> GetProductDiscountByIdAsync(int productDiscountId)
        {
            return await _context.ProductDiscounts
                .FirstOrDefaultAsync(pd => pd.ProductDiscountId == productDiscountId);
        }

        public async Task CreateProductDiscountAsync(ProductDiscount productDiscount)
        {
            await _context.ProductDiscounts.AddAsync(productDiscount);
            await _context.SaveChangesAsync();
        }

        public async Task UpdateProductDiscountAsync(ProductDiscount productDiscount)
        {
            _context.ProductDiscounts.Update(productDiscount);
            await _context.SaveChangesAsync();
        }

        public async Task DeleteProductDiscountAsync(int productDiscountId)
        {
            var productDiscount = await GetProductDiscountByIdAsync(productDiscountId);
            if (productDiscount != null)
            {
                _context.ProductDiscounts.Remove(productDiscount);
                await _context.SaveChangesAsync();
            }
        }
    }

}
