using EcomLib.Dtos.AnalyticsDtos;
using EcomLib.Repository.AnalyticsRepository.NewFolder;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EcomLib.Service
{
    public class UserAnalyticsService
    {
        private readonly IUserAnalyticsRepository _analyticsRepository;

        public UserAnalyticsService(IUserAnalyticsRepository analyticsRepository)
        {
            _analyticsRepository = analyticsRepository;
        }

        public int GetTotalUserRegistrations()
        {
            return _analyticsRepository.GetTotalUserRegistrations();
        }

        public int GetTotalSellerRegistrations()
        {
            return _analyticsRepository.GetTotalSellerRegistrations();
        }

        public List<TopActiveUserDto> GetTopActiveUsers(int topN)
        {
            return _analyticsRepository.GetTopActiveUsers(topN);
        }

        public List<UserActivityLogDto> GetUserActivityLog()
        {
            return _analyticsRepository.GetUserActivityLog();
        }
    }

}
