using EcomLib.Models;
using EcomLib.Models.ProductManagment;
using EcomLib.Repository.WishListRepository;
using EcomQuitQ.Data;
using Microsoft.EntityFrameworkCore;
using NUnit.Framework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

[TestFixture]
public class WishlistRepositoryTests
{
    private AppDbContext _context;
    private WishlistRepository _wishlistRepository;

    [SetUp]
    public void Setup()
    {
        // Configure the in-memory database
        var options = new DbContextOptionsBuilder<AppDbContext>()
            .UseInMemoryDatabase("TestWishlistDatabase")
            .Options;

        // Initialize the context and repository
        _context = new AppDbContext(options);
        _wishlistRepository = new WishlistRepository(_context);

        // Seed the database with test data
        var product = new Product
        {
            ProductId = 1,
            ProductName = "Test Product",
            Price = 99.99m,
            ImageUrl = "Image.jpg",
            Description = "Good product"
        };

        _context.Products.Add(product);
        _context.SaveChanges();

        // Detach tracked entities to avoid conflicts in tests
        _context.ChangeTracker.Clear();
    }

    [Test]
    public async Task AddToWishlist_AddsProductToUserWishlist()
    {
        // Act
        await _wishlistRepository.AddToWishlist(1, 1);

        // Assert
        var wishlistItem = _context.Wishlists.FirstOrDefault(w => w.UserId == 1 && w.ProductId == 1);
        Assert.IsNotNull(wishlistItem);
        Assert.AreEqual(1, wishlistItem.UserId);
        Assert.AreEqual(1, wishlistItem.ProductId);
    }

    [Test]
    public async Task GetUserWishlist_ReturnsCorrectWishlistItems()
    {
        // Arrange
        await _wishlistRepository.AddToWishlist(1, 1);

        // Act
        var wishlistItems = await _wishlistRepository.GetUserWishlist(1);

        // Assert
        Assert.IsNotNull(wishlistItems);
        Assert.AreEqual(1, wishlistItems.Count);
        Assert.AreEqual("Test Product", wishlistItems[0].ProductName);
        Assert.AreEqual(99.99m, wishlistItems[0].Price);
    }

    [Test]
    public async Task RemoveFromWishlist_RemovesItemSuccessfully()
    {
        // Arrange
        await _wishlistRepository.AddToWishlist(1, 1);

        // Act
        await _wishlistRepository.RemoveFromWishlist(1, 1);

        // Assert
        var wishlistItem = _context.Wishlists.FirstOrDefault(w => w.UserId == 1 && w.ProductId == 1);
        Assert.IsNull(wishlistItem); 
    }

    [Test]
    public async Task RemoveFromWishlist_DoesNothingIfItemDoesNotExist()
    {
        // Act
        await _wishlistRepository.RemoveFromWishlist(1, 2); 

        // Assert
        var wishlistCount = _context.Wishlists.Count();
        Assert.AreEqual(0, wishlistCount); 
    }

    [TearDown]
    public void TearDown()
    {
        _context.Database.EnsureDeleted(); 
        _context.Dispose();
    }
}
