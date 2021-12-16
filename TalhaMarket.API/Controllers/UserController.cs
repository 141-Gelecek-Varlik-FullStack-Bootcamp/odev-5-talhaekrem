using AutoMapper;
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
    [Route("[controller]s")]
    [ApiController]
    public class UserController : ControllerBase
    {
        private readonly IUserService _userService;
        public UserController(IUserService userService)
        {
            _userService = userService;
        }

        [HttpGet]
        public General<UserModel> GetAll()
        {
            General<UserModel> response = new();
            response = _userService.GetAll();
            return response;
        }

        [HttpGet("{id}")]
        public General<UserDetailModel> GetById(int id)
        {
            General<UserDetailModel> response = new();
            response = _userService.GetUser(id);
            return response;
        }

        //kullanıcı ekle
        [HttpPost]
        public General<UserDetailModel> Insert([FromBody] UserModel newUser)
        {
            General<UserDetailModel> response = new();
            response = _userService.Insert(newUser);
            return response;
        }

        [HttpPut("{id}")]
        public General<UserDetailModel> UpdateUser(int id, [FromBody] UpdateUserModel updateUser)
        {
            General<UserDetailModel> response = new();
            response = _userService.Update(id, updateUser);
            return response;
        }

        [HttpDelete("{id}")]
        public General<bool> Delete(int id)
        {
            General<bool> response = new();
            response = _userService.Delete(id);
            return response;
        }
    }
}
