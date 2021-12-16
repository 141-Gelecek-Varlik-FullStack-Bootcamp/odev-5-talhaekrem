using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Caching.Memory;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TalhaMarket.API.Infrastructure;
using TalhaMarket.Model;
using TalhaMarket.Model.Users;
using TalhaMarket.Service.CurrentUser;
using TalhaMarket.Service.User;

namespace TalhaMarket.API.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class LoginController : ControllerBase
    {
        private readonly IMemoryCache _memoryCache;
        private readonly IUserService _userService;
        private readonly ICurrentUserService _currentUser;
        public LoginController(IMemoryCache memoryCache,
            IUserService userService, ICurrentUserService currentUserService)
        {
            _memoryCache = memoryCache;
            _userService = userService;
            _currentUser = currentUserService;
        }

        [HttpPost]
        public General<bool> Login([FromBody] LoginModel loginUser)
        {
            General<bool> resp = new();
            //kullanıcı adı ve şifre doğru mu? doğruysa bu kullanıcıyı veritabanından getir.
            General<UserModel> model = _userService.Login(loginUser);
            if (model.isSuccess)
            {
                //username password doğruysa ve login olmuşsa kullanıcıyı cachememorye yaz :{model.Entity.Id}
                if (!_memoryCache.TryGetValue($"Login:{model.Entity.Id}", out UserModel _loginUser))
                {
                    var cacheOptions = new MemoryCacheEntryOptions()
                    {
                        AbsoluteExpiration = DateTime.Now.AddHours(3)
                    };
                    _memoryCache.Set($"Login:{model.Entity.Id}", model.Entity, cacheOptions);
                    _currentUser.SetCurrentUser(model.Entity);
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
    }
}
