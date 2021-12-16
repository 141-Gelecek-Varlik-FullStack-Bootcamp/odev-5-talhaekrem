using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TalhaMarket.API.Infrastructure;
using TalhaMarket.Model;
using TalhaMarket.Model.Categories;
using TalhaMarket.Service.Category;

namespace TalhaMarket.API.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class CategoriesController : ControllerBase
    {
        private readonly ICategoryService _categoryService;
        public CategoriesController(ICategoryService categoryService)
        {
            _categoryService = categoryService;
        }

        [HttpGet]
        public General<CategoryListModel> GetAll()
        {
            General<CategoryListModel> response = new();
            response = _categoryService.GetAll();
            return response;
        }

        [HttpGet("{id}")]
        public General<CategoryDetailModel> GetById(int id)
        {
            General<CategoryDetailModel> response = new();
            response = _categoryService.GetCategory(id);
            return response;
        }

        [HttpPost]
        [ServiceFilter(typeof(LoginFilter))]
        public General<CategoryDetailModel> Insert([FromBody] CategoryListModel newCategory)
        {
            General<CategoryDetailModel> response = new();
            response = _categoryService.Insert(newCategory);
            return response;
        }

        [HttpPut("{id}")]
        [ServiceFilter(typeof(LoginFilter))]
        public General<CategoryDetailModel> UpdateCategory(int id, [FromBody] UpdateCategoryModel updateCategory)
        {
            General<CategoryDetailModel> response = new();
            response = _categoryService.Update(id, updateCategory);
            return response;
        }

        [HttpDelete("{id}")]
        [ServiceFilter(typeof(LoginFilter))]
        public General<bool> Delete(int id)
        {
            General<bool> response = new();
            response = _categoryService.Delete(id);
            return response;
        }
    }
}
