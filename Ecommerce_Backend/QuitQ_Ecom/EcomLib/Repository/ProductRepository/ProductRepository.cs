using EcomLib.Exceptionhandling;
using EcomLib.Models.ProductManagment;
using EcomLib.Models;
using EcomQuitQ.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using EcomLib.Dtos.ProductDtos;
using EcomLib.Dtos.OrderDtos;

namespace EcomLib.Repository.ProductRepository
{
    public class ProductRepository : IProductRepository
    {
        private readonly AppDbContext _context;

        public ProductRepository(AppDbContext context)
        {
            _context = context;
        }

        public async Task<IEnumerable<Product>> GetAllProductsAsync()
        {
            return await _context.Products.Include(p => p.Inventory)
                                          .Include(p => p.Brand)
                                          .Include(p => p.SubCategory)
                                          
                                          .ToListAsync();
        }

        public async Task<Product> GetProductByIdAsync(int productId)
        {
            var product = await _context.Products
                                        .Include(p => p.Inventory)
                                        .FirstOrDefaultAsync(p => p.ProductId == productId);

            if (product == null)
                throw new ProductNotFoundException("The Product Not Found");

            return product;
        }

        public async Task<IEnumerable<Product>> GetProductsByNameAsync(string productName)
        {
            var products = await _context.Products
                                         .Include(p => p.Inventory)
                                         .Where(p => p.ProductName.Contains(productName))
                                         .ToListAsync();

            if (!products.Any())
                throw new ProductNotFoundException(productName);

            return products;
        }

        public async Task<int> AddProductAsync(Product product, Inventory inventory)
        {
            _context.Products.Add(product);
            await _context.SaveChangesAsync();

            //Assign the creted product ID
            inventory.ProductId = product.ProductId;
            _context.Inventories.Add(inventory);

            await _context.SaveChangesAsync();
            return product.ProductId;
        }

        public async Task UpdateProductAsync(Product product, Inventory updatedInventory)
        {
            var existingProduct = await GetProductByIdAsync(product.ProductId);

            if (existingProduct == null)
                throw new ProductNotFoundException("The Product Not Found");

            // Update product fields
            existingProduct.ProductName = product.ProductName;
            existingProduct.Description = product.Description;
            existingProduct.Price = product.Price;
            existingProduct.StockQuantity = product.StockQuantity;
            existingProduct.ImageUrl = product.ImageUrl;
            existingProduct.BrandId = product.BrandId;
            existingProduct.SubCategoryId = product.SubCategoryId;
            existingProduct.IsActive = product.IsActive;
            existingProduct.DateAdded = product.DateAdded;

            // Update inventory fields
            existingProduct.Inventory.QuantityInStock = updatedInventory.QuantityInStock;
            existingProduct.Inventory.ReorderLevel = updatedInventory.ReorderLevel;

            await _context.SaveChangesAsync();
        }

        public async Task DeleteProductAsync(int productId)
        {
            var product = await GetProductByIdAsync(productId);
            if (product == null)
                throw new ProductNotFoundException("Product Not Found! Cannot Delete");

            _context.Products.Remove(product);
            _context.Inventories.Remove(product.Inventory);

            await _context.SaveChangesAsync();
        }

        public async Task<IEnumerable<ProductWithSellerDTO>> GetAllProductsWithSellersAsync()
        {
            return await (from product in _context.Products
                          join seller in _context.SellerDetails on product.SellerId equals seller.SellerId
                          select new ProductWithSellerDTO
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
                              SubCategoryId = product.SubCategoryId,
                              SellerId = seller.SellerId,
                              CompanyName = seller.CompanyName, 
                          }).ToListAsync();
        }

        public async Task UpdateProductQuantityAsync(int productId, int quantity)
        {
            var product = await GetProductByIdAsync(productId);
            if (product != null)
            {
                product.StockQuantity += quantity; // Decrease quantity when placing an order
                product.Inventory.QuantityInStock = product.StockQuantity;
                await _context.SaveChangesAsync();
            }
        }
        public async Task<IEnumerable<SellerProductDTO>> GetProductsBySellerIdAsync(int sellerId)
        {
            return await _context.Products
                .Where(p => p.SellerId == sellerId)
                .Include(p => p.Brand)        // Join with Brand to get BrandName
                .Include(p => p.Inventory)    // Join with Inventory to get RestockLevel, LastRestocked
                .Select(p => new SellerProductDTO
                {
                    ProductId = p.ProductId,
                    Name = p.ProductName,
                    SellerId = p.SellerId,
                    Description = p.Description,
                    Price = p.Price,
                    StockQuantity = p.StockQuantity,
                    ImageUrl = p.ImageUrl,
                    SubCategoryId = p.SubCategoryId,
                    BrandId = p.BrandId,
                    BrandName = p.Brand.BrandName, // Fetch BrandName using BrandId
                    IsActive = p.IsActive, // From Inventory table
                    RestockLevel = p.Inventory.ReorderLevel, // From Inventory table
                    LastRestocked = p.Inventory.LastRestockedDate // From Inventory table
                })
                .ToListAsync();
        }

        public async Task<ProductDetailsDTO> GetProductDetailsFull(int productId)
        {
            var product = await _context.Products
                .Include(p => p.Brand)
                .Include(p => p.Inventory)
                .Include(p => p.ProductReviews)
                .ThenInclude(r => r.User)
                .FirstOrDefaultAsync(p => p.ProductId == productId);

            if (product == null) return null;

            var productDetailsDto = new ProductDetailsDTO
            {
                ProductId = product.ProductId,
                ProductName = product.ProductName,
                BrandName = product.Brand?.BrandName ?? "Unknown",
                Price = product.Price,
                Description = product.Description,
                ImageUrl = product.ImageUrl,
                StockQuantity = product.Inventory?.QuantityInStock ?? 0,
                RestockLevel = product.Inventory?.ReorderLevel ?? 0,
                IsLowStock = (product.Inventory?.QuantityInStock ?? 0) <= (product.Inventory?.ReorderLevel ?? 0),
                Reviews = product.ProductReviews.Select(r => new ProductReviewDTO
                {
                    ReviewId = r.ReviewId,
                    UserId = r.UserId,
                    Username = r.User.Username,
                    Rating = r.Rating,
                    Comment = r.Comment,
                    ReviewDate = r.ReviewDate
                }).ToList()
            };

            return productDetailsDto;
        }

    }
}
