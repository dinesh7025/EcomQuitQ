using EcomLib.Dtos.AnalyticsDtos;
using EcomLib.Repository.AnalyticsRepository.NewFolder;
using EcomQuitQ.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EcomLib.Repository.AnalyticsRepository
{
    public class UserAnalyticsRepository : IUserAnalyticsRepository
    {
        private readonly AppDbContext _context;

        public UserAnalyticsRepository(AppDbContext context)
        {
            _context = context;
        }

        // Total user registrations
        public int GetTotalUserRegistrations()
        {
            return _context.Users.Count(u => u.Role == Ecomlib.Models.UserManagemnt.UserRole.User);
        }

        // Total seller registrations
        public int GetTotalSellerRegistrations()
        {
            return _context.Users.Count(u => u.Role == Ecomlib.Models.UserManagemnt.UserRole.Seller);
        }

        // Top N most active users based on number of purchases or interactions
        public List<TopActiveUserDto> GetTopActiveUsers(int topN)
        {
            var topActiveUsers = (from user in _context.Users
                                  join order in _context.Orders on user.UserId equals order.UserId
                                  group user by new { user.UserId, user.Username } into userGroup
                                  orderby userGroup.Count() descending
                                  select new TopActiveUserDto
                                  {
                                      UserId = userGroup.Key.UserId,
                                      UserName = userGroup.Key.Username,
                                      PurchaseCount = userGroup.Count()
                                  }).Take(topN).ToList();

            return topActiveUsers;
        }

        // Fetch user activity log from AuditLog table
        public List<UserActivityLogDto> GetUserActivityLog()
        {
            var activityLogs = (from log in _context.AuditLogs
                    
                                select new UserActivityLogDto
                                {
                                    Activity = log.Action,
                                    Date = log.Timestamp.ToLongDateString(),
                                    Details = log.Details
                                }).ToList();

            return activityLogs;
        }
    }

}
