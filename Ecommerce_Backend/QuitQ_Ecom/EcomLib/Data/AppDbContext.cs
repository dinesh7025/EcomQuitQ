
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Extensions.DependencyInjection;
using Ecomlib.Models.UserManagemnt;
using EcomLib.Models.Cartmanagement;
using EcomLib.Models.OrderManagement;
using EcomLib.Models.ProductManagment;
using EcomLib.Models;
using EcomQuitQ.Models;
using EcomLib.Models.DiscountManagement;

namespace EcomQuitQ.Data
{
    public class AppDbContext:DbContext
    {
        private readonly IConfiguration _configuration;

        //DBSets
        public DbSet<User> Users { get; set; }
        public DbSet<PersonalDetails> PersonalDetails { get; set; }
        public DbSet<SellerDetails> SellerDetails { get; set; }
        public DbSet<Address> Addresses { get; set; }
        public DbSet<Cart> Carts { get; set; }
        public DbSet<CartItem> CartItems { get; set; }
        public DbSet<Order> Orders { get; set; }
        public DbSet<OrderItem> OrderItems { get; set; }
        public DbSet<Product> Products { get; set; }
        public DbSet<Brand> Brands { get; set; }
        public DbSet<Payment> Payments { get; set; }
        public DbSet<ProductReview> ProductReviews { get; set; }
        public DbSet<Inventory> Inventories { get; set; }
        public DbSet<Discount> Discounts { get; set; }
        public DbSet<ProductDiscount> ProductDiscounts { get; set; }
        public DbSet<AuditLog> AuditLogs { get; set; }
        public DbSet<SubCategory> SubCategories { get; set; }
        public DbSet<ParentCategory> ParentCategories { get; set; }
        public DbSet<Wishlist> Wishlists { get; set; }

