using EcomLib.Models.DiscountManagement;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EcomLib.Repository.DiscountRepository
{
    public interface IDiscountRepository
    {
        Task<IEnumerable<Discount>> GetAllDiscountsAsync();
        Task<Discount> GetDiscountByIdAsync(int discountId);
        Task<Discount> GetDiscountByCodeAsync(string discountCode);
        Task<Discount> CreateDiscountAsync(Discount discount);
        Task<Discount> UpdateDiscountAsync(int discountId, Discount discount);
        Task<bool> DeleteDiscountAsync(int discountId);
    }
}
