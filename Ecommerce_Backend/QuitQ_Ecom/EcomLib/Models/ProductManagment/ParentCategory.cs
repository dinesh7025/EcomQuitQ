using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EcomLib.Models.ProductManagment
{
    public class ParentCategory
    {
        public int ParentCategoryId { get; set; }
        public string CategoryName { get; set; }
        public string Description { get; set; }
        public ICollection<SubCategory> SubCategories { get; set; }
    }

}
