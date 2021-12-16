using TalhaMarket.Model;
using TalhaMarket.Model.Users;

namespace TalhaMarket.Service.User
{
    public interface IUserService
    {
        General<UserModel> Login(LoginModel login);

        General<UserModel> GetAll();
        General<UserDetailModel> GetUser(int id);
        General<UserDetailModel> Insert(UserModel newUser);
        General<UserDetailModel> Update(int id, UpdateUserModel updateUser);
        General<bool> Delete(int id);
    }
}