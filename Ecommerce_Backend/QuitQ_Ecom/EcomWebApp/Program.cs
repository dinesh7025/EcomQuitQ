
using EcomLib.JWT;
using EcomLib.Repository.AnalyticsRepository;
using EcomLib.Repository.AnalyticsRepository.NewFolder;
using EcomLib.Repository.AnalyticsRepository.SalesAnalytics;
using EcomLib.Repository.AnalyticsRepository.SellerAnalysis;
using EcomLib.Repository.CartRepository;
using EcomLib.Repository.CategoryRepository;
using EcomLib.Repository.DiscountRepository;
using EcomLib.Repository.Inventoryrepository;
using EcomLib.Repository.LoginRepository;
using EcomLib.Repository.OrderRepository;
using EcomLib.Repository.PaymentRepository;
using EcomLib.Repository.ProductRepository;
using EcomLib.Repository.ReviewRepository;
using EcomLib.Repository.UserRepository;
using EcomLib.Repository.WishListRepository;
using EcomLib.Service;
using EcomLib.Service.EcomLib.Services;
using EcomQuitQ.BusinessLogicLayer.UserRepository;
using EcomQuitQ.Data;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Models;
using System.Text;

namespace EcomWebApp
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var builder = WebApplication.CreateBuilder(args);
            // Add API Versioning
            builder.Services.AddApiVersioning(options =>
            {
                options.DefaultApiVersion = new ApiVersion(1, 0); // Set the default API version to 1.0
                options.AssumeDefaultVersionWhenUnspecified = true; // Assume the default version when not specified
                options.ReportApiVersions = true; // Report the API versions in response headers
            });

            builder.Services.AddCors(options =>
            {
                options.AddPolicy("AllowLocalhost",
                    builder => builder
                        .AllowAnyOrigin()
                        .AllowAnyMethod()
                        .AllowAnyHeader());
            });

            var key = builder.Configuration.GetValue<string>("ApiSettings:Secret");
            builder.Services.AddAuthentication(x =>
            {
                x.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
                x.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
            })
                .AddJwtBearer(x =>
                {
                    x.RequireHttpsMetadata = false;
                    x.SaveToken = true;
                    x.TokenValidationParameters = new TokenValidationParameters
                    {
                        ValidateLifetime = true,
                        ValidateIssuerSigningKey = true,
                        ValidateIssuer = true,
                        ValidateAudience = true,
                        ValidIssuer = "QuitQ.com",
                        ValidAudience = "QuitQ_Admin",

                        IssuerSigningKey = new SymmetricSecurityKey(Encoding.ASCII.GetBytes(key)),
                        RoleClaimType = "http://schemas.microsoft.com/ws/2008/06/identity/claims/role"

                    };
                });

            builder.Services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1", new OpenApiInfo
                {
                    Version = "v1",
                    Title = "EcomWebApp API",
                    Description = "API Version 1.0"
                });

                c.SwaggerDoc("v2", new OpenApiInfo
                {
                    Version = "v2",
                    Title = "EcomWebApp API",
                    Description = "API Version 2.0"
                });

                c.ResolveConflictingActions(apiDescriptions => apiDescriptions.First());
                c.AddSecurityDefinition("Bearer", new OpenApiSecurityScheme
                {
                    Description = "JWT Authorization header using the Bearer scheme (Example: 'Bearer 12345abcdef')",
                    Name = "Authorization",
                    In = ParameterLocation.Header,
                    Type = SecuritySchemeType.ApiKey,
                    Scheme = "Bearer"
                });

                c.AddSecurityRequirement(new OpenApiSecurityRequirement
                {
                    {
                        new OpenApiSecurityScheme
                        {
                            Reference = new OpenApiReference
                            {
                                Type = ReferenceType.SecurityScheme,
                                Id = "Bearer"
                            },
                            Scheme = "bearer",
                            Name = "Authorization",
                            In = ParameterLocation.Header
                        },
                        new List<string>()
                    }
                });
            });

            //Add DBContext Dependency
            builder.Services.AddDbContext<AppDbContext>(options =>
                    options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection")));
            //Add DI for email
            builder.Services.Configure<MailSettings>(builder.Configuration.GetSection("MailSettings"));
            builder.Services.AddTransient<EmailService>();

            // Add services to the container.
            builder.Services.AddScoped<UserService>(); 
            builder.Services.AddScoped<AuthService>();
            builder.Services.AddScoped<ProductService>();
            builder.Services.AddScoped<TokenGeneration>();
            builder.Services.AddScoped<CategoryService>();
            builder.Services.AddScoped<InventoryService>();
            builder.Services.AddScoped<CartService>();
            builder.Services.AddScoped<DiscountService>();
            builder.Services.AddScoped<ProductDiscountService>();
            builder.Services.AddScoped<OrderService>();
            builder.Services.AddScoped<ProductReviewService>();
            builder.Services.AddScoped<SalesAnalyticsService>();
            builder.Services.AddScoped<UserAnalyticsService>();
            builder.Services.AddScoped<WishlistService>();
            

            //Add  Repositories container
            builder.Services.AddScoped<IUserRepository, UserRepository>();
            builder.Services.AddScoped<IProductRepository, ProductRepository>();
            builder.Services.AddScoped<ILoginRepository, LoginRepository>();
            builder.Services.AddScoped<ICategoryRepository, CategoryRepository>();
            builder.Services.AddScoped<IInventoryRepository, InventoryRepository>();
            builder.Services.AddScoped<ICartRepository, CartRepository>();
            builder.Services.AddScoped<IDiscountRepository, DiscountRepository>();
            builder.Services.AddScoped<IProductDiscountRepository, ProductDiscountRepository>();
            builder.Services.AddScoped<IOrderRepository, OrderRepository>();
            builder.Services.AddScoped<IOrderItemRepository, OrderItemRepository>();
            builder.Services.AddScoped<IPaymentRepository, PaymentRepository>();
            builder.Services.AddScoped<IDiscountRepository, DiscountRepository>();
            builder.Services.AddScoped<IProductReviewRepository, ProductReviewRepository>();
            builder.Services.AddScoped<ISalesAnalyticsRepository, SalesAnalyticsRepository>();
            builder.Services.AddScoped<IUserAnalyticsRepository, UserAnalyticsRepository>();
            builder.Services.AddScoped<ISellerAnalysisRepository, SellerAnalysisRepository>();
            builder.Services.AddScoped<IWishlistRepository, WishlistRepository>();


            //Add Log4net
            var loggerRepository = log4net.LogManager.GetRepository(System.Reflection.Assembly.GetEntryAssembly());
            log4net.Config.XmlConfigurator.Configure(loggerRepository, new FileInfo("log4net.config"));

            builder.Services.AddControllers();
            // Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
            builder.Services.AddEndpointsApiExplorer();
            builder.Services.AddSwaggerGen();

            var app = builder.Build();

            // Apply any migrations and seed the database
            //using (var scope = app.Services.CreateScope())
            //{
            //    var context = scope.ServiceProvider.GetRequiredService<AppDbContext>();
            //    context.Database.Migrate();
            //    ApplicationDbSeeder.Seed(context);
            //}

            // Configure the HTTP request pipeline.
            if (app.Environment.IsDevelopment())
            {
                app.UseSwagger();
                app.UseSwaggerUI(c =>
                {
                    c.SwaggerEndpoint("/swagger/v1/swagger.json", "EcomWebApp API v1");
                    c.SwaggerEndpoint("/swagger/v2/swagger.json", "EcomWebApp API v2");
                });
            }
            else
            {
                app.UseExceptionHandler("/error");
            }
            app.UseStatusCodePages(async context =>
            {
                var response = context.HttpContext.Response;
                if (response.StatusCode == StatusCodes.Status403Forbidden)
                {
                    response.ContentType = "application/json";
                    await response.WriteAsync("{\"message\": \"You do not have permission to access this resource.\"}");
                }
                else if (response.StatusCode == StatusCodes.Status401Unauthorized)
                {
                    response.ContentType = "application/json";
                    await response.WriteAsync("{\"message\": \"You are not authenticated. Please log in.\"}");
                }
            });

            app.UseHttpsRedirection();
            app.UseCors("AllowLocalhost");
            app.UseAuthentication();    
            app.UseAuthorization();


            app.MapControllers();

            app.Run();
        }
    }
}