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
        public General<UserModel> Login(LoginModel login)
        {
            General<UserModel> result = new() { isSuccess = false };

            //true false döner. şartlara uyuyorsa böyle bir kullanıcı vardır. silinmemiş ve aktif hesaptır.
            using (var _context = new TalhaMarketContext())
            {
                var user = _context.User.FirstOrDefault(
                        u => !u.IsDeleted &&
                        u.IsActive &&
                        u.UserName == login.userName &&
                        u.Password == login.password);
                if (user is not null)
                {
                    result.isSuccess = true;
                    result.Entity = _mapper.Map<UserModel>(user);
                }
            }
            return result;
        }

        //Kullanıcıya ait CRUD işlemlerinin yapıldığı bölüm. _context ve linq işlemleriyle veritabanıyla ilişki kurulur.
        public General<UserModel> GetAll()
        {
            var result = new General<UserModel>() { isSuccess = false };
            using (var _context = new TalhaMarketContext())
            {
                var users = _context.User.ToList();
                List<UserModel> userList = _mapper.Map<List<TalhaMarket.DB.Entities.User>, List<UserModel>>(users);
                result.EntityList = userList;
            }
            if (result.EntityList is not null)
            {
                result.isSuccess = true;
                result.Message = "İşlem Başarılı.";
            }
            else
            {
                result.Message = "Listede Kullanıcı bulunmamaktadır.";
            }
            return result;
        }

        //idye göre kullanıcı getir.
        public General<UserDetailModel> GetUser(int id)
        {
            var result = new General<UserDetailModel>() { isSuccess = false };
            using (var _context = new TalhaMarketContext())
            {
                var user = _context.User.Where(p => p.Id == id).FirstOrDefault();
                result.Entity = _mapper.Map<UserDetailModel>(user);
            }
            if (result.Entity is not null)
            {
                result.isSuccess = true;
                result.Message = "İşlem Başarılı.";
            }
            else
            {
                result.Message = "Kullanıcı Bulunamadı.";
            }
            return result;
        }

        //kullanıcı kayıt olma
        public General<UserDetailModel> Insert(UpdateUserModel newUser)
        {
            var result = new General<UserDetailModel>() { isSuccess = false };

            var model = _mapper.Map<TalhaMarket.DB.Entities.User>(newUser);
            using (var _context = new TalhaMarketContext())
            {
                model.InsertDate = DateTime.Now;
                model.IsActive = true;
                _context.User.Add(model);
                _context.SaveChanges();
                result.Entity = _mapper.Map<UserDetailModel>(model);
            }
            if (result.Entity is not null)
            {
                result.isSuccess = true;
                result.Message = "İşlem Başarılı.";
            }
            else
            {
                result.Message = "Beklenmeyen bir hata oluştu. Kayıt işlemi başarısız.";
            }
            return result;
        }

        //kullanıcı bilgilerini güncelle
        public General<UserDetailModel> Update(UpdateUserModel updateUser)
        {
            var result = new General<UserDetailModel>() { isSuccess = false };
            var model = _mapper.Map<TalhaMarket.DB.Entities.User>(updateUser);
            using (var _context = new TalhaMarketContext())
            {
                var user = _context.User.SingleOrDefault(u => u.Id == updateUser.Id);
                user.Name = model.Name;
                user.SurName = model.SurName;
                user.UserName = model.UserName;
                user.Email = model.Email;
                user.Password = model.Password;
                user.UpdateDate = DateTime.Now;
                user.IsActive = model.IsActive;
                user.IsDeleted = model.IsDeleted;
                _context.SaveChanges();
                result.isSuccess = true;
                result.Entity = _mapper.Map<UserDetailModel>(user);
            }
            if (result.Entity is not null)
            {
                result.isSuccess = true;
                result.Message = "İşlem Başarılı.";
            }
            else
            {
                result.Message = "Güncelleme işlemi başarısız.";
            }
            return result;
        }

        //kullanıcıyı sil
        public General<bool> Delete(int id)
        {
            var result = new General<bool>() { isSuccess = false };
            using (var _context = new TalhaMarketContext())
            {
                var user = _context.User.Where(u => u.Id == id).SingleOrDefault();
                user.IsActive = false;
                user.IsDeleted = true;
                _context.SaveChanges();
                result.isSuccess = true;
                result.Entity = true;
            }
            if (!result.isSuccess)
            {
                result.Message = "Kullanıcı silme başarısız.";
            }
            else
            {
                result.Message = String.Format("Kullanıcı silme başarılı. Silinen kullanıcı Id:{0}", id);
            }
            return result;
        }

        public int CurrentUserId(string AspNetUserId)
        {
            using (var _context = new TalhaMarketContext())
            {
                int userId = _context.User.FirstOrDefault(u => u.AspNetUserId == AspNetUserId).Id;
                return userId;
            }
        }
    }
}