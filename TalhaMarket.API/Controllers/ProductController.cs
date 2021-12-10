using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
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
        [HttpGet]
        public List<ProductModel> GetAll()
        {
            return _productService.GetAll();
        }

        [HttpGet("{id}")]
        public ProductModel GetById(int id)
        {
            return _productService.GetProduct(id);
        }

        [HttpPost("{userId}")]
        public General<ProductModel> Insert([FromBody] ProductModel newProduct, int userId)
        {
            return _productService.Insert(newProduct, userId);
        }

        [HttpPut("{id}/{userId}")]
        public General<ProductModel> UpdateProduct(int id, [FromBody] ProductModel updateProduct, int userId)
        {
            return _productService.Update(id, updateProduct, userId);
        }
        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            _productService.Delete(id);
            return Ok();
        }
    }
}
