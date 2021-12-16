using Microsoft.AspNetCore.Mvc;
using TalhaMarket.Core.Helpers;
using TalhaMarket.Model;
using TalhaMarket.Model.Products;
using TalhaMarket.Service.Pagination;
using TalhaMarket.Service.Product;

namespace TalhaMarket.API.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class Task4Controller : ControllerBase
    {
        private readonly IProductService _productService;
        private readonly IPaginationService _pagination;
        public Task4Controller(IProductService productService, IPaginationService paginationService)
        {
            _productService = productService;
            _pagination = paginationService;
        }

        //from query olarak istek atınız. Task4/Page?pageSize=10&pageNumber=2 gibi
        [HttpGet("Page")]
        public Pagination<ListProductModel> GetPage([FromQuery] int pageSize, [FromQuery] int pageNumber)
        {
            Pagination<ListProductModel> response = new();
            response = _pagination.GetPage(pageSize, pageNumber);
            return response;
        }
        //from query olarak istek atınız. Task4/Sort?sortName=DisplayName&type=False gibi //type false ise çoktan aza, true azdan çoka
        [HttpGet("Sort")]
        public FilterSort<ListProductModel> Sorting([FromQuery]  string sortName, [FromQuery] bool type)
        {
            FilterSort<ListProductModel> response = new();
            response = _pagination.Sorting(sortName, type);
            return response;
        }
        //from query olarak istek atınız. Task4/Filter?filterName=Stock&type=1&filterItem=2000 gibi
        //type 0 üstünde, 1 altında 2 eşit demektir. stok miktarı 2000 in altında olan ürünler
        [HttpGet("Filter")]
        public FilterSort<ListProductModel> Filter(string filterName, filterEnum type, string filterItem)
        {
            FilterSort<ListProductModel> response = new();
            response = _pagination.Filter(filterName, type,filterItem);
            return response;
        }
    }
}