using Ecomlib.Models.UserManagemnt;
using EcomQuitQ.Data;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Linq;

public static class ApplicationDbSeeder
{
    public static void Seed(AppDbContext context)
    {
        if (!context.Users.Any(u => u.Email == "admin1@quitq.in"))
        {
            var adminUser = new User
            {
                Username = "admin@1",
                Email = "admin1@quitq.in",
                IsActive = true,
                Role = UserRole.Admin,
                DateCreated = DateTime.UtcNow
            };
            adminUser.PasswordHash = BCrypt.Net.BCrypt.HashPassword("Admin@1");

            context.Users.Add(adminUser);
            context.SaveChanges();
        }

        if (!context.Users.Any(u => u.Email == "admin2@quitq.in"))
        {
            var adminUser = new User
            {
                Username = "admin@2",
                Email = "admin2@quitq.in",
                IsActive = true,
                Role = UserRole.Admin,
                DateCreated = DateTime.UtcNow
            };
            adminUser.PasswordHash = BCrypt.Net.BCrypt.HashPassword("Admin@2");

            context.Users.Add(adminUser);
            context.SaveChanges();
        }
    }

}
