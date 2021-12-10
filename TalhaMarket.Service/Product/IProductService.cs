using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TalhaMarket.Model;
using TalhaMarket.Model.Products;

namespace TalhaMarket.Service.Product
{
    public interface IProductService
    {
        General<ProductModel> Insert(ProductModel newProduct, int userId);
        General<ProductModel> Update(int id,ProductModel updateProduct, int userId);
        void Delete(int id);
        List<ProductModel> GetAll();
        ProductModel GetProduct(int id);
    }
}
