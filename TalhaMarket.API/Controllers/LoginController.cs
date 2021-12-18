using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Caching.Memory;
using System;
using TalhaMarket.API.Services.CurrentUser;
using TalhaMarket.Model;
using TalhaMarket.Model.Users;
using TalhaMarket.Service.User;

namespace TalhaMarket.API.Controllers
{
    [ApiController]
    public class LoginController : ControllerBase
    {
        private readonly IMemoryCache _memoryCache;
        private readonly IUserService _userService;
        public LoginController(IMemoryCache memoryCache,
            IUserService userService)
        {
            _memoryCache = memoryCache;
            _userService = userService;
        }

        [HttpPost]
        [Route("[controller]")]
        public General<bool> Login([FromBody] LoginModel loginUser)
        {
            General<bool> resp = new();
            //kullanıcı adı ve şifre doğru mu? doğruysa bu kullanıcıyı veritabanından getir.
            General<UserModel> model = _userService.Login(loginUser);
            if (model.isSuccess)
            {
                //username password doğruysa ve login olmuşsa kullanıcıyı cachememorye yaz :{model.Entity.Id}
                if (!_memoryCache.TryGetValue("Login", out UserModel _loginUser))
                {
                    var cacheOptions = new MemoryCacheEntryOptions()
                    {
                        AbsoluteExpiration = DateTime.Now.AddHours(3)
                    };
                    _memoryCache.Set("Login", model.Entity, cacheOptions);
                    //_currentUser.SetCurrentUser(model.Entity);
                    resp.Entity = true;
                    resp.isSuccess = true;
                    resp.Message = "Giriş başarılı.";
                }
                else
                {
                    resp.Message = "Zaten oturum açtınız!";
                }

            }
            else
            {
                resp.Message = "Kullanıcı adı veya şifre yanlış.";
            }
            return resp;
        }

        [HttpPost]
        [Route("Logout")]
        public ActionResult LogOut()
        {
            if(_memoryCache.TryGetValue("Login",out UserModel model))
            {
                 _memoryCache.Remove("Login");
                return new OkObjectResult("Çıkış başarılı");
            }
            else
            {
                return new BadRequestObjectResult("Oturum zaten açık değil");
            }
        }
    }
}
