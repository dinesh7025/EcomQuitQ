using EcomLib.Dtos.CategoryDtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EcomLib.Repository.CategoryRepository
{
    public interface ICategoryRepository
    {
        // ParentCategory Methods
        Task<int> AddParentCategoryAsync(ParentCategoryDTO parentCategoryDTO);
        Task<ParentCategoryDTO> GetParentCategoryByIdAsync(int parentCategoryId);
        Task<IEnumerable<ParentCategoryDTO>> GetAllParentCategoriesAsync();
        Task<ParentCategoryDTO> UpdateParentCategoryAsync(ParentCategoryDTO parentCategoryDTO);
        Task<bool> DeleteParentCategoryAsync(int parentCategoryId);

        // SubCategory Methods
        Task<int> AddSubCategoryAsync(SubCategoryDTO subCategoryDTO);
        Task<SubCategoryDTO> GetSubCategoryByIdAsync(int subCategoryId);
        Task<IEnumerable<SubCategoryDTO>> GetAllSubCategoriesAsync();
        Task<IEnumerable<SubCategoryDTO>> GetSubCategoriesByParentIdAsync(int parentCategoryId);
        Task<SubCategoryDTO> UpdateSubCategoryAsync(SubCategoryDTO subCategoryDTO);
        Task<bool> DeleteSubCategoryAsync(int subCategoryId);

        // Brand Methods
        Task<int> AddBrandAsync(BrandDTO brandDTO);
        Task<BrandDTO> GetBrandByIdAsync(int brandId);
        Task<IEnumerable<BrandDTO>> GetAllBrandsAsync();
        Task<BrandDTO> GetBrandByNameAsync(string brandName);
        Task<BrandDTO> UpdateBrandAsync(BrandDTO brandDTO);
        Task<bool> DeleteBrandAsync(int brandId);
    }

}
