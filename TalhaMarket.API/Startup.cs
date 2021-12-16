using AutoMapper;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.OpenApi.Models;
using TalhaMarket.API.Infrastructure;
using TalhaMarket.Service.Category;
using TalhaMarket.Service.CurrentUser;
using TalhaMarket.Service.Pagination;
using TalhaMarket.Service.Product;
using TalhaMarket.Service.User;
namespace TalhaMarket.API
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        public void ConfigureServices(IServiceCollection services)
        {
            //mapper oluþturma ve configure etme. kendi classýmýzý söylüyoruz. hangi profili kullanacaðýný seçme
            var _mappingProfile = new MapperConfiguration(mp => { mp.AddProfile(new MappingProfile()); });
            //mapper objesini inject etmek için interfaceden kendi classýmýzdan oluþturduðumuz objeyi map için create ediyoruz.
            IMapper mapper = _mappingProfile.CreateMapper();
            //mapperý inject ediyoruz.
            services.AddSingleton(mapper);

            //injection kýsýmlarý
            services.AddTransient<IUserService,UserService>();
            services.AddTransient<ICategoryService, CategoryService>();
            services.AddTransient<IProductService, ProductService>();
            services.AddTransient<IPaginationService, PaginationManager>();

            services.AddScoped<LoginFilter>();
            services.AddSingleton<ICurrentUserService, CurrentUserManager>();


            services.AddControllers();
            //cache yapýsý
            services.AddMemoryCache();
            services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1", new OpenApiInfo { Title = "TalhaMarket.API", Version = "v1" });
            });
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
                app.UseSwagger();
                app.UseSwaggerUI(c => c.SwaggerEndpoint("/swagger/v1/swagger.json", "TalhaMarket.API v1"));
            }

            app.UseHttpsRedirection();

            app.UseRouting();

            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}
