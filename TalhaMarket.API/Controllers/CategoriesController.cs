using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
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
        public List<CategoryModel> GetAll()
        {
            return _categoryService.GetAll();
        }

        [HttpGet("{id}")]
        public CategoryModel GetById(int id)
        {
            return _categoryService.GetCategory(id);
        }

        [HttpPost("{userId}")]
        public General<CategoryModel> Insert([FromBody] CategoryModel newCategory, int userId)
        {
            return _categoryService.Insert(newCategory, userId);
        }

        [HttpPut("{id}/{userId}")]
        public General<CategoryModel> UpdateCategory(int id, [FromBody] CategoryModel updateCategory, int userId)
        {
            return _categoryService.Update(id, updateCategory, userId);
        }
        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            _categoryService.Delete(id);
            return Ok();
        }
    }
}
