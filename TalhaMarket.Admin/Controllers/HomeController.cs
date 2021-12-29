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


        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}