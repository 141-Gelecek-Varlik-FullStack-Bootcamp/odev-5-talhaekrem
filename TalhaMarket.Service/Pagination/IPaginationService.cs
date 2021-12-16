using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
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
    }
}
