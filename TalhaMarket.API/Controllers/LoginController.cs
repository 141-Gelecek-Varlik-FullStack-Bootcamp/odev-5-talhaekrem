using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TalhaMarket.Model;
using TalhaMarket.Service.User;

namespace TalhaMarket.API.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class LoginController : ControllerBase
    {
        private readonly IUserService _userService;
        //örnek olması için login işlemi için izin verilen kullanıcı adı listesi.
        public static List<string> allowedUsers = new List<string>()
        {
            {"talhaekrem" },
            {"ahmetmehmet" },
            {"aliveli" },
            {"ayseoya" }
        };
        public LoginController(IUserService userService)
        {
            _userService = userService;
        }
        [HttpPost]
        public bool Login([FromBody] LoginModel login)
        {
            if (allowedUsers.Contains(login.userName))
            {
                return _userService.Login(login.userName,login.password);
            }
            else
            {
                return false;
            }
        }
    }
}
