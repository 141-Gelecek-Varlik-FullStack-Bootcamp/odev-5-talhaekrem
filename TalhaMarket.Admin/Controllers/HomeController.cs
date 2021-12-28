using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;
using TalhaMarket.Admin.Models;
using TalhaMarket.BackgroundJob.Schedules;
using TalhaMarket.Service.Category;
using TalhaMarket.Service.MailSender;
using TalhaMarket.Service.Product;
using TalhaMarket.Service.User;

namespace TalhaMarket.Admin.Controllers
{
    [Authorize]
    public class HomeController : Controller
    {
        private readonly IUserService _userService;
        public HomeController(IUserService userService)
        {
            _userService = userService;
        }

        public IActionResult Index()
        {
            string userName = HttpContext.User.Identity.Name;
            HomeViewModel model = new()
            {
                name = _userService.GetAll().EntityList.Where(u => u.UserName == userName).FirstOrDefault().Name
            };
            return View(model);
        }

        [Authorize]
        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}

//using (var client = new HttpClient())
//{
//    //try
//    //{
//    //    HttpResponseMessage resp = await client.GetAsync("https://localhost:44336/Products");
//    //    resp.EnsureSuccessStatusCode();
//    //    string responseBody = await resp.Content.ReadAsStringAsync();
//    //    HomeAdminViewModel model = new()
//    //    {
//    //        test = responseBody
//    //    };
//    //    return View(model);
//    //}
//    //catch (HttpRequestException e)
//    //{
//    //    TempData["ErrorMessage"] = $"Bir hata oluştu.\n {e.Message}";
//    //}
//    //client.BaseAddress = new Uri("http://localhost:64189/");
//    ////HTTP GET
//    //var responseTask = client.GetAsync("Products");
//    //responseTask.Wait();

//    //var result = responseTask.Result;

//    //if (result.IsSuccessStatusCode)
//    //{
//    //    var readTask = result.Content.ReadAsStringAsync<HomeAdminViewModel>();
//    //    readTask.Wait();

//    //    products = readTask.Result;
//    //}
//    //else
//    //{
//    //    products = Enumerable.Empty<HomeAdminViewModel>();

//    //    ModelState.AddModelError(string.Empty, "Server error. Please contact administrator.");

//    //}
//}