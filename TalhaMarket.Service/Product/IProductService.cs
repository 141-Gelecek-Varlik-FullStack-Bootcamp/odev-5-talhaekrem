using TalhaMarket.Model;
using TalhaMarket.Model.Products;

namespace TalhaMarket.Service.Product
{
    public interface IProductService
    {
        General<ListProductModel> GetAll();
        General<ProductDetailModel> GetProduct(int id);
        General<ProductDetailModel> Insert(InsertProductModel newProduct);
        General<ProductDetailModel> Update(int id, UpdateProductModel updateProduct);
        General<bool> Delete(int id);
    }
}
