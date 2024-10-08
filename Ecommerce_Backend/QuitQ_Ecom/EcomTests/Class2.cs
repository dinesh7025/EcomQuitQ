using EcomLib.Models.Cartmanagement;
using EcomLib.Repository.CartRepository;
using EcomQuitQ.Data;
using Microsoft.EntityFrameworkCore;
using NUnit.Framework;
using System.Linq;

[TestFixture]
public class CartRepositoryTests
{
    private AppDbContext _context;
    private CartRepository _cartRepository;

    [SetUp]
    public void Setup()
    {
        // Configure the in-memory database
        var options = new DbContextOptionsBuilder<AppDbContext>()
            .UseInMemoryDatabase("TestCartDatabase")
            .Options;

        // Initialize the context and repository
        _context = new AppDbContext(options);
        _cartRepository = new CartRepository(_context);

        // Seed the database with test data
        _context.Carts.Add(new Cart
        {
            CartId = 1,
            UserId = 1,
            IsActive = true,
            CartItems = new List<CartItem>
            {
                new CartItem
                {
                    CartItemId = 1,
                    ProductId = 1,
                    Quantity = 2
                }
            }
        });
        _context.SaveChanges();
    }

    [Test]
    public void GetCartByUserId_WithExistingUser_ReturnsCart()
    {
        // Act
        var cart = _cartRepository.GetCartByUserId(1);

        // Assert
        Assert.IsNotNull(cart);
        Assert.AreEqual(1, cart.UserId);
        Assert.AreEqual(1, cart.CartItems.Count);
    }

    [Test]
    public void GetCartByUserId_WithNonExistentUser_ReturnsNull()
    {
        // Act
        var cart = _cartRepository.GetCartByUserId(2);

        // Assert
        Assert.IsNull(cart);
    }

    [Test]
    public void AddToCart_AddsCartItemToDatabase()
    {
        // Arrange
        var cartItem = new CartItem
        {
            CartItemId = 2,
            ProductId = 2,
            Quantity = 1
        };

        // Act
        _cartRepository.AddToCart(cartItem);
        _cartRepository.Save(); // Save changes to the in-memory database

        // Assert
        var cartItemInDb = _context.CartItems.Find(2);
        Assert.IsNotNull(cartItemInDb);
        Assert.AreEqual(2, cartItemInDb.ProductId);
        Assert.AreEqual(1, cartItemInDb.Quantity);
    }

    [Test]
    public void UpdateCart_UpdatesCartInDatabase()
    {
        // Arrange
        var cart = _context.Carts.First();
        cart.IsActive = false;

        // Act
        _cartRepository.UpdateCart(cart);
        _cartRepository.Save(); // Save changes to the in-memory database

        // Assert
        var updatedCart = _context.Carts.Find(cart.CartId);
        Assert.IsNotNull(updatedCart);
        Assert.IsFalse(updatedCart.IsActive);
    }

    [Test]
    public void RemoveFromCart_RemovesCartItemFromDatabase()
    {
        // Arrange
        var cartItemId = 1; // The ID of the item to remove

        // Act
        _cartRepository.RemoveFromCart(cartItemId);
        _cartRepository.Save(); // Save changes to the in-memory database

        // Assert
        var cartItemInDb = _context.CartItems.Find(cartItemId);
        Assert.IsNull(cartItemInDb); // Item should be removed
    }

    [TearDown]
    public void TearDown()
    {
        _context.Database.EnsureDeleted(); // Clean up the database after tests
        _context.Dispose();
    }
}
