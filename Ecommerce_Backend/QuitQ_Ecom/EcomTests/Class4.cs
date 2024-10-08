using EcomLib.Models.ProductManagment;
using EcomLib.Models;
using EcomLib.Repository.DiscountRepository;
using EcomQuitQ.Data;
using Microsoft.EntityFrameworkCore;
using NUnit.Framework;
using System;
using System.Linq;
using System.Threading.Tasks;
using EcomLib.Models.DiscountManagement;

[TestFixture]
public class DiscountRepositoryTests
{
    private AppDbContext _context;
    private DiscountRepository _discountRepository;

    [SetUp]
    public void Setup()
    {
        // Configure the in-memory database
        var options = new DbContextOptionsBuilder<AppDbContext>()
            .UseInMemoryDatabase("TestDiscountDatabase")
            .Options;

        // Initialize the context and repository
        _context = new AppDbContext(options);
        _discountRepository = new DiscountRepository(_context);

        // Seed the database with test data
        var discount = new Discount
        {
            DiscountCode = "TESTCODE",
            Description = "Test discount",
            DiscountType = DiscountType.Percentage,
            DiscountValue = 10.0m,
            StartDate = DateTime.Now.AddDays(-1),
            EndDate = DateTime.Now.AddDays(10),
            IsActive = true
        };

        _context.Discounts.Add(discount);
        _context.SaveChanges();

        // Detach tracked entities to avoid conflicts in tests
        _context.ChangeTracker.Clear();
    }

    [Test]
    public async Task GetDiscountByCodeAsync_ReturnsDiscount_WhenCodeIsValid()
    {
        // Act
        var discount = await _discountRepository.GetDiscountByCodeAsync("TESTCODE");

        // Assert
        Assert.IsNotNull(discount);
        Assert.AreEqual("TESTCODE", discount.DiscountCode);
        Assert.AreEqual(DiscountType.Percentage, discount.DiscountType);
    }

    [Test]
    public async Task GetDiscountByCodeAsync_ReturnsNull_WhenCodeIsInvalid()
    {
        // Act
        var discount = await _discountRepository.GetDiscountByCodeAsync("INVALIDCODE");

        // Assert
        Assert.IsNull(discount);
    }

    [Test]
    public async Task CreateDiscountAsync_AddsDiscountSuccessfully()
    {
        // Arrange
        var newDiscount = new Discount
        {
            DiscountCode = "NEWCODE",
            Description = "New discount",
            DiscountType = DiscountType.FixedAmount,
            DiscountValue = 15.0m,
            StartDate = DateTime.Now.AddDays(-1),
            EndDate = DateTime.Now.AddDays(10),
            IsActive = true
        };

        // Act
        var createdDiscount = await _discountRepository.CreateDiscountAsync(newDiscount);

        // Assert
        var discountInDb = _context.Discounts.FirstOrDefault(d => d.DiscountCode == "NEWCODE");
        Assert.IsNotNull(discountInDb);
        Assert.AreEqual("NEWCODE", discountInDb.DiscountCode);
        Assert.AreEqual(DiscountType.FixedAmount, discountInDb.DiscountType);
    }

    [TearDown]
    public void TearDown()
    {
        _context.Database.EnsureDeleted(); // Clean up the database after tests
        _context.Dispose();
    }
}
