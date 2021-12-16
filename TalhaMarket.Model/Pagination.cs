using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TalhaMarket.Model
{
    //sıralama, filtreleme ve sayfalama için ortak bir generic yapı oluşturuyorum. gerekli tüm ortak bilgiler burada olacaktır.
    public class Pagination<T>
    {
        //işlem(ler) başarılı mı
        public bool isSuccess { get; set; }

        //işlem isimleri, A-Z sırala, Fiyata göre sırala, Sayfalama, Fiyata göre filtrele vs.
        public List<string> operations { get; set; }

        //exeption veya status mesajı
        public List<string> exeptionMessage { get; set; }

        //toplam ürün sayısı
        public int totalEntityCount { get; set; }

        //toplam sayfa no
        public int totalPageCount { get; set; }

        //girilen sayfa no
        public int pageNumber { get; set; }

        //ürünlerin listesi
        public List<T> entities { get; set; }

    }
}
