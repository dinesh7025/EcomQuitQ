using EcomLib.Dtos;
using EcomLib.Repository.ReviewRepository;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EcomLib.Service
{
    public class ProductReviewService
    {
        private readonly IProductReviewRepository _productReviewRepository;

        public ProductReviewService(IProductReviewRepository productReviewRepository)
        {
            _productReviewRepository = productReviewRepository;
        }

        public Task<int> AddReviewAsync(ReviewDTO reviewDto)
        {
            return _productReviewRepository.AddReviewAsync(reviewDto);
        }

        public Task<ReviewResponseDTO> GetReviewByIdAsync(int reviewId)
        {
            return _productReviewRepository.GetReviewByIdAsync(reviewId);
        }

        public Task<IEnumerable<ReviewResponseDTO>> GetReviewsByProductIdAsync(int productId)
        {
            return _productReviewRepository.GetReviewsByProductIdAsync(productId);
        }

        public Task<IEnumerable<ReviewResponseDTO>> GetReviewsByUserIdAsync(int userId)
        {
            return _productReviewRepository.GetReviewsByUserIdAsync(userId);
        }

        public Task<bool> UpdateReviewAsync(int reviewId, ReviewDTO reviewDto)
        {
            return _productReviewRepository.UpdateReviewAsync(reviewId, reviewDto);
        }

        public Task<bool> DeleteReviewAsync(int reviewId)
        {
            return _productReviewRepository.DeleteReviewAsync(reviewId);
        }
    }

}
