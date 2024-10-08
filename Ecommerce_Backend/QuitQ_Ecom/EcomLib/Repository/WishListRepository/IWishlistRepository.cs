using EcomLib.Dtos.ProductDtos;
using EcomLib.Models.ProductManagment;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EcomLib.Repository.WishListRepository
{
    public interface IWishlistRepository
    {
        Task AddToWishlist(int userId, int productId);
        Task<List<WishlistProductDTO>> GetUserWishlist(int userId);
        Task RemoveFromWishlist(int userId, int productId);
    }
}
