using EcomLib.Models.ProductManagment;
using EcomLib.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EcomLib.Dtos.ProductDtos;

namespace EcomLib.Repository.ProductRepository
{
    public interface IProductRepository
    {
        Task<IEnumerable<Product>> GetAllProductsAsync();
        Task<Product> GetProductByIdAsync(int productId);
        Task<IEnumerable<Product>> GetProductsByNameAsync(string productName);
        Task<int> AddProductAsync(Product product, Inventory inventory);
        Task UpdateProductAsync(Product product, Inventory inventory);
        Task DeleteProductAsync(int productId);
        Task<IEnumerable<ProductWithSellerDTO>> GetAllProductsWithSellersAsync();
        Task UpdateProductQuantityAsync(int productId, int quantity);

        Task<IEnumerable<SellerProductDTO>> GetProductsBySellerIdAsync(int sellerId);
        Task<ProductDetailsDTO> GetProductDetailsFull(int productId);

    }
}
