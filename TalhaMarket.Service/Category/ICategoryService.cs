using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TalhaMarket.Model;
using TalhaMarket.Model.Categories;

namespace TalhaMarket.Service.Category
{
    public interface ICategoryService
    {
        General<CategoryModel> Insert(CategoryModel newCategory,int userId);
        General<CategoryModel> Update(int id,CategoryModel updateCategory,int userId);
        void Delete(int id);
        List<CategoryModel> GetAll();
        CategoryModel GetCategory(int id);
    }
}
