using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using TalhaMarket.Admin.Models;
using TalhaMarket.Model.Categories;
using TalhaMarket.Service.Category;
using TalhaMarket.Service.User;

namespace TalhaMarket.Admin.Controllers
{
    public class CategoryController : Controller
    {
        private readonly ICategoryService _categoryService;
        private readonly IMapper _mapper;
        private readonly IUserService _userService;
        public CategoryController(ICategoryService categoryService, IMapper mapper, IUserService userService)
        {
            _categoryService = categoryService;
            _mapper = mapper;
            _userService = userService;
        }
        public IActionResult Index()
        {
            CategoryViewModel model = new()
            {
                Categories = _categoryService.GetAll()
            };
            return View(model);
        }

        public IActionResult Add()
        {
            CategoryViewModel model = new()
            {
                CategoryInsert = new Model.Categories.UpdateCategoryModel(),
            };
            return View(model);
        }

        [HttpPost]
        public IActionResult Add(CategoryViewModel model)
        {
            if (ModelState.IsValid)
            {
                var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
                model.CategoryInsert.InsertedUser = _userService.CurrentUserId(userId);
                _categoryService.Insert(model.CategoryInsert);
                TempData.Add("adminmessage", "Kategori başarıyla eklendi!");
            }
            //tempdata ekle
            return RedirectToAction("Add", "Category");
        }

        public IActionResult Update(int id)
        {
            CategoryDetailModel detail = _categoryService.GetCategory(id).Entity;
            CategoryViewModel model = new()
            {
                CategoryInsert = _mapper.Map<UpdateCategoryModel>(detail),
            };
            return View(model);
        }

        [HttpPost]
        public IActionResult Update(CategoryViewModel model)
        {
            if (ModelState.IsValid)
            {
                var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
                model.CategoryInsert.UpdatedUser = _userService.CurrentUserId(userId);
                _categoryService.Update(model.CategoryInsert);
                TempData.Add("adminmessage", "Kategori başarıyla güncellendi!");
            }
            return RedirectToAction("Update", "Category");
        }

        public IActionResult Delete(int id)
        {
            _categoryService.Delete(id);
            TempData.Add("adminmessage", "Kategori başarıyla silindi!");
            return RedirectToAction("Index", "Category");
        }
    }
}
