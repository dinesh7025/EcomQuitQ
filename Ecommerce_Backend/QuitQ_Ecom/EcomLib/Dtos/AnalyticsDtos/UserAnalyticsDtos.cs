using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EcomLib.Dtos.AnalyticsDtos
{
    public class TopActiveUserDto
    {
        public int UserId { get; set; }
        public string UserName { get; set; }
        public int PurchaseCount { get; set; }
    }
    public class UserActivityLogDto
    {
        public string Activity { get; set; }
        public string Date { get; set; }
        public string Details { get; set; }
    }
    public class TotalRegistrationsDto
    {
        public int TotalUsers { get; set; }
        public int TotalSellers { get; set; }
    }


}
