using AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TalhaMarket.DB.Entities.TalhaMarketDbContext;
using TalhaMarket.Model;
using TalhaMarket.Model.Products;

namespace TalhaMarket.Service.Product
{
    public class ProductService : IProductService
    {
        private readonly IMapper _mapper;

        public ProductService(IMapper mapper)
        {
            _mapper = mapper;
        }
        public void Delete(int id)
        {
            using (var _context = new TalhaMarketContext())
            {
                var product = _context.Product.Where(u => u.Id == id).SingleOrDefault();
                product.IsActive = false;
                product.IsDeleted = true;
                _context.SaveChanges();
            }
        }

        public List<ProductModel> GetAll()
        {
            using (var _context = new TalhaMarketContext())
            {
                var products = _context.Product.ToList();
                List<ProductModel> result = _mapper.Map<List<TalhaMarket.DB.Entities.Product>, List<ProductModel>>(products);
                return result;
            }
        }

        public ProductModel GetProduct(int id)
        {
            using (var _context = new TalhaMarketContext())
            {
                var product = _context.Product.Where(u => u.Id == id).SingleOrDefault();
                var result = _mapper.Map<ProductModel>(product);
                return result;
            }
        }

        public General<ProductModel> Insert(ProductModel newProduct, int userId)
        {
            var result = new General<ProductModel>()
            {
                isSuccess = false
            };
            var model = _mapper.Map<TalhaMarket.DB.Entities.Product>(newProduct);
            using (var _context = new TalhaMarketContext())
            {
                model.InsertDate = DateTime.Now;
                model.InsertedUser = userId;
                model.IsActive = true;
                model.IsDeleted = false;
                _context.Product.Add(model);
                _context.SaveChanges();
                result.isSuccess = true;
                result.Entity = _mapper.Map<ProductModel>(model);
            }
            return result;
        }

        public General<ProductModel> Update(int id,ProductModel updateProduct, int userId)
        {
            var result = new General<ProductModel>()
            {
                isSuccess = false
            };
            var model = _mapper.Map<TalhaMarket.DB.Entities.Product>(updateProduct);
            using (var _context = new TalhaMarketContext())
            {
                var product = _context.Product.SingleOrDefault(u => u.Id == id);
                product.Name = model.Name;
                product.DisplayName = model.DisplayName;
                product.Description = model.Description;
                product.CategoryId = model.CategoryId;
                product.Price = model.Price;
                product.Stock = model.Stock;
                product.UpdateDate = DateTime.Now;
                product.UpdatedUser = userId;
                _context.SaveChanges();
                result.isSuccess = true;
                result.Entity = _mapper.Map<ProductModel>(product);
            }
            return result;
        }
    }
}
