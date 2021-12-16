using System;
using System.Collections.Generic;

#nullable disable

namespace TalhaMarket.DB.Entities
{
    public partial class Category
    {
        public Category()
        {
            Product = new HashSet<Product>();
        }

        public int Id { get; set; }
        public string Name { get; set; }
        public string DisplayName { get; set; }
        public bool IsActive { get; set; }
        public bool IsDeleted { get; set; }
        public int InsertedUser { get; set; }
        public DateTime InsertDate { get; set; }
        public int? UpdatedUser { get; set; }
        public DateTime? UpdateDate { get; set; }

        public virtual User InsertedUserNavigation { get; set; }
        public virtual ICollection<Product> Product { get; set; }
    }
}
