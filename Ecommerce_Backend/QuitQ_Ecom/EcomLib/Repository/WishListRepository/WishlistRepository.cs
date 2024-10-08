using EcomLib.Models.ProductManagment;
using EcomLib.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EcomQuitQ.Data;
using Microsoft.EntityFrameworkCore;
using EcomLib.Dtos.ProductDtos;

namespace EcomLib.Repository.WishListRepository
{
    public class WishlistRepository:IWishlistRepository
    {
        private readonly AppDbContext _context;

        public WishlistRepository(AppDbContext context)
        {
            _context = context;
        }

        public async Task AddToWishlist(int userId, int productId)
        {
            var wishlist = new Wishlist
            {
                UserId = userId,
                ProductId = productId,
                DateAdded = DateTime.Now
            };

            _context.Wishlists.Add(wishlist);
            await _context.SaveChangesAsync();
        }

        public async Task<List<WishlistProductDTO>> GetUserWishlist(int userId)
        {
            return await _context.Wishlists
                .Where(w => w.UserId == userId)
                .Select(w => new WishlistProductDTO
                {
                    ProductId = w.Product.ProductId,
                    ProductName = w.Product.ProductName,
                    WishlistAddedDate = w.DateAdded, 
                    Price = w.Product.Price,
                    ImageUrl = w.Product.ImageUrl,
                    Description = w.Product.Description
                })
                .ToListAsync();
        }


        public async Task RemoveFromWishlist(int userId, int productId)
        {
            var wishlist = await _context.Wishlists
                .FirstOrDefaultAsync(w => w.UserId == userId && w.ProductId == productId);

            if (wishlist != null)
            {
                _context.Wishlists.Remove(wishlist);
                await _context.SaveChangesAsync();
            }
        }
    }

}
