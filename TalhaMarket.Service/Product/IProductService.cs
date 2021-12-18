using TalhaMarket.Model;
using TalhaMarket.Model.Products;

namespace TalhaMarket.Service.Product
{
    public interface IProductService
    {
        General<ListProductModel> GetAll();
        General<ProductDetailModel> GetProduct(int id);
        General<ProductDetailModel> Insert(UpdateProductModel newProduct);
        General<ProductDetailModel> Update(UpdateProductModel updateProduct);
        General<bool> Delete(int id);
    }
}
