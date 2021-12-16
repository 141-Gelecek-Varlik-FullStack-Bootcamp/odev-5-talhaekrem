using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TalhaMarket.Model
{
    public class General<T>
    {
        //servisten dönen her işlemin ortak mesaj alanı. başarılı mı?, gelen veri, liste halinde gelen veri, durum mesajı
        public bool isSuccess { get; set; }
        public T Entity { get; set; }
        public List<T> EntityList { get; set; }

        public string Message { get; set; }
    }
}
