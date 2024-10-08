using EcomLib.Dtos.CategoryDtos;
using EcomLib.Exceptionhandling;
using log4net;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authorization;

namespace EcomWebApp.Controllers
{
 
    [ApiController]
    [Route("api/[controller]")]
    public class CategoryController : ControllerBase
    {
        private readonly CategoryService _categoryService;
        private static readonly ILog log = LogManager.GetLogger(typeof(CategoryController));

        public CategoryController(CategoryService categoryService)
        {
            _categoryService = categoryService;
        }


        [Authorize(Roles = "Admin")]
        // ParentCategory Endpoints
        [HttpPost("Add-parent-category")]
        public async Task<IActionResult> AddParentCategory(ParentCategoryDTO parentCategoryDTO)
        {
            try
            {
                log.Info("AddParentCategory initiated");
                var id = await _categoryService.AddParentCategoryAsync(parentCategoryDTO);
                log.Info($"ParentCategory added with ID: {id}");
                return Ok(new { ParentCategoryId = id });
            }
            catch (ItemAlreadyExistsException ex)
            {
                log.Error("AddParentCategory failed: " + ex.Message);
                return Conflict(ex.Message);
            }
            catch (Exception ex)
            {
                log.Error("AddParentCategory failed: " + ex.Message);
                return StatusCode(500, "Internal Server Error");
            }
        }

        [HttpGet("parent-category/{id}")]
        public async Task<IActionResult> GetParentCategoryById(int id)
        {
            try
            {
                log.Info($"GetParentCategoryById initiated for ID: {id}");
                var category = await _categoryService.GetParentCategoryByIdAsync(id);
                return Ok(category);
            }
            catch (CategoryNotFoundException ex)
            {
                log.Error("GetParentCategoryById failed: " + ex.Message);
                return NotFound(ex.Message);
            }
            catch (Exception ex)
            {
                log.Error("GetParentCategoryById failed: " + ex.Message);
                return StatusCode(500, "Internal Server Error");
            }
        }
        [HttpGet("All-parent-categories")]
        public async Task<IActionResult> GetAllParentCategories()
        {
            try
            {
                log.Info("GetAllParentCategories initiated");
                var categories = await _categoryService.GetAllParentCategoriesAsync();
                return Ok(categories);
            }
            catch (Exception ex)
            {
                log.Error("GetAllParentCategories failed: " + ex.Message);
                return StatusCode(500, "Internal Server Error");
            }
        }

        [Authorize(Roles = "Admin")]
        [HttpPut("update-parent-category")]
        public async Task<IActionResult> UpdateParentCategory(ParentCategoryDTO parentCategoryDTO)
        {
            try
            {
                log.Info("UpdateParentCategory initiated");
                var updatedCategory = await _categoryService.UpdateParentCategoryAsync(parentCategoryDTO);
                log.Info($"ParentCategory updated with ID: {updatedCategory.ParentCategoryId}");
                return Ok(updatedCategory);
            }
            catch (CategoryNotFoundException ex)
            {
                log.Error("UpdateParentCategory failed: " + ex.Message);
                return NotFound(ex.Message);
            }
            catch (Exception ex)
            {
                log.Error("UpdateParentCategory failed: " + ex.Message);
                return StatusCode(500, "Internal Server Error");
            }
        }
        [Authorize(Roles = "Admin")]
        [HttpDelete("parent-category/{id}")]
        public async Task<IActionResult> DeleteParentCategory(int id)
        {
            try
            {
                log.Info($"DeleteParentCategory initiated for ID: {id}");
                var result = await _categoryService.DeleteParentCategoryAsync(id);
                if (result)
                {
                    log.Info($"ParentCategory deleted with ID: {id}");
                    return NoContent();
                }
                return StatusCode(500, "Failed to delete Parent Category");
            }
            catch (CategoryNotFoundException ex)
            {
                log.Error("DeleteParentCategory failed: " + ex.Message);
                return NotFound(ex.Message);
            }
            catch (Exception ex)
            {
                log.Error("DeleteParentCategory failed: " + ex.Message);
                return StatusCode(500, "Internal Server Error");
            }
        }

