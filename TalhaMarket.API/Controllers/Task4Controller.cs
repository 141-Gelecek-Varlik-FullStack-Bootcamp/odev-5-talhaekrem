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
        public Pagination<ListProductModel> GetPage(int pageSize, int pageNumber)
        {
            Pagination<ListProductModel> response = new();
            response = _pagination.GetPage(pageSize, pageNumber);
            return response;
        }
        //from query olarak istek atınız. Task4/Sort?sortName=DisplayName&type=False gibi //type false ise çoktan aza, true azdan çoka
        [HttpGet("Sort")]
        public FilterSort<ListProductModel> Sorting(string sortName, bool type)
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
            response = _pagination.Filter(filterName, type, filterItem);
            return response;
        }

        //from query olarak istek atınız Task4/Products?filterName=Price&type=0&filterItem=1000&sortName=Stock&sortType=True&pageSize=5&pageNumber=2 gibi
        //Fiyatı 1000 liranın üstünde olan ürünleri Stockuna göre artan şeklinde sırala. Her sayfada 5 ürün olsun ve 2. sayfayı getir.
        [HttpGet("Products")]
        public Pagination<ListProductModel> FilterSortPaging(string filterName, filterEnum type, string filterItem, string sortName, bool sortType, int pageSize, int pageNumber)
        {
            Pagination<ListProductModel> response = new();
            response = _pagination.FilterSortPaging(filterName, type, filterItem, sortName, sortType, pageSize, pageNumber);
            return response;
        }

    }
}