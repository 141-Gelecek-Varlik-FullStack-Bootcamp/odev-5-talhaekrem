using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TalhaMarket.Model.Users;

namespace TalhaMarket.Service.CurrentUser
{
    public interface ICurrentUserService
    {
        UserModel GetCurrentUser();
        void SetCurrentUser(UserModel user);
    }
}
