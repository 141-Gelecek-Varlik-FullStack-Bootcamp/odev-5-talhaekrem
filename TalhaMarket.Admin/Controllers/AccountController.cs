using AutoMapper;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using TalhaMarket.Admin.Entities;
using TalhaMarket.Admin.Models;
using TalhaMarket.BackgroundJob.Schedules;
using TalhaMarket.Model.Users;
using TalhaMarket.Service.User;

namespace TalhaMarket.Admin.Controllers
{
    public class AccountController : Controller
    {
        private readonly UserManager<CustomIdentityUser> _userManager;
        private readonly RoleManager<CustomIdentityRole> _roleManager;
        private readonly SignInManager<CustomIdentityUser> _signInManager;
        private readonly IUserService _userService;
        private readonly IMapper _mapper;
        public AccountController(UserManager<CustomIdentityUser> userManager,
            RoleManager<CustomIdentityRole> roleManager,
            SignInManager<CustomIdentityUser> signInManager,
            IUserService userService,
            IMapper mapper)
        {
            _userManager = userManager;
            _roleManager = roleManager;
            _signInManager = signInManager;
            _userService = userService;
            _mapper = mapper;
        }

        //kayıt olma ekranı
        public IActionResult Register()
        {
            RegisterViewModel model = new();
            return View(model);
        }

        //submit dediği an post işlemi gerçekleşecek ve kayıt için bilgiler buraya gelecektir. 
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Obsolete]
        public IActionResult Register(RegisterViewModel model)
        {
            //modelin içerisine data annotationslara göre doğru veriler girilmişse devam et
            if (ModelState.IsValid)
            {
                //aspnet identitynin nimetlerinden olan IdentityUser sınıfından türettiğim CustomIdentityUser sınıfındaki UserName ve Email alanlarını modelden gelen verilere eşitliyorum.
                CustomIdentityUser user = new()
                {
                    UserName = model.UserName,
                    Email = model.Email
                };


                //aspnet identity kullanıcı ekleme. şifreyi hashleyip kaydettiği için şifre girilimi bu şekildedir.
                IdentityResult result = _userManager.CreateAsync(user, model.Password).Result;

                //kullanıcı başarıyla oluşturulduysa artık rolünü verebiliriz.
                if (result.Succeeded)
                {
                    //eğer admin rolü yoksa admin rolü oluştur. 
                    //burası tamamen size kalmış artık rolleri nasıl yönetirseniz. kaç tane admin olacak falan.
                    //ben şu anda 1 tane admin yapıyorum o da sisteme ilk kayıt olan kişi şeklinde
                    if (!_roleManager.RoleExistsAsync("Admin").Result)
                    {
                        CustomIdentityRole role = new()
                        {
                            Name = "Admin"
                        };
                        //rol tablosuna Admin rolünü ekle
                        IdentityResult roleResult = _roleManager.CreateAsync(role).Result;

                        if (!roleResult.Succeeded)
                        {
                            TempData["errorRegister"] = "Kayıt olma başarısız.";
                            return View(model);
                        }
                        //kullanıcıya admin rolünü ver
                        _userManager.AddToRoleAsync(user, "Admin").Wait();
                    }
                    else if(!_roleManager.RoleExistsAsync("Editor").Result)//editör rolü var mı yoksa oluştur. Admindeki işlemlerin aynısı
                    {
                        CustomIdentityRole role = new()
                        {
                            Name = "Editor"
                        };

                        IdentityResult roleResult = _roleManager.CreateAsync(role).Result;

                        if (!roleResult.Succeeded)
                        {
                            TempData["errorRegister"] = "Kayıt olma başarısız.";
                            return View(model);
                        }
                        //kullanıcıya editör rolünü ver
                        _userManager.AddToRoleAsync(user, "Editor").Wait();
                    }
                    else
                    {
                        //editör rolü zaten varsa tekrardan dbye editor isminde rol ekleme. sadece kullanıcıya Editor rolünü ver
                        _userManager.AddToRoleAsync(user, "Editor").Wait();
                    }

                    //ayrıyetten user tablosuna da kullanıcıyı ekleme. User tablosunu AspNetUser tablosune göre daha yalın,sade ve daha fazla bilgi tuttuğundan kullanıyorum.
                    //insert user değeri yine User tablosunun idsinden gelecek
                    //current user, logged user ise AspNetUser tablosundan gelecektir. hazır yapı mevcut.
                    var userModel = _mapper.Map<InsertUserModel>(model);
                    userModel.AspNetUserId = user.Id;
                    var registereduser = _userService.Insert(userModel);

                    DelayedJobs.SendWelcomeMailJob(registereduser.Entity.Id);
                    //işlemlerin sonunda Login ekranına dön
                    return RedirectToAction("Login", "Account");
                }
                else
                {
                    model.Errors = new();
                    for (int i = 0; i < result.Errors.ToList().Count; i++)
                    {
                        model.Errors.Add(result.Errors.ToList()[i].Description);
                    }
                }
            }
            return View(model);
        }

        //Login sayfasını aç
        public IActionResult Login()
        {
            return View();
        }

        //identity kütüphanesini kullanarak login işlemi
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Login(LoginViewModel model)
        {
            if (ModelState.IsValid)
            {
                var result = _signInManager.PasswordSignInAsync(model.userName, model.password, model.rememberMe, false).Result;

                //kullanıcı adı ve şifreye uyan kayıt varsa ve doğru yazılmışsa admine gönder
                if (result.Succeeded)
                {
                    return RedirectToAction("Index", "Home");
                }
                TempData["errorlogin"] = "Kullanıcı Adı veya Şifre Hatalı.";
            }
            return View(model);
        }

        //oturumu kapat
        public IActionResult LogOff()
        {
            _signInManager.SignOutAsync().Wait();
            return RedirectToAction("Login","Account");
        }

        public IActionResult Settings()
        {
            var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
            var user = _userService.GetUser(_userService.CurrentUserId(userId));
            var updateModel = _mapper.Map<UpdateUserModel>(user.Entity);
            UserSettingsViewModel model = new()
            {
                updateUser = updateModel
            };
            return View(model);
        }
        [HttpPost]
        public async Task<IActionResult> Settings(UserSettingsViewModel model)
        {
            if (ModelState.IsValid)
            {
                //önce aspnet identity tablosundan güncelliyorum sonra users tablosundan
                var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
                var user = await _userManager.FindByIdAsync(userId);
                user.Email = model.updateUser.Email;
                user.UserName = model.updateUser.UserName;
                await _userManager.UpdateAsync(user);
                _userService.Update(model.updateUser);
                TempData.Add("adminmessage", "Bilgileriniz başarıyla güncellendi!");

            }
            return RedirectToAction("Index", "Home");
        }

        public async Task<IActionResult> Disable()
        {
            var id = User.FindFirstValue(ClaimTypes.NameIdentifier);
            int userId = _userService.CurrentUserId(id);
            _userService.Delete(userId);

            var user = _userManager.FindByNameAsync(HttpContext.User.Identity.Name);
            await _userManager.SetLockoutEnabledAsync(user.Result, true);
            await _userManager.SetLockoutEndDateAsync(user.Result, DateTime.Today.AddYears(100));
            await _signInManager.SignOutAsync();
            return RedirectToAction("Login", "Account");
        }
    }
}