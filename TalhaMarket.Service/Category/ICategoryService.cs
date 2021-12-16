using TalhaMarket.Model;
using TalhaMarket.Model.Categories;

namespace TalhaMarket.Service.Category
{
    public interface ICategoryService
    {
        General<CategoryListModel> GetAll();
        General<CategoryDetailModel> GetCategory(int id);
        General<CategoryDetailModel> Insert(CategoryListModel newCategory);
        General<CategoryDetailModel> Update(int id, UpdateCategoryModel updateCategory);
        General<bool> Delete(int id);
    }
}