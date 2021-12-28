using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using TalhaMarket.Admin.Models;
using TalhaMarket.Model.Products;
using TalhaMarket.Service.Category;
using TalhaMarket.Service.Product;
using TalhaMarket.Service.User;

namespace TalhaMarket.Admin.Controllers
{
    [Authorize]
    public class ProductController : Controller
    {
        private readonly IProductService _productService;
        private readonly ICategoryService _categoryService;
        private readonly IUserService _userService;
        private readonly IMapper _mapper;
        public ProductController(
            IProductService productService, 
            ICategoryService categoryService,
            IUserService userService,
            IMapper mapper)
        {
            _productService = productService;
            _categoryService = categoryService;
            _userService = userService;
            _mapper = mapper;
        }
        public IActionResult Index()
        {
            ProductViewModel model = new()
            {
                Products = _productService.GetAll(),
                Categories = _categoryService.GetAll()

            };
            return View(model);
        }

        public IActionResult Add()
        {
            ProductViewModel model = new()
            {
                ProductInsert = new Model.Products.UpdateProductModel(),
                Categories = _categoryService.GetAll()
            };
            return View(model);
        }

        [HttpPost]
        public IActionResult Add(ProductViewModel model)
        {
            if (ModelState.IsValid)
            {
                var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
                model.ProductInsert.InsertedUser = _userService.CurrentUserId(userId);
                _productService.Insert(model.ProductInsert);
                TempData.Add("adminmessage", "Ürün başarıyla eklendi!");
            }
            //tempdata ekle
            return RedirectToAction("Add", "Product");
        }


        public IActionResult Update(int id)
        {
            ProductDetailModel detail = _productService.GetProduct(id).Entity;
            ProductViewModel model = new()
            {
                ProductInsert = _mapper.Map<UpdateProductModel>(detail),
                Categories = _categoryService.GetAll()
            };
            return View(model);
        }

        [HttpPost]
        public IActionResult Update(ProductViewModel model)
        {
            if (ModelState.IsValid)
            {
                var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
                model.ProductInsert.UpdatedUser = _userService.CurrentUserId(userId);
                _productService.Update(model.ProductInsert);
                TempData.Add("adminmessage", "Ürün başarıyla güncellendi!");
            }
            return RedirectToAction("Update","Product");
        }

        public IActionResult DeleteProduct(int id)
        {
            _productService.Delete(id);
            TempData.Add("adminmessage", "Ürün başarıyla silindi!");
            return RedirectToAction("Index", "Product");
        }
    }
}
