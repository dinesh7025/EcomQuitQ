using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EcomLib.Dtos.CategoryDtos
{
    public class ParentCategoryDTO
    {
        public int ParentCategoryId { get; set; }
        public string CategoryName { get; set; }
        public string Description { get; set; }
    }

    public class SubCategoryDTO
    {
        public int SubCategoryId { get; set; }
        public int ParentCategoryId { get; set; }
        public string ParentcategoryName { get; set; }
        public string SubCategoryName { get; set; }
        public string Description { get; set; }
    }

    public class BrandDTO
    {
        public int BrandId { get; set; }
        public string BrandName { get; set; }
        public string Description { get; set; }
        public string LogoUrl { get; set; }
    }

}
