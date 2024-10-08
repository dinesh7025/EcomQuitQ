using EcomLib.Dtos.AnalyticsDtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EcomLib.Repository.AnalyticsRepository.NewFolder
{
    public interface IUserAnalyticsRepository
    {
        int GetTotalUserRegistrations();
        int GetTotalSellerRegistrations();
        List<TopActiveUserDto> GetTopActiveUsers(int topN);
        List<UserActivityLogDto> GetUserActivityLog();

    }
}
