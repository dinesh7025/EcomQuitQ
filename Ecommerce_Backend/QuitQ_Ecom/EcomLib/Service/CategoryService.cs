using EcomLib.Dtos.CategoryDtos;
using EcomLib.Repository.CategoryRepository;

public class CategoryService
{
    private readonly ICategoryRepository _categoryRepository;

    public CategoryService(ICategoryRepository categoryRepository)
    {
        _categoryRepository = categoryRepository;
    }

    // ParentCategory Methods
    public async Task<int> AddParentCategoryAsync(ParentCategoryDTO parentCategoryDTO)
    {
        return await _categoryRepository.AddParentCategoryAsync(parentCategoryDTO);
    }

    public async Task<ParentCategoryDTO> GetParentCategoryByIdAsync(int parentCategoryId)
    {
        return await _categoryRepository.GetParentCategoryByIdAsync(parentCategoryId);
    }

    public async Task<IEnumerable<ParentCategoryDTO>> GetAllParentCategoriesAsync()
    {
        return await _categoryRepository.GetAllParentCategoriesAsync();
    }

    public async Task<ParentCategoryDTO> UpdateParentCategoryAsync(ParentCategoryDTO parentCategoryDTO)
    {
        return await _categoryRepository.UpdateParentCategoryAsync(parentCategoryDTO);
    }

    public async Task<bool> DeleteParentCategoryAsync(int parentCategoryId)
    {
        return await _categoryRepository.DeleteParentCategoryAsync(parentCategoryId);
    }

    // SubCategory Methods
    public async Task<int> AddSubCategoryAsync(SubCategoryDTO subCategoryDTO)
    {
        return await _categoryRepository.AddSubCategoryAsync(subCategoryDTO);
    }

    public async Task<SubCategoryDTO> GetSubCategoryByIdAsync(int subCategoryId)
    {
        return await _categoryRepository.GetSubCategoryByIdAsync(subCategoryId);
    }

    public async Task<IEnumerable<SubCategoryDTO>> GetAllSubCategoriesAsync()
    {
        return await _categoryRepository.GetAllSubCategoriesAsync();
    }

    public async Task<IEnumerable<SubCategoryDTO>> GetSubCategoriesByParentIdAsync(int parentCategoryId)
    {
        return await _categoryRepository.GetSubCategoriesByParentIdAsync(parentCategoryId);
    }

    public async Task<SubCategoryDTO> UpdateSubCategoryAsync(SubCategoryDTO subCategoryDTO)
    {
        return await _categoryRepository.UpdateSubCategoryAsync(subCategoryDTO);
    }

    public async Task<bool> DeleteSubCategoryAsync(int subCategoryId)
    {
        return await _categoryRepository.DeleteSubCategoryAsync(subCategoryId);
    }

    // Brand Methods
    public async Task<int> AddBrandAsync(BrandDTO brandDTO)
    {
        return await _categoryRepository.AddBrandAsync(brandDTO);
    }

    public async Task<BrandDTO> GetBrandByIdAsync(int brandId)
    {
        return await _categoryRepository.GetBrandByIdAsync(brandId);
    }

    public async Task<IEnumerable<BrandDTO>> GetAllBrandsAsync()
    {
        return await _categoryRepository.GetAllBrandsAsync();
    }

    public async Task<BrandDTO> GetBrandByNameAsync(string brandName)
    {
        return await _categoryRepository.GetBrandByNameAsync(brandName);
    }

    public async Task<BrandDTO> UpdateBrandAsync(BrandDTO brandDTO)
    {
        return await _categoryRepository.UpdateBrandAsync(brandDTO);
    }

    public async Task<bool> DeleteBrandAsync(int brandId)
    {
        return await _categoryRepository.DeleteBrandAsync(brandId);
    }


}