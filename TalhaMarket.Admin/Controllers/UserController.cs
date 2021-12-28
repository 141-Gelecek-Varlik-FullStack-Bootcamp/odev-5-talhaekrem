using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TalhaMarket.Admin.Models;
using TalhaMarket.Service.User;

namespace TalhaMarket.Admin.Controllers
{
    public class UserController : Controller
    {
        private readonly IUserService _userService;
        public UserController(IUserService userService)
        {
            _userService = userService;
        }

        [Authorize(Roles ="Admin")]
        public IActionResult Index()
        {
            UserViewModel model = new()
            {
                Users = _userService.GetAll()
            };
            return View(model);
        }
    }
}
