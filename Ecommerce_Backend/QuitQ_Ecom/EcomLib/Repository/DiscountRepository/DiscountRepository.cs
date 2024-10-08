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
    public class DiscountRepository : IDiscountRepository
    {
        private readonly AppDbContext _context;

        public DiscountRepository(AppDbContext context)
        {
            _context = context;
        }

        public async Task<IEnumerable<Discount>> GetAllDiscountsAsync()
        {
            return await _context.Discounts.ToListAsync();
        }

        public async Task<Discount> GetDiscountByIdAsync(int discountId)
        {
            return await _context.Discounts.FindAsync(discountId);
        }

        public async Task<Discount> GetDiscountByCodeAsync(string discountCode)
        {
            return await _context.Discounts
                .FirstOrDefaultAsync(d => d.DiscountCode == discountCode);
        }
        public async Task<Discount> CreateDiscountAsync(Discount discount)
        {
            _context.Discounts.Add(discount);
            await _context.SaveChangesAsync();
            return discount;
        }

        public async Task<Discount> UpdateDiscountAsync(int discountId, Discount discount)
        {
            var existingDiscount = await _context.Discounts.FindAsync(discountId);
            if (existingDiscount == null) return null;

            existingDiscount.DiscountCode = discount.DiscountCode;
            existingDiscount.Description = discount.Description;
            existingDiscount.DiscountType = discount.DiscountType;
            existingDiscount.DiscountValue = discount.DiscountValue;
            existingDiscount.StartDate = discount.StartDate;
            existingDiscount.EndDate = discount.EndDate;
            existingDiscount.IsActive = discount.IsActive;

            await _context.SaveChangesAsync();
            return existingDiscount;
        }

        public async Task<bool> DeleteDiscountAsync(int discountId)
        {
            var discount = await _context.Discounts.FindAsync(discountId);
            if (discount == null) return false;

            _context.Discounts.Remove(discount);
            await _context.SaveChangesAsync();
            return true;
        }
    }
}
