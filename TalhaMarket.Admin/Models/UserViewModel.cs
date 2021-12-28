using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TalhaMarket.Model;
using TalhaMarket.Model.Users;

namespace TalhaMarket.Admin.Models
{
    public class UserViewModel
    {
        public General<UserModel> Users { get; set; }
    }
}
