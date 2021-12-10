using System.Collections.Generic;
using TalhaMarket.Model;
using TalhaMarket.Model.Users;

namespace TalhaMarket.Service.User
{
    public interface IUserService
    {
        bool Login(string userName, string password);
        General<UserModel> Insert(UserModel newUser);
        General<UserModel> Update(int id,UserModel updateUser);
        void Delete(int id);
        List<UserModel> GetAll();
        UserModel GetUser(int id);
    }
}