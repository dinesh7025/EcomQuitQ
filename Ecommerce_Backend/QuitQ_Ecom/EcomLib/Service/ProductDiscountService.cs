
using EcomLib.Dtos.DiscountDtos;
using EcomLib.Exceptionhandling;
using EcomLib.Models.DiscountManagement;
using EcomLib.Repository.DiscountRepository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EcomLib.Service
{
    public class ProductDiscountService
    {
        private readonly IProductDiscountRepository _productDiscountRepository;

        public ProductDiscountService(IProductDiscountRepository productDiscountRepository)
        {
            _productDiscountRepository = productDiscountRepository;
        }

        public async Task<IEnumerable<ProductDiscountDTO>> GetAllProductDiscountsAsync()
        {
            var productDiscounts = await _productDiscountRepository.GetAllProductDiscountsAsync();
            return productDiscounts.Select(pd => new ProductDiscountDTO
            {
                ProductDiscountId = pd.ProductDiscountId,
                ProductId = pd.ProductId,
                DiscountId = pd.DiscountId
            });
        }

        public async Task<ProductDiscountDTO> GetProductDiscountByIdAsync(int productDiscountId)
        {
            var productDiscount = await _productDiscountRepository.GetProductDiscountByIdAsync(productDiscountId);
            if (productDiscount == null)
            {
                throw new ProductDiscountNotFoundException("Product discount not found");
            }

            return new ProductDiscountDTO
            {
                ProductDiscountId = productDiscount.ProductDiscountId,
                ProductId = productDiscount.ProductId,
                DiscountId = productDiscount.DiscountId
            };
        }

        public async Task CreateProductDiscountAsync(ProductDiscountDTO productDiscountDTO)
        {
            var productDiscount = new ProductDiscount
            {
                ProductId = productDiscountDTO.ProductId,
                DiscountId = productDiscountDTO.DiscountId
            };

            await _productDiscountRepository.CreateProductDiscountAsync(productDiscount);
        }

        public async Task UpdateProductDiscountAsync(int productDiscountId, ProductDiscountDTO productDiscountDTO)
        {
            var productDiscount = await _productDiscountRepository.GetProductDiscountByIdAsync(productDiscountId);
            if (productDiscount == null)
            {
                throw new ProductDiscountNotFoundException("Product discount not found");
            }

            productDiscount.ProductId = productDiscountDTO.ProductId;
            productDiscount.DiscountId = productDiscountDTO.DiscountId;

            await _productDiscountRepository.UpdateProductDiscountAsync(productDiscount);
        }

        public async Task DeleteProductDiscountAsync(int productDiscountId)
        {
            var productDiscount = await _productDiscountRepository.GetProductDiscountByIdAsync(productDiscountId);
            if (productDiscount == null)
            {
                throw new ProductDiscountNotFoundException("Product discount not found");
            }

            await _productDiscountRepository.DeleteProductDiscountAsync(productDiscountId);
        }
    }


}