        public AppDbContext(DbContextOptions<AppDbContext> options, IConfiguration configuration)
            : base(options)
        {
            _configuration = configuration;
        }
        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options)
        {
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            //Define Key
            // Configure primary key for User
            modelBuilder.Entity<User>()
                .HasKey(u => u.UserId);

            // Configure primary key for PersonalDetails
            modelBuilder.Entity<PersonalDetails>()
                .HasKey(p => p.PersonalDetailsId);

            // Configure primary key for SellerDetails
            modelBuilder.Entity<SellerDetails>()
                .HasKey(s => s.SellerId);

            // Configure primary key for Address
            modelBuilder.Entity<Address>()
                .HasKey(a => a.AddressId);

            // Configure primary key for Cart
            modelBuilder.Entity<Cart>()
                .HasKey(c => c.CartId);

            // Configure primary key for CartItem
            modelBuilder.Entity<CartItem>()
                .HasKey(ci => ci.CartItemId);

            // Configure primary key for Order
            modelBuilder.Entity<Order>()
                .HasKey(o => o.OrderId);

            // Configure primary key for OrderItem
            modelBuilder.Entity<OrderItem>()
                .HasKey(oi => oi.OrderItemId);

            // Configure primary key for Payment
            modelBuilder.Entity<Payment>()
                .HasKey(p => p.PaymentId);

            // Configure primary key for ProductReview
            modelBuilder.Entity<ProductReview>()
                .HasKey(pr => pr.ReviewId);

            // Configure primary key for Inventory
            modelBuilder.Entity<Inventory>()
                .HasKey(i => i.InventoryId);

            // Configure primary key for Discount
            modelBuilder.Entity<Discount>()
                .HasKey(d => d.DiscountId);

            // Configure primary key for ProductDiscount
            modelBuilder.Entity<ProductDiscount>()
                .HasKey(pd => pd.ProductDiscountId);

            // Configure primary key for AuditLog
            modelBuilder.Entity<AuditLog>()
                .HasKey(a => a.LogId);

            // Configure primary key for Brand
            modelBuilder.Entity<Brand>()
                .HasKey(b => b.BrandId);

            //COnfigure for primary key for WishList
            modelBuilder.Entity<Wishlist>()
                .HasKey(b => b.WishlistId);

            // Relationships
            modelBuilder.Entity<User>()
                .HasOne(u => u.PersonalDetails)
                .WithOne(p => p.User)
                .HasForeignKey<PersonalDetails>(p => p.UserId);

            modelBuilder.Entity<User>()
                .HasOne(u => u.SellerDetails)
                .WithOne(s => s.User)
                .HasForeignKey<SellerDetails>(s => s.UserId);

            modelBuilder.Entity<User>()
                .HasOne(u => u.Address)
                .WithOne(a => a.User)
                .HasForeignKey<Address>(a => a.UserId);

            modelBuilder.Entity<Cart>()
                .HasOne(c => c.User)
                .WithMany(u => u.Carts)
                .HasForeignKey(c => c.UserId);

            modelBuilder.Entity<Cart>()
                .HasMany(c => c.CartItems)
                .WithOne(ci => ci.Cart)
                .HasForeignKey(ci => ci.CartId);

            modelBuilder.Entity<CartItem>()
                .HasOne(ci => ci.Product)
                .WithMany(p => p.CartItems)
                .HasForeignKey(ci => ci.ProductId);

            modelBuilder.Entity<Order>()
                .HasOne(o => o.User)
                .WithMany(u => u.Orders)
                .HasForeignKey(o => o.UserId);

            modelBuilder.Entity<Order>()
                .HasOne(o => o.ShippingAddress)
                .WithMany()
                .HasForeignKey(o => o.ShippingAddressId)
                .OnDelete(DeleteBehavior.Restrict);

            modelBuilder.Entity<Order>()
                .HasOne(o => o.BillingAddress)
                .WithMany()
                .HasForeignKey(o => o.BillingAddressId)
                .OnDelete(DeleteBehavior.Restrict);

            modelBuilder.Entity<Order>()
                .HasMany(o => o.OrderItems)
                .WithOne(oi => oi.Order)
                .HasForeignKey(oi => oi.OrderId);

            modelBuilder.Entity<OrderItem>()
                .HasOne(oi => oi.Product)
                .WithMany(p => p.OrderItems)
                .HasForeignKey(oi => oi.ProductId)
                .OnDelete(DeleteBehavior.Restrict); // No cascade delete
            modelBuilder.Entity<OrderItem>()
                .HasOne(oi => oi.Seller) // Assuming the navigation property in OrderItem is 'Seller'
                .WithMany() // No need for a collection property in User
                .HasForeignKey(oi => oi.SellerId)
                .OnDelete(DeleteBehavior.Restrict); // Prevent cascade delete on SellerId

            modelBuilder.Entity<Payment>()
                .HasOne(p => p.Order)
                .WithMany(o => o.Payments)
                .HasForeignKey(p => p.OrderId);

            modelBuilder.Entity<ProductReview>()
                .HasOne(pr => pr.Product)
                .WithMany(p => p.ProductReviews)
                .HasForeignKey(pr => pr.ProductId);

            modelBuilder.Entity<ProductReview>()
                .HasOne(pr => pr.User)
                .WithMany(u => u.ProductReviews)
                .HasForeignKey(pr => pr.UserId);

            modelBuilder.Entity<Inventory>()
                .HasOne(i => i.Product)
                .WithOne(p => p.Inventory)
                .HasForeignKey<Inventory>(i => i.ProductId);

            modelBuilder.Entity<ProductDiscount>()
                .HasOne(pd => pd.Product)
                .WithMany(p => p.ProductDiscounts)
                .HasForeignKey(pd => pd.ProductId);

            modelBuilder.Entity<ProductDiscount>()
                .HasOne(pd => pd.Discount)
                .WithMany(d => d.ProductDiscounts)
                .HasForeignKey(pd => pd.DiscountId);

            modelBuilder.Entity<SubCategory>()
                .HasOne(sc => sc.ParentCategory)
                .WithMany(pc => pc.SubCategories)
                .HasForeignKey(sc => sc.ParentCategoryId)
                .OnDelete(DeleteBehavior.Restrict);

            modelBuilder.Entity<Brand>()
                .HasMany(b => b.Products)
                .WithOne(p => p.Brand)
                .HasForeignKey(p => p.BrandId)
                .OnDelete(DeleteBehavior.Restrict);

            modelBuilder.Entity<Wishlist>()
                .HasOne(w => w.User)
                .WithMany(u => u.Wishlists)
                .HasForeignKey(w => w.UserId);

            modelBuilder.Entity<Wishlist>()
                .HasOne(w => w.Product)
                .WithMany(p => p.Wishlists)
                .HasForeignKey(w => w.ProductId);

            // Decimal precision configuration
            modelBuilder.Entity<Product>()
                .Property(p => p.Price)
                .HasColumnType("decimal(18,2)");

            modelBuilder.Entity<Order>()
                .Property(o => o.TotalAmount)
                .HasColumnType("decimal(18,2)");

            modelBuilder.Entity<Payment>()
                .Property(p => p.PaymentAmount)
                .HasColumnType("decimal(18,2)");

            base.OnModelCreating(modelBuilder);

        }

    }
}
