using EcomLib.Models.ProductManagment;
using EcomLib.Models;
using EcomLib.Repository.ProductRepository;
using EcomQuitQ.Data;
using Microsoft.EntityFrameworkCore;
using NUnit.Framework;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

[TestFixture]
public class ProductRepositoryTests
{
    private AppDbContext _context;
    private ProductRepository _productRepository;
    [SetUp]
    public void Setup()
    {
        // Configure the in-memory database
        var options = new DbContextOptionsBuilder<AppDbContext>()
            .UseInMemoryDatabase("TestProductDatabase")
            .Options;

        // Initialize the context and repository
        _context = new AppDbContext(options);
        _productRepository = new ProductRepository(_context);

        // Seed the database with test data
        var product = new Product
        {
            ProductName = "Test Product",
            StockQuantity = 10,
            BrandId = 1,
            SubCategoryId = 1,
            ImageUrl = "Image.jpg",
            Description = "good product",
            Inventory = new Inventory
            {
                QuantityInStock = 10
            }
        };

        _context.Products.Add(product);
        _context.SaveChanges();

        // Detach tracked entities to avoid conflicts in tests
        _context.ChangeTracker.Clear();
    }


    [Test]
    public async Task AddProductAsync_AddsProductAndInventory()
    {
        // Arrange
        var newProduct = new Product
        {
            // Do not set ProductId, let EF generate it automatically
            ProductName = "New Product",
            StockQuantity = 5,
            BrandId = 1,
            SubCategoryId = 1,
            ImageUrl = "Image.jpg",
            Description = "good product",
        };

        var inventory = new Inventory
        {
            QuantityInStock = 5
        };

        // Act
        var productId = await _productRepository.AddProductAsync(newProduct, inventory);

        // Assert
        // ProductId should now be auto-generated (2, since the first product has ID 1)
        Assert.AreEqual(2, productId);
    }


    [TearDown]
    public void TearDown()
    {
        _context.Database.EnsureDeleted(); // Clean up the database after tests
        _context.Dispose();
    }
}
