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
        public void Delete(int id)
        {
            using (var _context = new TalhaMarketContext())
            {
                var categoru = _context.Category.Where(u => u.Id == id).SingleOrDefault();
                categoru.IsActive = false;
                categoru.IsDeleted = true;
                _context.SaveChanges();
            }
        }

        public List<CategoryModel> GetAll()
        {
            using (var _context = new TalhaMarketContext())
            {
                var categories = _context.Category.ToList();
                List<CategoryModel> result = _mapper.Map<List<TalhaMarket.DB.Entities.Category>, List<CategoryModel>>(categories);
                return result;
            }
        }

        public CategoryModel GetCategory(int id)
        {
            using (var _context = new TalhaMarketContext())
            {
                var category = _context.Category.Where(u => u.Id == id).SingleOrDefault();
                var result = _mapper.Map<CategoryModel>(category);
                return result;
            }
        }

        public General<CategoryModel> Insert(CategoryModel newCategory, int userId)
        {
            var result = new General<CategoryModel>()
            {
                isSuccess = false
            };
            var model = _mapper.Map<TalhaMarket.DB.Entities.Category>(newCategory);
            using (var _context = new TalhaMarketContext())
            {
                model.InsertDate = DateTime.Now;
                model.InsertedUser= userId;
                model.IsActive = true;
                model.IsDeleted = false;
                _context.Category.Add(model);
                _context.SaveChanges();
                result.isSuccess = true;
                result.Entity = _mapper.Map<CategoryModel>(model);
            }
            return result;
        }

        public General<CategoryModel> Update(int id,CategoryModel updateCategory, int userId)
        {
            var result = new General<CategoryModel>()
            {
                isSuccess = false
            };
            var model = _mapper.Map<TalhaMarket.DB.Entities.Category>(updateCategory);
            using (var _context = new TalhaMarketContext())
            {
                var category = _context.Category.SingleOrDefault(u => u.Id == id);
                category.Name = model.Name;
                category.DisplayName = model.DisplayName;
                category.UpdateDate = DateTime.Now;
                category.UpdatedUser = userId;
                _context.SaveChanges();
                result.isSuccess = true;
                result.Entity = _mapper.Map<CategoryModel>(category);
            }
            return result;
        }
    }
}
