using AutoMapper;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TalhaMarket.Model;
using TalhaMarket.Model.Users;
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
        public List<UserModel> GetAll()
        {
            return _userService.GetAll();
        }

        [HttpGet("{id}")]
        public UserModel GetById(int id)
        {
            return _userService.GetUser(id);
        }

        [HttpPost]
        public General<UserModel> Insert([FromBody] UserModel newUser)
        {
            return _userService.Insert(newUser);
        }

        [HttpPut("{id}")]
        public General<UserModel> UpdateUser(int id,[FromBody] UserModel updateUser)
        {
            return _userService.Update(id,updateUser);
        }
        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            _userService.Delete(id);
            return Ok();
        }
    }
}
