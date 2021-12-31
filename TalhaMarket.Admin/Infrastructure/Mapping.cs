using AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TalhaMarket.Admin.Models;
using TalhaMarket.DB.Entities;
using TalhaMarket.Model.Categories;
using TalhaMarket.Model.Products;
using TalhaMarket.Model.Users;

namespace TalhaMarket.Admin.Infrastructure
{
    public class Mapping : Profile
    {
        public Mapping()
        {
            CreateMap<RegisterViewModel, InsertUserModel>();
            CreateMap<ProductDetailModel, UpdateProductModel>();
            CreateMap<CategoryDetailModel, UpdateCategoryModel>();
            CreateMap<UserDetailModel, InsertUserModel>();
            CreateMap<UserDetailModel, UpdateUserModel>();
        }
    }
}
