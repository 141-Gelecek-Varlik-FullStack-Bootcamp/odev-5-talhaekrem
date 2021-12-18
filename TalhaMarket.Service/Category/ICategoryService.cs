using TalhaMarket.Model;
using TalhaMarket.Model.Categories;

namespace TalhaMarket.Service.Category
{
    public interface ICategoryService
    {
        General<CategoryListModel> GetAll();
        General<CategoryDetailModel> GetCategory(int id);
        General<CategoryDetailModel> Insert(UpdateCategoryModel newCategory);
        General<CategoryDetailModel> Update(UpdateCategoryModel updateCategory);
        General<bool> Delete(int id);
    }
}