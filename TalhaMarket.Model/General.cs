using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TalhaMarket.Model
{
    public class General<T>
    {
        //servisten dönen her işlemin ortak mesaj alanı başarılı mı ve gelen veri
        public bool isSuccess { get; set; }
        public T Entity { get; set; }
    }
}
