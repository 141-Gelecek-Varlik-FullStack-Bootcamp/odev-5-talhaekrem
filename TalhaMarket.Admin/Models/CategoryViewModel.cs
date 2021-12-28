using TalhaMarket.Model;
using TalhaMarket.Model.Categories;

namespace TalhaMarket.Admin.Models
{
    public class CategoryViewModel
    {
        public General<CategoryListModel> Categories { get; set; }

        public UpdateCategoryModel CategoryInsert { get; set; }
    }
}
