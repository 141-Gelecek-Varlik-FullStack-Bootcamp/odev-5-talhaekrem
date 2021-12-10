using AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TalhaMarket.DB.Entities;
using TalhaMarket.Model.Categories;
using TalhaMarket.Model.Products;
using TalhaMarket.Model.Users;

namespace TalhaMarket.API.Infrastructure
{
    public class MappingProfile : Profile
    {
        public MappingProfile()
        {
            //usermodeli-> usera
            //userı da-> usermodele mapliyoruz.
            CreateMap<UserModel, User>();
            CreateMap<User, UserModel>();

            CreateMap<CategoryModel, Category>();
            CreateMap<Category, CategoryModel>();

            CreateMap<ProductModel, Product>();
            CreateMap<Product, ProductModel>();
        }
    }
}
