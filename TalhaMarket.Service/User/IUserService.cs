using TalhaMarket.Model;
using TalhaMarket.Model.Users;

namespace TalhaMarket.Service.User
{
    public interface IUserService
    {
        General<UserModel> Login(LoginModel login);

        General<UserModel> GetAll();
        General<UserDetailModel> GetUser(int id);
        General<UserDetailModel> Insert(InsertUserModel newUser);
        General<UserDetailModel> Update(UpdateUserModel updateUser);
        General<bool> Delete(int id);
        int CurrentUserId(string AspNetUserId);
    }
}