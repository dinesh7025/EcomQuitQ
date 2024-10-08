using EcomLib.Dtos.ProductDtos;
using EcomLib.Models.ProductManagment;
using EcomLib.Repository.WishListRepository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EcomLib.Service
{
    public class WishlistService
    {
        private readonly IWishlistRepository _wishlistRepository;

        public WishlistService(IWishlistRepository wishlistRepository)
        {
            _wishlistRepository = wishlistRepository;
        }

        public async Task AddToWishlist(int userId, int productId)
        {
            await _wishlistRepository.AddToWishlist(userId, productId);
        }

        public async Task<List<WishlistProductDTO>> GetUserWishlist(int userId)
        {
            return await _wishlistRepository.GetUserWishlist(userId);
        }

        public async Task RemoveFromWishlist(int userId, int productId)
        {
            await _wishlistRepository.RemoveFromWishlist(userId, productId);
        }
    }

}
