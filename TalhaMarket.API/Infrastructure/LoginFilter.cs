using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.Extensions.Caching.Memory;
using System;
using TalhaMarket.API.Services.CurrentUser;
using TalhaMarket.Model.Users;

namespace TalhaMarket.API.Infrastructure
{
    public class LoginFilter : Attribute, IActionFilter
    {
        private readonly IMemoryCache _memoryCache;
        private readonly ICurrentUserService _currentUser;
        public LoginFilter(IMemoryCache memoryCache, ICurrentUserService currentUserService) 
        {
            _memoryCache = memoryCache;
            _currentUser = currentUserService;
        }

        public void OnActionExecuted(ActionExecutedContext context)
        {
            return;
        }

        public void OnActionExecuting(ActionExecutingContext context)
        {
            //int currentUserId = _currentUser.GetCurrentUser().Id;
            if (!_memoryCache.TryGetValue("Login", out UserModel response))
            {
                context.Result = new UnauthorizedObjectResult("Giriş yapmanız gerekmektedir.");
            }
            return;
        }
    }
}