using EcomLib.Dtos.AnalyticsDtos;
using System.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using EcomQuitQ.Data;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EcomLib.Repository.AnalyticsRepository.SalesAnalytics
{
    using System.Data;
    using System.Data.SqlClient;
    using Microsoft.Extensions.Configuration;

    public class SalesAnalyticsRepository: ISalesAnalyticsRepository
    {
        private readonly string _connectionString;

        public SalesAnalyticsRepository(IConfiguration configuration)
        {
            _connectionString = configuration.GetConnectionString("DefaultConnection");
        }

        public List<SalesByCategoryDto> GetSalesByCategory()
        {
            var result = new List<SalesByCategoryDto>();

            using (SqlConnection conn = new SqlConnection(_connectionString))
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand("GetSalesByCategory", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            var dto = new SalesByCategoryDto
                            {
                                CategoryName = reader["CategoryName"].ToString(),
                                TotalSales = Convert.ToDecimal(reader["TotalSales"])
                            };
                            result.Add(dto);
                        }
                    }
                }
            }
            return result;
        }

        public List<SalesByProductDto> GetSalesByProduct()
        {
            var result = new List<SalesByProductDto>();

            using (SqlConnection conn = new SqlConnection(_connectionString))
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand("GetSalesByProduct", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            var dto = new SalesByProductDto
                            {
                                ProductName = reader["ProductName"].ToString(),
                                TotalSales = Convert.ToDecimal(reader["TotalSales"])
                            };
                            result.Add(dto);
                        }
                    }
                }
            }
            return result;
        }

        public List<SalesBySellerDto> GetSalesBySeller()
        {
            var result = new List<SalesBySellerDto>();

            using (SqlConnection conn = new SqlConnection(_connectionString))
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand("GetSalesBySeller", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            var dto = new SalesBySellerDto
                            {
                                SellerName = reader["SellerName"].ToString(),
                                TotalSales = Convert.ToDecimal(reader["TotalSales"])
                            };
                            result.Add(dto);
                        }
                    }
                }
            }
            return result;
        }

        public List<DailySalesDto> GetDailySales()
        {
            var result = new List<DailySalesDto>();

            using (SqlConnection conn = new SqlConnection(_connectionString))
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand("GetDailySales", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            var dto = new DailySalesDto
                            {
                                Date = Convert.ToDateTime(reader["Date"]),
                                TotalSales = Convert.ToDecimal(reader["TotalSales"])
                            };
                            result.Add(dto);
                        }
                    }
                }
            }
            return result;
        }

        public List<SalesByProductDto> GetTopSellingProducts()
        {
            var result = new List<SalesByProductDto>();

            using (SqlConnection conn = new SqlConnection(_connectionString))
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand("GetTopSellingProducts", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            var dto = new SalesByProductDto
                            {
                                ProductName = reader["ProductName"].ToString(),
                                TotalSales = Convert.ToDecimal(reader["TotalSales"])
                            };
                            result.Add(dto);
                        }
                    }
                }
            }
            return result;
        }
    }



}
