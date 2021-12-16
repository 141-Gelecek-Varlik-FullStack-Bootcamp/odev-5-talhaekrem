using TalhaMarket.Core.Helpers;
using TalhaMarket.Model;
using TalhaMarket.Model.Products;

namespace TalhaMarket.Service.Pagination
{
    public interface IPaginationService
    {
        Pagination<ListProductModel> GetPage(int PageSize, int pageNumber);
        FilterSort<ListProductModel> Sorting(string sortName, bool type);
        FilterSort<ListProductModel> Filter(string filterName, filterEnum type, string filterItem);

        Pagination<ListProductModel> FilterSortPaging(string filterName, filterEnum type, string filterItem, string sortName, bool sortType, int pageSize, int pageNumber);
    }
}
