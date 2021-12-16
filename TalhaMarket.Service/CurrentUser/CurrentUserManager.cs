using Microsoft.Extensions.Caching.Memory;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TalhaMarket.Model.Users;

namespace TalhaMarket.Service.CurrentUser
{
    public class CurrentUserManager : ICurrentUserService
    {
        private readonly IMemoryCache _cache;
        public CurrentUserManager(IMemoryCache memoryCache)
        {
            _cache = memoryCache;
        }
        //her controllerda ve serviste kullanılan, mevcut kullanıcıyı getirmesi ve yazması gereken yerdir.
        //dinamik olması gereklidir. henüz dinamik değil.
        //cacheden kullanıcı kontrol edilir. kullanıcı varsa getirir. yoksa boş UserModel döner. ama istediğim durumda değil şuan.
        public UserModel currentUser { get; set; }
        public UserModel GetCurrentUser()
        {
            var resp = new Model.Users.UserModel();
            if (currentUser is not null)
            {
                resp = currentUser;
            }
            if (_cache.TryGetValue($"Login:{resp.Id}", out UserModel loginUser))
            {
                resp = loginUser;
            }
            //if (_cache.TryGetValue("Login", out UserModel loginUser))
            //{
            //    resp = loginUser;
            //}
            return resp;
        }

        public void SetCurrentUser(UserModel user)
        {
            currentUser = user;
        }

    }
}
