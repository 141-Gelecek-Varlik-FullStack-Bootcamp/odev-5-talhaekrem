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
            //api katmanı için map işlemleri
            //user
            CreateMap<UserDetailModel, User>();
            CreateMap<User, UserDetailModel>();
            CreateMap<UserModel, User>();
            CreateMap<User, UserModel>();
            CreateMap<UpdateUserModel, User>();


            //product
            //get all
            CreateMap<Product, ListProductModel>();
            //get by id
            CreateMap<Product, ProductDetailModel>();
            CreateMap<ProductDetailModel, Product>();
            //insert
            CreateMap<InsertProductModel, Product>();
            //update
            CreateMap<UpdateProductModel, Product>();

            //category
            CreateMap<Category, CategoryListModel>();
            CreateMap<Category, CategoryDetailModel>();
            CreateMap<CategoryDetailModel, Category>();
            CreateMap<CategoryListModel, Category>();
            CreateMap<UpdateCategoryModel, Category>();

        }
    }
}
