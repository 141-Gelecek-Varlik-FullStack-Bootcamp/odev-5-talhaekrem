using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TalhaMarket.Model
{
    public class FilterSort<T>
    {
        //işlem(ler) başarılı mı
        public bool isSuccess { get; set; }

        //işlem isimleri, A-Z sırala, Fiyata göre sırala, Sayfalama, Fiyata göre filtrele vs.
        public List<string> operations { get; set; }

        //exeption veya status mesajı
        public List<string> exeptionMessage { get; set; }

        //ürünlerin listesi
        public List<T> entities { get; set; }
    }
}