        // SubCategory Endpoints
        [Authorize(Roles = "Admin")]
        [HttpPost("Add-sub-category")]
        public async Task<IActionResult> AddSubCategory(SubCategoryDTO subCategoryDTO)
        {
            try
            {
                log.Info("AddSubCategory initiated");
                var id = await _categoryService.AddSubCategoryAsync(subCategoryDTO);
                log.Info($"SubCategory added with ID: {id}");
                return Ok(new { SubCategoryId = id });
            }
            catch (ItemAlreadyExistsException ex)
            {
                log.Error("AddSubCategory failed: " + ex.Message);
                return Conflict(ex.Message);
            }
            catch (Exception ex)
            {
                log.Error("AddSubCategory failed: " + ex.Message);
                return StatusCode(500, "Internal Server Error");
            }
        }

        [HttpGet("sub-category/{id}")]
        public async Task<IActionResult> GetSubCategoryById(int id)
        {
            try
            {
                log.Info($"GetSubCategoryById initiated for ID: {id}");
                var subCategory = await _categoryService.GetSubCategoryByIdAsync(id);
                return Ok(subCategory);
            }
            catch (CategoryNotFoundException ex)
            {
                log.Error("GetSubCategoryById failed: " + ex.Message);
                return NotFound(ex.Message);
            }
            catch (Exception ex)
            {
                log.Error("GetSubCategoryById failed: " + ex.Message);
                return StatusCode(500, "Internal Server Error");
            }
        }

        [HttpGet("sub-categories")]
        public async Task<IActionResult> GetAllSubCategories()
        {
            try
            {
                log.Info("GetAllSubCategories initiated");
                var subCategories = await _categoryService.GetAllSubCategoriesAsync();
                return Ok(subCategories);
            }
            catch (Exception ex)
            {
                log.Error("GetAllSubCategories failed: " + ex.Message);
                return StatusCode(500, "Internal Server Error");
            }
        }

        [HttpGet("sub-categories/parent/{parentId}")]
        public async Task<IActionResult> GetSubCategoriesByParentId(int parentId)
        {
            try
            {
                log.Info($"GetSubCategoriesByParentId initiated for ParentCategoryID: {parentId}");
                var subCategories = await _categoryService.GetSubCategoriesByParentIdAsync(parentId);
                return Ok(subCategories);
            }
            catch (Exception ex)
            {
                log.Error("GetSubCategoriesByParentId failed: " + ex.Message);
                return StatusCode(500, "Internal Server Error");
            }
        }

        [Authorize(Roles = "Admin")]
        [HttpPut("sub-category")]
        public async Task<IActionResult> UpdateSubCategory(SubCategoryDTO subCategoryDTO)
        {
            try
            {
                log.Info("UpdateSubCategory initiated");
                var updatedSubCategory = await _categoryService.UpdateSubCategoryAsync(subCategoryDTO);
                log.Info($"SubCategory updated with ID: {updatedSubCategory.SubCategoryId}");
                return Ok(updatedSubCategory);
            }
            catch (CategoryNotFoundException ex)
            {
                log.Error("UpdateSubCategory failed: " + ex.Message);
                return NotFound(ex.Message);
            }
            catch (Exception ex)
            {
                log.Error("UpdateSubCategory failed: " + ex.Message);
                return StatusCode(500, "Internal Server Error");
            }
        }

