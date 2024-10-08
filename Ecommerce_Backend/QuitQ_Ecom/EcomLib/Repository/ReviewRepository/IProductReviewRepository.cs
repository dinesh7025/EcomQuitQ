using EcomLib.Dtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EcomLib.Repository.ReviewRepository
{
    public interface IProductReviewRepository
    {
        Task<int> AddReviewAsync(ReviewDTO reviewDto);
        Task<ReviewResponseDTO> GetReviewByIdAsync(int reviewId);
        Task<IEnumerable<ReviewResponseDTO>> GetReviewsByProductIdAsync(int productId);
        Task<IEnumerable<ReviewResponseDTO>> GetReviewsByUserIdAsync(int userId);
        Task<bool> UpdateReviewAsync(int reviewId, ReviewDTO reviewDto);
        Task<bool> DeleteReviewAsync(int reviewId);
    }

}
