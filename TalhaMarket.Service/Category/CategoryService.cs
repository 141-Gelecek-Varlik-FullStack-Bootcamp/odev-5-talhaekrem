using AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TalhaMarket.DB.Entities.TalhaMarketDbContext;
using TalhaMarket.Model;
using TalhaMarket.Model.Categories;

namespace TalhaMarket.Service.Category
{
    public class CategoryService : ICategoryService
    {
        private readonly IMapper _mapper;
        public CategoryService(IMapper mapper)
        {
            _mapper = mapper;
        }
        //kategoriye ait CRUD işlemlerinin yapıldığı bölüm. _context ve linq işlemleriyle veritabanıyla ilişki kurulur.
        public General<CategoryListModel> GetAll()
        {
            var result = new General<CategoryListModel>() { isSuccess = false };
            using (var _context = new TalhaMarketContext())
            {
                var categories = _context.Category.ToList();
                List<CategoryListModel> categoryList = _mapper.Map<List<TalhaMarket.DB.Entities.Category>, List<CategoryListModel>>(categories);
                result.EntityList = categoryList;
            }
            if (result.EntityList is not null)
            {
                result.isSuccess = true;
                result.Message = "İşlem Başarılı.";
            }
            else
            {
                result.Message = "Listede kategori bulunmamaktadır. Lütfen kategori ekleyin.";
            }
            return result;
        }

        public General<CategoryDetailModel> GetCategory(int id)
        {
            var result = new General<CategoryDetailModel>() { isSuccess = false };
            using (var _context = new TalhaMarketContext())
            {
                var category = _context.Category.Where(p => p.Id == id).FirstOrDefault();
                result.Entity = _mapper.Map<CategoryDetailModel>(category);
            }
            if (result.Entity is not null)
            {
                result.isSuccess = true;
                result.Message = "İşlem Başarılı.";
            }
            else
            {
                result.Message = "Kategori Bulunamadı.";
            }
            return result;
        }

        public General<CategoryDetailModel> Insert(UpdateCategoryModel newCategory)
        {
            var result = new General<CategoryDetailModel>() { isSuccess = false };
            var model = _mapper.Map<TalhaMarket.DB.Entities.Category>(newCategory);
            using (var _context = new TalhaMarketContext())
            {
                model.InsertDate = DateTime.Now;
                model.InsertedUser = newCategory.InsertedUser;
                model.IsActive = true;
                _context.Category.Add(model);
                _context.SaveChanges();
                result.Entity = _mapper.Map<CategoryDetailModel>(model);
            }

            if (result.Entity is not null)
            {
                result.isSuccess = true;
                result.Message = "İşlem Başarılı.";
            }
            else
            {
                result.Message = "Kategori ekleme işlemi başarısız.";
            }
            return result;
        }

        public General<CategoryDetailModel> Update(UpdateCategoryModel updateCategory)
        {
            var result = new General<CategoryDetailModel>() { isSuccess = false };
            var model = _mapper.Map<TalhaMarket.DB.Entities.Category>(updateCategory);
            using (var _context = new TalhaMarketContext())
            {
                var category = _context.Category.SingleOrDefault(u => u.Id == updateCategory.Id);

                model.InsertedUser = category.InsertedUser;
                model.InsertDate = category.InsertDate;
                model.UpdateDate = DateTime.Now;
                _context.Entry(category).CurrentValues.SetValues(model);
                _context.SaveChanges();
                result.isSuccess = true;
                result.Entity = _mapper.Map<CategoryDetailModel>(category);
            }
            if (result.Entity is not null)
            {
                result.isSuccess = true;
                result.Message = "İşlem Başarılı.";
            }
            else
            {
                result.Message = "Kategori güncelleme işlemi başarısız.";
            }
            return result;
        }

        public General<bool> Delete(int id)
        {
            var result = new General<bool>() { isSuccess = false };
            string categoryName = "";
            using (var _context = new TalhaMarketContext())
            {
                var category = _context.Category.Where(u => u.Id == id).SingleOrDefault();
                categoryName = category.Name;
                category.IsActive = false;
                category.IsDeleted = true;
                _context.SaveChanges();
                result.isSuccess = true;
                result.Entity = true;
            }
            if (!result.isSuccess)
            {
                result.Message = String.Format("Kategori silme başarısız.'{0}' kategorisine ait ürün olmadığından emin olun.",categoryName);
            }
            else
            {
                result.Message = String.Format("Kategori silme başarılı. Silinen kategori Id:{0}", id);
            }
            return result;
        }
    }
}
