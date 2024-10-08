using Ecomlib.Models.UserManagemnt;
using EcomLib.Repository.LoginRepository;
using EcomLib.Repository.UserRepository;
using EcomQuitQ.Data;
using Microsoft.EntityFrameworkCore;
using Moq; // Import Moq
using NUnit.Framework;
using System.Threading.Tasks;

[TestFixture]
public class LoginRepositoryTests
{
    private AppDbContext _context;
    private LoginRepository _loginRepository;
    private Mock<IUserRepository> _userRepositoryMock; // Use a mock instead of the real IUserRepository

    [SetUp]
    public void Setup()
    {
        // Configure the in-memory database
        var options = new DbContextOptionsBuilder<AppDbContext>()
            .UseInMemoryDatabase("TestDatabase")
            .Options;

        // Initialize the context and repository
        _context = new AppDbContext(options);
        _userRepositoryMock = new Mock<IUserRepository>();
        _loginRepository = new LoginRepository(_context, _userRepositoryMock.Object);

        // Seed the database with test data
        _context.Users.Add(new User
        {
            UserId = 1,
            Username = "testuser",
            Email = "test@example.com",
            PasswordHash = BCrypt.Net.BCrypt.HashPassword("password"), // Store hashed password
            IsActive = true,
            Role = UserRole.User // Assuming Role is a string; adjust if necessary
        });
        _context.Users.Add(new User
        {
            UserId = 2,
            Username = "anotheruser",
            Email = "another@example.com",
            PasswordHash = BCrypt.Net.BCrypt.HashPassword("password123"),
            IsActive = true,
            Role = UserRole.Admin
        });
        _context.SaveChanges();
    }

    [Test]
    public async Task ValidateLoginAsync_WithValidCredentials_ReturnsTrue()
    {
        // Act
        var result = await _loginRepository.ValidateLoginAsync("testuser", "password");

        // Assert
        Assert.IsTrue(result);

        // Verify that LogUserAction was called
        _userRepositoryMock.Verify(repo => repo.LogUserAction(
            It.IsAny<int>(),
            $"{It.IsAny<string>()} Logged In",
            "Users",
            It.IsAny<int>(),
            It.IsAny<string>()), Times.Once);
    }

    [Test]
    public async Task ValidateLoginAsync_WithInvalidPassword_ReturnsFalse()
    {
        // Act
        var result = await _loginRepository.ValidateLoginAsync("testuser", "wrongpassword");

        // Assert
        Assert.IsFalse(result);

        // Verify that LogUserAction was called
        _userRepositoryMock.Verify(repo => repo.LogUserAction(
            1, // user ID
            $"{It.IsAny<string>()} Login Failed",
            "Users",
            It.IsAny<int>(),
            $"Failed login attempt with UserName: testuser."), Times.Once);
    }

    [Test]
    public async Task ValidateLoginAsync_WithNonExistentUser_ReturnsFalse()
    {
        // Act
        var result = await _loginRepository.ValidateLoginAsync("nonexistentuser", "password");

        // Assert
        Assert.IsFalse(result);

        // Verify that LogUserAction was not called
        _userRepositoryMock.Verify(repo => repo.LogUserAction(It.IsAny<int>(), It.IsAny<string>(), It.IsAny<string>(), It.IsAny<int>(), It.IsAny<string>()), Times.Never);
    }

    [Test]
    public async Task ValidateLoginAsync_WithInactiveUser_ReturnsFalse()
    {
        // Arrange
        _context.Users.Add(new User
        {
            UserId = 3,
            Username = "inactiveuser",
            Email = "inactive@example.com",
            PasswordHash = BCrypt.Net.BCrypt.HashPassword("password"),
            IsActive = false,
            Role = UserRole.User
        });
        await _context.SaveChangesAsync();

        // Act
        var result = await _loginRepository.ValidateLoginAsync("inactiveuser", "password");

        // Assert
        Assert.IsFalse(result);

        // Verify that LogUserAction was not called
        _userRepositoryMock.Verify(repo => repo.LogUserAction(It.IsAny<int>(), It.IsAny<string>(), It.IsAny<string>(), It.IsAny<int>(), It.IsAny<string>()), Times.Never);
    }

    [TearDown]
    public void TearDown()
    {
        _context.Database.EnsureDeleted(); // Clean up the database after tests
        _context.Dispose();
    }
}
