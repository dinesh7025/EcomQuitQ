using EcomLib.Dtos.CartDtos;
using EcomLib.Models.Cartmanagement;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EcomLib.Repository.CartRepository
{
    public interface ICartRepository
    {
        Cart GetCartByUserId(int userId);
        void AddToCart(CartItem cartItem);
        void UpdateCart(Cart cart);
        void RemoveFromCart(int cartItemId);
        void Save();
    }


}
