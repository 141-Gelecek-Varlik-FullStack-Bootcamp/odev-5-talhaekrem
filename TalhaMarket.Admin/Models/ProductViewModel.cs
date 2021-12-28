using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TalhaMarket.Model;
using TalhaMarket.Model.Categories;
using TalhaMarket.Model.Products;

namespace TalhaMarket.Admin.Models
{
    public class ProductViewModel
    {
        //ürün listelemek için
        public General<ListProductModel> Products { get; set; }
        public General<CategoryListModel> Categories { get; set; }

        public UpdateProductModel ProductInsert { get; set; }
    }
}
