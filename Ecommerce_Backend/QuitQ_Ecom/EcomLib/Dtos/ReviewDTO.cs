using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EcomLib.Dtos
{
    public class ReviewDTO
    {
        public int ProductId { get; set; }
        public int UserId { get; set; }
        public int Rating { get; set; } // 1 to 5
        public string Comment { get; set; }
    }

    public class ReviewResponseDTO
    {
        public int ReviewId { get; set; }
        public int ProductId { get; set; }
        public int UserId { get; set; }
        public string ProductName { get; set; }
        public string Username { get; set; }
        public int Rating { get; set; }
        public string Comment { get; set; }
        public DateTime ReviewDate { get; set; }
    }

}
