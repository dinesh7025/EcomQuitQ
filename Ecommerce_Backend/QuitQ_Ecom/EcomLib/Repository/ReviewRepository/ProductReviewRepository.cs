using EcomLib.Dtos;
using EcomLib.Exceptionhandling;
using EcomQuitQ.Data;
using EcomQuitQ.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EcomLib.Repository.ReviewRepository
{
    public class ProductReviewRepository : IProductReviewRepository
    {
        private readonly AppDbContext _context;

        public ProductReviewRepository(AppDbContext context)
        {
            _context = context;
        }

        public async Task<int> AddReviewAsync(ReviewDTO reviewDto)
        {
            // Create a new review entity
            var review = new ProductReview
            {
                ProductId = reviewDto.ProductId,
                UserId = reviewDto.UserId,
                Rating = reviewDto.Rating,
                Comment = reviewDto.Comment,
                ReviewDate = DateTime.Now
            };

            _context.ProductReviews.Add(review);
            await _context.SaveChangesAsync();

            return review.ReviewId;
        }

        public async Task<ReviewResponseDTO> GetReviewByIdAsync(int reviewId)
        {
            var review = await _context.ProductReviews
                .Include(r => r.Product)
                .Include(r => r.User)
                .FirstOrDefaultAsync(r => r.ReviewId == reviewId);

            if (review == null) throw new ReviewNotFoundException($"Review Not found for Id: {reviewId}");

            return new ReviewResponseDTO
            {
                ReviewId = review.ReviewId,
                ProductId = review.ProductId,
                UserId = review.UserId,
                ProductName = review.Product.ProductName,
                Username = review.User.Username,
                Rating = review.Rating,
                Comment = review.Comment,
                ReviewDate = review.ReviewDate
            };
        }

        public async Task<IEnumerable<ReviewResponseDTO>> GetReviewsByProductIdAsync(int productId)
        {
            var product = _context.Products.FirstOrDefault(p => p.ProductId == productId);
            if (product == null) throw new ProductNotFoundException($"Product Not found for the ID:{productId} "); ;

            var reviews = await _context.ProductReviews
                .Where(r => r.ProductId == productId)
                .Include(r => r.User)
                .Select(r => new ReviewResponseDTO
                {
                    ReviewId = r.ReviewId,
                    ProductId = r.ProductId,
                    ProductName = product.ProductName,
                    UserId = r.UserId,
                    Username = r.User.Username,
                    Rating = r.Rating,
                    Comment = r.Comment,
                    ReviewDate = r.ReviewDate
                }).ToListAsync();

            return reviews;
        }

        public async Task<IEnumerable<ReviewResponseDTO>> GetReviewsByUserIdAsync(int userId)
        {
            var user = _context.Users.FirstOrDefault(u => u.UserId == userId);
            if (user == null) throw new UserNotFoundException("User Not Found"); 

            var reviews = await _context.ProductReviews
                .Where(r => r.UserId == userId)
                .Include(r => r.Product)
                .Select(r => new ReviewResponseDTO
                {
                    ReviewId = r.ReviewId,
                    ProductId = r.ProductId,
                    ProductName = r.Product.ProductName,
                    Username = user.Username,
                    Rating = r.Rating,
                    Comment = r.Comment,
                    ReviewDate = r.ReviewDate
                }).ToListAsync();

            return reviews;
        }

        public async Task<bool> UpdateReviewAsync(int reviewId, ReviewDTO reviewDto)
        {
            var review = await _context.ProductReviews.FindAsync(reviewId);
            if (review == null) throw new ReviewNotFoundException($"Review Not found for Id: {reviewId}");

            review.Rating = reviewDto.Rating;
            review.Comment = reviewDto.Comment;
            await _context.SaveChangesAsync();

            return true;
        }

        public async Task<bool> DeleteReviewAsync(int reviewId)
        {
            var review = await _context.ProductReviews.FindAsync(reviewId);
            if (review == null) throw new ReviewNotFoundException($"Review Not found for Id: {reviewId}");

            _context.ProductReviews.Remove(review);
            await _context.SaveChangesAsync();

            return true;
        }
    }

}
