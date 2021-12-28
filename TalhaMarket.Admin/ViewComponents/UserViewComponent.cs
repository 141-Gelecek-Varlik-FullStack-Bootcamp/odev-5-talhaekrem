using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.ViewComponents;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TalhaMarket.Admin.Models;

namespace TalhaMarket.Admin.ViewComponents
{
    public class UserViewComponent : ViewComponent
    {
        public ViewViewComponentResult Invoke()
        {
            UserDetailsViewModel model = new()
            {
                UserName = HttpContext.User.Identity.Name,
            };
            return View(model);
        }
    }
}
