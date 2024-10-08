using EcomLib.Models.DiscountManagement;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EcomLib.Repository.DiscountRepository
{
    public interface IProductDiscountRepository
    {
        Task<IEnumerable<ProductDiscount>> GetAllProductDiscountsAsync();
        Task<ProductDiscount> GetProductDiscountByIdAsync(int productDiscountId);
        Task CreateProductDiscountAsync(ProductDiscount productDiscount);
        Task UpdateProductDiscountAsync(ProductDiscount productDiscount);
        Task DeleteProductDiscountAsync(int productDiscountId);
    }

}
