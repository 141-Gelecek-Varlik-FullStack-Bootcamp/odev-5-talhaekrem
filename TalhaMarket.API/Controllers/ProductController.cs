using Microsoft.AspNetCore.Mvc;
using TalhaMarket.API.Infrastructure;
using TalhaMarket.API.Services.CurrentUser;
using TalhaMarket.Model;
using TalhaMarket.Model.Products;
using TalhaMarket.Service.Product;

namespace TalhaMarket.API.Controllers
{
    [Route("api/[controller]s")]
    [ApiController]
    public class ProductController : ControllerBase
    {
        private readonly IProductService _productService;
        private readonly ICurrentUserService _currentUser;
        public ProductController(IProductService productService,ICurrentUserService currentUserService)
        {
            _productService = productService;
            _currentUser = currentUserService;
        }
        //Tüm ürünleri getir
        [HttpGet]
        public General<ListProductModel> GetAll()
        {
            General<ListProductModel> response = new();
            response = _productService.GetAll();
            return response;
        }

        //idye göre ürün getir
        [HttpGet("{id}")]
        public General<ProductDetailModel> GetById(int id)
        {
            General<ProductDetailModel> response = new();
            response = _productService.GetProduct(id);
            return response;
        }

        //ürün ekle veya güncelle. id varsa güncelle id yoksa ekle
        [HttpPost]
        [ServiceFilter(typeof(LoginFilter))]
        public General<ProductDetailModel> InsertUpdateProduct([FromBody] UpdateProductModel product)
        {
            General<ProductDetailModel> response = new();
            if (product is { Id: > 0 })
            {
                product.UpdatedUser = _currentUser.GetCurrentUser().Id;
                response = _productService.Update(product);
            }
            else
            {
                product.InsertedUser = _currentUser.GetCurrentUser().Id;
                response = _productService.Insert(product);
            }
            return response;
        }

        //ürün sil
        [HttpDelete("{id}")]
        [ServiceFilter(typeof(LoginFilter))]
        public General<bool> Delete(int id)
        {
            General<bool> response = new();
            response = _productService.Delete(id);
            return response;
        }
    }
}
