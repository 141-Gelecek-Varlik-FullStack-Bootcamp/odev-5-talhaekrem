using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TalhaMarket.API.Infrastructure;
using TalhaMarket.API.Services.CurrentUser;
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
        private readonly ICurrentUserService _currentUser;
        public CategoriesController(ICategoryService categoryService, ICurrentUserService currentUserService)
        {
            _categoryService = categoryService;
            _currentUser = currentUserService;
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
        public General<CategoryDetailModel> InsertUpdateCategory([FromBody] UpdateCategoryModel category)
        {
            General<CategoryDetailModel> response = new();
            if (category is { Id: > 0 })
            {
                category.UpdatedUser = _currentUser.GetCurrentUser().Id;
                response = _categoryService.Update(category);
            }
            else
            {
                category.InsertedUser = _currentUser.GetCurrentUser().Id;
                response = _categoryService.Insert(category);
            }
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
