using AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TalhaMarket.DB.Entities.TalhaMarketDbContext;
using TalhaMarket.Model;
using TalhaMarket.Model.Products;
using TalhaMarket.Service.CurrentUser;

namespace TalhaMarket.Service.Product
{
    public class ProductService : IProductService
    {
        private readonly IMapper _mapper;
        private readonly ICurrentUserService _currentUser;
        public ProductService(IMapper mapper, ICurrentUserService currentUserService)
        {
            _mapper = mapper;
            _currentUser = currentUserService;
        }

        //Ürüne ait CRUD işlemlerinin yapıldığı bölüm. _context ve linq işlemleriyle veritabanıyla ilişki kurulur.
        //tüm ürünleri getir
        public General<ListProductModel> GetAll()
        {
            var result = new General<ListProductModel>() { isSuccess = false };
            using (var _context = new TalhaMarketContext())
            {
                var products = _context.Product.ToList();
                List<ListProductModel> productList = _mapper.Map<List<TalhaMarket.DB.Entities.Product>, List<ListProductModel>>(products);
                result.EntityList = productList;
            }
            if (result.EntityList is not null)
            {
                result.isSuccess = true;
                result.Message = "İşlem Başarılı.";
            }
            else
            {
                result.Message = "Listede ürün bulunmamaktadır. Lütfen ürün ekleyin.";
            }
            return result;
        }

        //idye göre seçiyi ürünü getir.
        public General<ProductDetailModel> GetProduct(int id)
        {
            var result = new General<ProductDetailModel>() { isSuccess = false };
            using (var _context = new TalhaMarketContext())
            {
                var product = _context.Product.Where(p => p.Id == id).FirstOrDefault();
                result.Entity = _mapper.Map<ProductDetailModel>(product);
            }
            if (result.Entity is not null)
            {
                result.isSuccess = true;
                result.Message = "İşlem Başarılı.";
            }
            else
            {
                result.Message = "Ürün Bulunamadı.";
            }
            return result;
        }

        //ürün ekle
        public General<ProductDetailModel> Insert(InsertProductModel newProduct)
        {
            var result = new General<ProductDetailModel>() { isSuccess = false };
            int currentUserId = _currentUser.GetCurrentUser().Id;
            var model = _mapper.Map<TalhaMarket.DB.Entities.Product>(newProduct);
            using (var _context = new TalhaMarketContext())
            {
                model.InsertDate = DateTime.Now;
                model.InsertedUser = currentUserId;
                _context.Product.Add(model);
                _context.SaveChanges();
                result.Entity = _mapper.Map<ProductDetailModel>(model);
                result.Entity.CategoryName = _context.Category.Where(c => c.Id == model.CategoryId).FirstOrDefault().DisplayName;
            }

            if (result.Entity is not null)
            {
                result.isSuccess = true;
                result.Message = "İşlem Başarılı.";
            }
            else
            {
                result.Message = "Ürün ekleme işlemi başarısız.";
            }
            return result;
        }

        //ürün güncelle
        public General<ProductDetailModel> Update(int id, UpdateProductModel updateProduct)
        {
            var result = new General<ProductDetailModel>() { isSuccess = false };
            int currentUserId = _currentUser.GetCurrentUser().Id;
            var model = _mapper.Map<TalhaMarket.DB.Entities.Product>(updateProduct);
            using (var _context = new TalhaMarketContext())
            {
                var product = _context.Product.SingleOrDefault(u => u.Id == id);
                product.CategoryId = model.CategoryId;
                product.Name = model.Name;
                product.DisplayName = model.DisplayName;
                product.Description = model.Description;
                product.Price = model.Price;
                product.Stock = model.Stock;
                product.IsActive = model.IsActive;
                product.IsDeleted = model.IsDeleted;
                product.UpdateDate = DateTime.Now;
                product.UpdatedUser = currentUserId;
                _context.SaveChanges();
                result.isSuccess = true;
                result.Entity = _mapper.Map<ProductDetailModel>(product);
            }
            if (result.Entity is not null)
            {
                result.isSuccess = true;
                result.Message = "İşlem Başarılı.";
            }
            else
            {
                result.Message = "Ürün güncelleme işlemi başarısız.";
            }
            return result;
        }

        //ürün sil(deaktif yap)
        public General<bool> Delete(int id)
        {
            var result = new General<bool>() { isSuccess = false };
            using (var _context = new TalhaMarketContext())
            {
                var product = _context.Product.Where(u => u.Id == id).SingleOrDefault();
                product.IsActive = false;
                product.IsDeleted = true;
                _context.SaveChanges();
                result.isSuccess = true;
                result.Entity = true;
            }
            if (!result.isSuccess)
            {
                result.Message = "Ürün silme başarısız.";
            }
            else
            {
                result.Message = String.Format("Ürün silme başarılı. Silinen ürün Id:{0}",id);
            }
            return result;
        }
    }
}
