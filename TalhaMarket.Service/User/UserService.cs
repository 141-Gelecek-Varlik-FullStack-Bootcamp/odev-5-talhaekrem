using AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TalhaMarket.DB.Entities.TalhaMarketDbContext;
using TalhaMarket.Model;
using TalhaMarket.Model.Users;

namespace TalhaMarket.Service.User
{
    public class UserService : IUserService
    {
        private readonly IMapper _mapper;
        public UserService(IMapper mapper)
        {
            _mapper = mapper;
        }
        //login işlemi, kullanıcı adı ve şifre alır
        public bool Login(string userName, string password)
        {
            bool result = false;

            //any true false döner. aradığımız şartlar ise şunlardır. kullanıcı silinmemişse, aktif hesapsa, kullanıcı adı uyuyorsa ve şifre uyuyorsa
            using (var _context = new TalhaMarketContext())
            {
                result = _context.User.Any(
                        u => !u.IsDeleted &&
                        u.IsActive &&
                        u.UserName == userName &&
                        u.Password == password);
            }
            return result;
        }
        //kullanıcı kayıt olma
        public General<UserModel> Insert(UserModel newUser)
        {
            var result = new General<UserModel>()
            {
                isSuccess = false
            };
            var model = _mapper.Map<TalhaMarket.DB.Entities.User>(newUser);
            using (var _context = new TalhaMarketContext())
            {
                model.InsertDate = DateTime.Now;
                model.IsActive = true;
                model.IsDeleted = false;
                _context.User.Add(model);
                _context.SaveChanges();
                result.isSuccess = true;
                result.Entity = _mapper.Map<UserModel>(model);
            }
            return result;
        }

        public General<UserModel> Update(int id, UserModel updateUser)
        {
            var result = new General<UserModel>()
            {
                isSuccess = false
            };
            var model = _mapper.Map<TalhaMarket.DB.Entities.User>(updateUser);
            using (var _context = new TalhaMarketContext())
            {
                var user = _context.User.SingleOrDefault(u => u.Id == id);
                user.Name = model.Name;
                user.SurName = model.SurName;
                user.Email = model.Email;
                user.UserName = model.UserName;
                user.Password = model.Password;
                user.UpdateDate = DateTime.Now;
                _context.SaveChanges();
                result.isSuccess = true;
                result.Entity = _mapper.Map<UserModel>(user);
            }
            return result;
        }

        public void Delete(int id)
        {
            using (var _context = new TalhaMarketContext())
            {
                var user = _context.User.Where(u => u.Id == id).SingleOrDefault();
                user.IsActive = false;
                user.IsDeleted = true;
                _context.SaveChanges();
            }
        }

        public List<UserModel> GetAll()
        {
            using (var _context = new TalhaMarketContext())
            {
                var users = _context.User.ToList();
                List<UserModel> result = _mapper.Map<List<TalhaMarket.DB.Entities.User>, List<UserModel>>(users);
                return result;
            }
        }

        public UserModel GetUser(int id)
        {
            using (var _context = new TalhaMarketContext())
            {
                var user = _context.User.Where(u => u.Id == id).SingleOrDefault();
                var result = _mapper.Map<UserModel>(user);
                return result;
            }
        }
    }
}