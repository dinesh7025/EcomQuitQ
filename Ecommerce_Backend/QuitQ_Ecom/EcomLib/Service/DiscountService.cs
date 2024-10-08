
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
    public class DiscountService
    {
        private readonly IDiscountRepository _discountRepository;

        public DiscountService(IDiscountRepository discountRepository)
        {
            _discountRepository = discountRepository;
        }

        public async Task<IEnumerable<DiscountDTO>> GetAllDiscountsAsync()
        {
            var discounts = await _discountRepository.GetAllDiscountsAsync();
            return discounts.Select(d => new DiscountDTO
            {
                DiscountId = d.DiscountId,
                DiscountCode = d.DiscountCode,
                Description = d.Description,
                DiscountType = d.DiscountType,
                DiscountValue = d.DiscountValue,
                StartDate = d.StartDate,
                EndDate = d.EndDate,
                IsActive = d.IsActive
            });
        }

        public async Task<DiscountDTO> GetDiscountByIdAsync(int discountId)
        {
            var discount = await _discountRepository.GetDiscountByIdAsync(discountId);
            if (discount == null)
            {
                throw new DiscountNotFoundException("Discount not found");
            }

            return new DiscountDTO
            {
                DiscountId = discount.DiscountId,
                DiscountCode = discount.DiscountCode,
                Description = discount.Description,
                DiscountType = discount.DiscountType,
                DiscountValue = discount.DiscountValue,
                StartDate = discount.StartDate,
                EndDate = discount.EndDate,
                IsActive = discount.IsActive
            };
        }

        public async Task<DiscountDTO> GetDiscountByCodeAsync(string discountCode)
        {
            var discount = await _discountRepository.GetDiscountByCodeAsync(discountCode);

            if (discount == null)
            {
                return null;
            }

            // Map to DTO
            var discountDTO = new DiscountDTO
            {
                DiscountId = discount.DiscountId,
                DiscountCode = discount.DiscountCode,
                Description = discount.Description,
                DiscountType = discount.DiscountType,
                DiscountValue = discount.DiscountValue,
                StartDate = discount.StartDate,
                EndDate = discount.EndDate,
                IsActive = discount.IsActive
            };

            return discountDTO;
        }

        public async Task CreateDiscountAsync(DiscountDTO discountDTO)
        {
            var discount = new Discount
            {
                DiscountCode = discountDTO.DiscountCode,
                Description = discountDTO.Description,
                DiscountType = discountDTO.DiscountType,
                DiscountValue = discountDTO.DiscountValue,
                StartDate = discountDTO.StartDate,
                EndDate = discountDTO.EndDate,
                IsActive = discountDTO.IsActive
            };

            await _discountRepository.CreateDiscountAsync(discount);
        }

        public async Task UpdateDiscountAsync(int discountId, DiscountDTO discountDTO)
        {
            var discount = await _discountRepository.GetDiscountByIdAsync(discountId);
            if (discount == null)
            {
                throw new DiscountNotFoundException("Discount not found");
            }

            discount.DiscountCode = discountDTO.DiscountCode;
            discount.Description = discountDTO.Description;
            discount.DiscountType = discountDTO.DiscountType;
            discount.DiscountValue = discountDTO.DiscountValue;
            discount.StartDate = discountDTO.StartDate;
            discount.EndDate = discountDTO.EndDate;
            discount.IsActive = discountDTO.IsActive;

            await _discountRepository.UpdateDiscountAsync(discountId, discount);
        }

        public async Task DeleteDiscountAsync(int discountId)
        {
            var discount = await _discountRepository.GetDiscountByIdAsync(discountId);
            if (discount == null)
            {
                throw new DiscountNotFoundException("Discount not found");
            }

            await _discountRepository.DeleteDiscountAsync(discountId);
        }
    }

}
