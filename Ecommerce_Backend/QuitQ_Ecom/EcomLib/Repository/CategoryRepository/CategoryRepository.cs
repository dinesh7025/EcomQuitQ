using EcomLib.Dtos.CategoryDtos;
using EcomLib.Exceptionhandling;
using EcomLib.Models.ProductManagment;
using EcomQuitQ.Data;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EcomLib.Repository.CategoryRepository
{
    public class CategoryRepository : ICategoryRepository
    {
        private readonly AppDbContext _context;

        public CategoryRepository(AppDbContext context)
        {
            _context = context;
        }

        // ParentCategory Methods
        public async Task<int> AddParentCategoryAsync(ParentCategoryDTO parentCategoryDTO)
        {
            var existingCategory = await _context.ParentCategories
                .FirstOrDefaultAsync(c => c.CategoryName == parentCategoryDTO.CategoryName);

            if (existingCategory != null)
            {
                throw new ItemAlreadyExistsException("Parent Category Already Exists");
            }

            var parentCategory = new ParentCategory
            {
                CategoryName = parentCategoryDTO.CategoryName,
                Description = parentCategoryDTO.Description
            };

            _context.ParentCategories.Add(parentCategory);
            await _context.SaveChangesAsync();
            return parentCategory.ParentCategoryId;
        }


        public async Task<ParentCategoryDTO> GetParentCategoryByIdAsync(int parentCategoryId)
        {
            var parentCategory = await _context.ParentCategories
                .FirstOrDefaultAsync(pc => pc.ParentCategoryId == parentCategoryId);

            if (parentCategory == null)
            {
                throw new CategoryNotFoundException("Parent Category not Found with this ID");
            }

            return new ParentCategoryDTO
            {
                ParentCategoryId = parentCategory.ParentCategoryId,
                CategoryName = parentCategory.CategoryName,
                Description = parentCategory.Description
            };
        }

        public async Task<IEnumerable<ParentCategoryDTO>> GetAllParentCategoriesAsync()
        {
            return await _context.ParentCategories
                .Select(pc => new ParentCategoryDTO
                {
                    ParentCategoryId = pc.ParentCategoryId,
                    CategoryName = pc.CategoryName,
                    Description = pc.Description
                })
                .ToListAsync();
        }

        public async Task<ParentCategoryDTO> UpdateParentCategoryAsync(ParentCategoryDTO parentCategoryDTO)
        {
            var parentCategory = await _context.ParentCategories
                .FindAsync(parentCategoryDTO.ParentCategoryId);

            if (parentCategory == null)
            {
                throw new CategoryNotFoundException("Parent Category not Found with this ID");
            }

            parentCategory.CategoryName = parentCategoryDTO.CategoryName;
            parentCategory.Description = parentCategoryDTO.Description;

            await _context.SaveChangesAsync();
            return parentCategoryDTO;
        }

        public async Task<bool> DeleteParentCategoryAsync(int parentCategoryId)
        {
            var parentCategory = await _context.ParentCategories
                .FindAsync(parentCategoryId);

            if (parentCategory == null)
            {
                throw new CategoryNotFoundException("Parent Category not Found with this ID");
            }

            _context.ParentCategories.Remove(parentCategory);
            await _context.SaveChangesAsync();
            return true;
        }

        // SubCategory Methods
        public async Task<int> AddSubCategoryAsync(SubCategoryDTO subCategoryDTO)
        {
            var existingSubCategory = await _context.SubCategories
                .FirstOrDefaultAsync(sc => sc.SubCategoryName == subCategoryDTO.SubCategoryName &&
                                           sc.ParentCategoryId == subCategoryDTO.ParentCategoryId);

            if (existingSubCategory != null)
            {
                throw new ItemAlreadyExistsException("Sub Category Already Exists");
            }

            var subCategory = new SubCategory
            {
                SubCategoryName = subCategoryDTO.SubCategoryName,
                Description = subCategoryDTO.Description,
                ParentCategoryId = subCategoryDTO.ParentCategoryId
            };

            _context.SubCategories.Add(subCategory);
            await _context.SaveChangesAsync();
            return subCategory.SubCategoryId;
        }


        public async Task<SubCategoryDTO> GetSubCategoryByIdAsync(int subCategoryId)
        {
            var subCategory = await _context.SubCategories
                .FirstOrDefaultAsync(sc => sc.SubCategoryId == subCategoryId);

            if (subCategory == null)
            {
                throw new CategoryNotFoundException("Sub Category not Found with this ID");
            }

            return new SubCategoryDTO
            {
                SubCategoryId = subCategory.SubCategoryId,
                ParentCategoryId = subCategory.ParentCategoryId,
                SubCategoryName = subCategory.SubCategoryName,
                Description = subCategory.Description
            };
        }

        public async Task<IEnumerable<SubCategoryDTO>> GetAllSubCategoriesAsync()
        {
            return await _context.SubCategories.Include(sc => sc.ParentCategory)
                .Select(sc => new SubCategoryDTO
                {
                    SubCategoryId = sc.SubCategoryId,
                    ParentCategoryId = sc.ParentCategoryId,
                    ParentcategoryName = sc.ParentCategory.CategoryName,
                    SubCategoryName = sc.SubCategoryName,
                    Description = sc.Description
                })
                .ToListAsync();
        }

        public async Task<IEnumerable<SubCategoryDTO>> GetSubCategoriesByParentIdAsync(int parentCategoryId)
        {
            return await _context.SubCategories
                .Where(sc => sc.ParentCategoryId == parentCategoryId)
                .Select(sc => new SubCategoryDTO
                {
                    SubCategoryId = sc.SubCategoryId,
                    ParentCategoryId = sc.ParentCategoryId,
                    SubCategoryName = sc.SubCategoryName,
                    Description = sc.Description
                })
                .ToListAsync();
        }

        public async Task<SubCategoryDTO> UpdateSubCategoryAsync(SubCategoryDTO subCategoryDTO)
        {
            var subCategory = await _context.SubCategories
                .FindAsync(subCategoryDTO.SubCategoryId);

            if (subCategory == null)
            {
                throw new CategoryNotFoundException("Sub Category not Found with this ID");
            }

            subCategory.ParentCategoryId = subCategoryDTO.ParentCategoryId;
            subCategory.SubCategoryName = subCategoryDTO.SubCategoryName;
            subCategory.Description = subCategoryDTO.Description;

            await _context.SaveChangesAsync();
            return subCategoryDTO;
        }

        public async Task<bool> DeleteSubCategoryAsync(int subCategoryId)
        {
            var subCategory = await _context.SubCategories
                .FindAsync(subCategoryId);

            if (subCategory == null)
            {
                throw new CategoryNotFoundException("Sub Category not Found with this ID");
            }

            _context.SubCategories.Remove(subCategory);
            await _context.SaveChangesAsync();
            return true;
        }

        // Brand Methods
        public async Task<int> AddBrandAsync(BrandDTO brandDTO)
        {
            var existingBrand = await _context.Brands
                .FirstOrDefaultAsync(b => b.BrandName == brandDTO.BrandName);

            if (existingBrand != null)
            {
                throw new ItemAlreadyExistsException("Brand Already Exists");
            }

            var brand = new Brand
            {
                BrandName = brandDTO.BrandName,
                Description = brandDTO.Description,
                LogoUrl = brandDTO.LogoUrl,
            };

            _context.Brands.Add(brand);
            await _context.SaveChangesAsync();
            return brand.BrandId;
        }

    public async Task<BrandDTO> GetBrandByIdAsync(int brandId)
        {
            var brand = await _context.Brands
                .FirstOrDefaultAsync(b => b.BrandId == brandId);

            if (brand == null)
            {
                throw new BrandNotFoundException("Brand not Found with this ID");
            }

            return new BrandDTO
            {
                BrandId = brand.BrandId,
                BrandName = brand.BrandName,
                Description = brand.Description,
                LogoUrl = brand.LogoUrl
            };
        }

        public async Task<IEnumerable<BrandDTO>> GetAllBrandsAsync()
        {
            return await _context.Brands
                .Select(b => new BrandDTO
                {
                    BrandId = b.BrandId,
                    BrandName = b.BrandName,
                    Description = b.Description,
                    LogoUrl = b.LogoUrl
                })
                .ToListAsync();
        }

        public async Task<BrandDTO> GetBrandByNameAsync(string brandName)
        {
            var brand = await _context.Brands
                .FirstOrDefaultAsync(b => b.BrandName == brandName);

            if (brand == null)
            {
                throw new BrandNotFoundException("Brand not Found with this ID");
            }

            return new BrandDTO
            {
                BrandId = brand.BrandId,
                BrandName = brand.BrandName,
                Description = brand.Description,
                LogoUrl = brand.LogoUrl
            };
        }

        public async Task<BrandDTO> UpdateBrandAsync(BrandDTO brandDTO)
        {
            var brand = await _context.Brands
                .FindAsync(brandDTO.BrandId);

            if (brand == null)
            {
                throw new BrandNotFoundException("Brand not Found with this ID");
            }

            brand.BrandName = brandDTO.BrandName;
            brand.Description = brandDTO.Description;
            brand.LogoUrl = brandDTO.LogoUrl;

            await _context.SaveChangesAsync();
            return brandDTO;
        }

        public async Task<bool> DeleteBrandAsync(int brandId)
        {
            var brand = await _context.Brands
                .FindAsync(brandId);

            if (brand == null)
            {
                throw new BrandNotFoundException("Brand not Found with this ID");
            }

            _context.Brands.Remove(brand);
            await _context.SaveChangesAsync();
            return true;
        }
    }

}
