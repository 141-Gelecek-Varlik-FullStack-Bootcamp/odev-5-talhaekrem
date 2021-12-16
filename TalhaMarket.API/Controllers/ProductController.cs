using Microsoft.AspNetCore.Mvc;
using TalhaMarket.API.Infrastructure;
using TalhaMarket.Model;
using TalhaMarket.Model.Products;
using TalhaMarket.Service.Product;

namespace TalhaMarket.API.Controllers
{
    [Route("[controller]s")]
    [ApiController]
    public class ProductController : ControllerBase
    {
        private readonly IProductService _productService;
        public ProductController(IProductService productService)
        {
            _productService = productService;
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

        //ürün ekle
        [HttpPost]
        [ServiceFilter(typeof(LoginFilter))]
        public General<ProductDetailModel> Insert([FromBody] InsertProductModel newProduct)
        {
            General<ProductDetailModel> response = new();
            response = _productService.Insert(newProduct);
            return response;
        }

        //ürün güncelle
        [HttpPut("{id}")]
        [ServiceFilter(typeof(LoginFilter))]
        public General<ProductDetailModel> UpdateProduct(int id, [FromBody] UpdateProductModel updateProduct)
        {
            General<ProductDetailModel> response = new();
            response = _productService.Update(id, updateProduct);
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
