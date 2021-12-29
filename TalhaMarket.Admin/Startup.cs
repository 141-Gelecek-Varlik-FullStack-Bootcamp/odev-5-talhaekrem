using AutoMapper;
using Hangfire;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TalhaMarket.Admin.Entities;
using TalhaMarket.Admin.Infrastructure;
using TalhaMarket.API.Infrastructure;
using TalhaMarket.Service.Category;
using TalhaMarket.Service.MailSender;
using TalhaMarket.Service.Product;
using TalhaMarket.Service.User;

namespace TalhaMarket.Admin
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            //mapper oluþturma ve configure etme. kendi classýmýzý söylüyoruz. hangi profili kullanacaðýný seçme
            var _mappingProfile = new MapperConfiguration(mp => { mp.AddProfile(new MappingProfile()); mp.AddProfile(new Mapping()); });
            //mapper objesini inject etmek için interfaceden kendi classýmýzdan oluþturduðumuz objeyi map için create ediyoruz.
            IMapper mapper = _mappingProfile.CreateMapper();
            //mapperý inject ediyoruz.
            services.AddSingleton(mapper);

            services.AddScoped<IProductService, ProductService>();
            services.AddScoped<ICategoryService, CategoryService>();
            services.AddScoped<IUserService, UserService>();
            services.AddScoped<ICategoryService, CategoryService>();
            services.AddScoped<IMailService, MailManager>();

            services.AddControllersWithViews().AddRazorRuntimeCompilation();
            services.AddDbContext<CustomIdentityDbContext>(opt => opt.UseSqlServer(Configuration.GetConnectionString("DefaultConnection")));
            services.AddIdentity<CustomIdentityUser, CustomIdentityRole>().AddEntityFrameworkStores<CustomIdentityDbContext>().AddDefaultTokenProviders();

            //hangfire kurulumu için gerekli veritabaný baðlantýlarýný yapýyorum. ayrý bir databasede de tutulabilir.
            services.AddHangfire(x => x.UseSqlServerStorage("Server=TALHAEKREM;Database=TalhaMarket;Trusted_Connection=True;MultipleActiveResultSets=true"));
            services.AddHangfireServer();
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                app.UseExceptionHandler("/Home/Error");
                // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
                app.UseHsts();
            }
            app.UseHttpsRedirection();
            app.UseStaticFiles();
            app.UseRouting();

            app.UseAuthentication();
            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllerRoute(
                    name: "default",
                    pattern: "{controller=Home}/{action=Index}/{id?}");
            });
            //hangfire arayüzü. /hangfire ile giriþ yapabilirsiniz.
            //app.UseHangfireDashboard();


        }
    }
}
