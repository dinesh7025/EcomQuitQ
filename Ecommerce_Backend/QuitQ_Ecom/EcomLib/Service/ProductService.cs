using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EcomLib.Service
{
    using System.Collections.Generic;
    using System.Linq;
    using System.Threading.Tasks;
    using global::EcomLib.Exceptionhandling;
    using global::EcomLib.Models.ProductManagment;
    using global::EcomLib.Models;
    using global::EcomLib.Repository.ProductRepository;
    using global::EcomLib.Dtos.ProductDtos;

    namespace EcomLib.Services
    {
        public class ProductService
        {
            private readonly IProductRepository _productRepository;

            public ProductService(IProductRepository productRepository)
            {
                _productRepository = productRepository;
            }

            public async Task<IEnumerable<ProductDTO>> GetAllProductsAsync()
            {
                var products = await _productRepository.GetAllProductsAsync();
                return products.Select(product => new ProductDTO
                {
                    ProductId = product.ProductId,
                    ProductName = product.ProductName,
                    Description = product.Description,
                    Price = product.Price,
                    StockQuantity = product.StockQuantity,
                    ImageUrl = product.ImageUrl,
                    DateAdded = product.DateAdded,
                    IsActive = product.IsActive,
                    BrandId = product.BrandId,
                    SellerId = product.SellerId,
                    SubCategoryId = product.SubCategoryId
                });
            }
            public async Task<IEnumerable<ProductWithSellerDTO>> GetAllProductswithSellerAsync()
            {
                var productsWithSellers = await _productRepository.GetAllProductsWithSellersAsync();
                return productsWithSellers;
            }


            public async Task<ProductDTO> GetProductByIdAsync(int productId)
            {
                var product = await _productRepository.GetProductByIdAsync(productId);
                if (product == null)
                    throw new ProductNotFoundException("The Product Not Found");

                return new ProductDTO
                {
                    ProductId = product.ProductId,
                    ProductName = product.ProductName,
                    Description = product.Description,
                    Price = product.Price,
                    StockQuantity = product.StockQuantity,
                    ImageUrl = product.ImageUrl,
                    DateAdded = product.DateAdded,
                    IsActive = product.IsActive,
                    BrandId = product.BrandId,
                    SellerId = product.SellerId,
                    SubCategoryId = product.SubCategoryId
                };
            }

            public async Task<IEnumerable<ProductDTO>> GetProductsByNameAsync(string productName)
            {
                var products = await _productRepository.GetProductsByNameAsync(productName);
                if (!products.Any())
                    throw new ProductNotFoundException(productName);

                return products.Select(product => new ProductDTO
                {
                    ProductId = product.ProductId,
                    ProductName = product.ProductName,
                    Description = product.Description,
                    Price = product.Price,
                    StockQuantity = product.StockQuantity,
                    ImageUrl = product.ImageUrl,
                    DateAdded = product.DateAdded,
                    IsActive = product.IsActive,
                    BrandId = product.BrandId,
                    SellerId = product.SellerId,
                    SubCategoryId = product.SubCategoryId

                });
            }

            public async Task<int> AddProductAsync(ProductDTO productDto)
            {
                var product = new Product
                {
                    ProductName = productDto.ProductName,
                    SellerId = productDto.SellerId,
                    Description = productDto.Description,
                    Price = productDto.Price,
                    StockQuantity = productDto.StockQuantity,
                    ImageUrl = productDto.ImageUrl,
                    DateAdded = productDto.DateAdded,
                    IsActive = true,
                    BrandId = productDto.BrandId,
                    SubCategoryId = productDto.SubCategoryId
                };

                var inventory = new Inventory
                {
                    QuantityInStock = productDto.StockQuantity,
                    ReorderLevel = 10,
                    LastRestockedDate = productDto.DateAdded
                };

                int newProductId = await _productRepository.AddProductAsync(product, inventory);
                return newProductId;
            }

            public async Task UpdateProductAsync(ProductDTO productDto)
            {
                var product = new Product
                {
                    ProductId = productDto.ProductId,
                    SellerId= productDto.SellerId,
                    ProductName = productDto.ProductName,
                    Description = productDto.Description,
                    Price = productDto.Price,
                    StockQuantity = productDto.StockQuantity,
                    ImageUrl = productDto.ImageUrl,
                    DateAdded = DateTime.Now,
                    IsActive = productDto.IsActive,
                    BrandId = productDto.BrandId,
                    SubCategoryId = productDto.SubCategoryId
                };

                var inventory = new Inventory
                {
                    QuantityInStock = productDto.StockQuantity,
                    ReorderLevel = 10,
                };

                await _productRepository.UpdateProductAsync(product, inventory);
            }

            public async Task DeleteProductAsync(int productId)
            {
                await _productRepository.DeleteProductAsync(productId);
            }
            public async Task<IEnumerable<SellerProductDTO>> GetProductsBySellerIdAsync(int sellerId)
            {
                return await _productRepository.GetProductsBySellerIdAsync(sellerId);
            }

            public async Task<ProductDetailsDTO> GetProductDetailsFull(int productId)
            {
                return await _productRepository.GetProductDetailsFull(productId);
            }
        }
    }

}
