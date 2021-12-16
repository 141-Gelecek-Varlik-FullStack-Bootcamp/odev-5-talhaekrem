using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TalhaMarket.Model.Categories
{
    public class CategoryDetailModel
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string DisplayName { get; set; }
        public bool IsActive { get; set; }
        public bool IsDeleted { get; set; }
        public int InsertedUser { get; set; }
        public DateTime InsertDate { get; set; }
        public int? UpdatedUser { get; set; }
        public DateTime? UpdateDate { get; set; }
    }
}