        [Authorize(Roles = "Admin")]
        [HttpDelete("sub-category/{id}")]
        public async Task<IActionResult> DeleteSubCategory(int id)
        {
            try
            {
                log.Info($"DeleteSubCategory initiated for ID: {id}");
                var result = await _categoryService.DeleteSubCategoryAsync(id);
                if (result)
                {
                    log.Info($"SubCategory deleted with ID: {id}");
                    return NoContent();
                }
                return StatusCode(500, "Failed to delete Sub Category");
            }
            catch (CategoryNotFoundException ex)
            {
                log.Error("DeleteSubCategory failed: " + ex.Message);
                return NotFound(ex.Message);
            }
            catch (Exception ex)
            {
                log.Error("DeleteSubCategory failed: " + ex.Message);
                return StatusCode(500, "Internal Server Error");
            }
        }

        // Brand Endpoints
        [Authorize(Roles = "Admin")]
        [HttpPost("brand")]
        public async Task<IActionResult> AddBrand(BrandDTO brandDTO)
        {
            try
            {
                log.Info("AddBrand initiated");
                var id = await _categoryService.AddBrandAsync(brandDTO);
                log.Info($"Brand added with ID: {id}");
                return Ok(new { BrandId = id });
            }
            catch (ItemAlreadyExistsException ex)
            {
                log.Error("AddBrand failed: " + ex.Message);
                return Conflict(ex.Message);
            }
            catch (Exception ex)
            {
                log.Error("AddBrand failed: " + ex.Message);
                return StatusCode(500, "Internal Server Error");
            }
        }

        [HttpGet("brand/{id}")]
        public async Task<IActionResult> GetBrandById(int id)
        {
            try
            {
                log.Info($"GetBrandById initiated for ID: {id}");
                var brand = await _categoryService.GetBrandByIdAsync(id);
                return Ok(brand);
            }
            catch (BrandNotFoundException ex)
            {
                log.Error("GetBrandById failed: " + ex.Message);
                return NotFound(ex.Message);
            }
            catch (Exception ex)
            {
                log.Error("GetBrandById failed: " + ex.Message);
                return StatusCode(500, "Internal Server Error");
            }
        }

        [HttpGet("brands")]
        public async Task<IActionResult> GetAllBrands()
        {
            try
            {
                log.Info("GetAllBrands initiated");
                var brands = await _categoryService.GetAllBrandsAsync();
                return Ok(brands);
            }
            catch (Exception ex)
            {
                log.Error("GetAllBrands failed: " + ex.Message);
                return StatusCode(500, "Internal Server Error");
            }
        }
        [Authorize(Roles = "Admin")]
        [HttpPut("brand")]
        public async Task<IActionResult> UpdateBrand(BrandDTO brandDTO)
        {
            try
            {
                log.Info("UpdateBrand initiated");
                var updatedBrand = await _categoryService.UpdateBrandAsync(brandDTO);
                log.Info($"Brand updated with ID: {updatedBrand.BrandId}");
                return Ok(updatedBrand);
            }
            catch (BrandNotFoundException ex)
            {
                log.Error("UpdateBrand failed: " + ex.Message);
                return NotFound(ex.Message);
            }
            catch (Exception ex)
            {
                log.Error("UpdateBrand failed: " + ex.Message);
                return StatusCode(500, "Internal Server Error");
            }
        }
        [Authorize(Roles = "Admin")]
        [HttpDelete("brand/{id}")]
        public async Task<IActionResult> DeleteBrand(int id)
        {
            try
            {
                log.Info($"DeleteBrand initiated for ID: {id}");
                var result = await _categoryService.DeleteBrandAsync(id);
                if (result)
                {
                    log.Info($"Brand deleted with ID: {id}");
                    return NoContent();
                }
                return StatusCode(500, "Failed to delete Brand");
            }
            catch (BrandNotFoundException ex)
            {
                log.Error("DeleteBrand failed: " + ex.Message);
                return NotFound(ex.Message);
            }
            catch (Exception ex)
            {
                log.Error("DeleteBrand failed: " + ex.Message);
                return StatusCode(500, "Internal Server Error");
            }
        }
    }
}
