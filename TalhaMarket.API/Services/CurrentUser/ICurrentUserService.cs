using TalhaMarket.Model.Users;

namespace TalhaMarket.API.Services.CurrentUser
{
    public interface ICurrentUserService
    {
        UserModel GetCurrentUser();
        //void SetCurrentUser(UserModel user);
    }
}
