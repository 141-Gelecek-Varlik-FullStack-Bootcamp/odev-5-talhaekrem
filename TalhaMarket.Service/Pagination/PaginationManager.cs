using AutoMapper;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using TalhaMarket.Core.Helpers;
using TalhaMarket.DB.Entities.TalhaMarketDbContext;
using TalhaMarket.Model;
using TalhaMarket.Model.Products;

namespace TalhaMarket.Service.Pagination
{
    public class PaginationManager : IPaginationService
    {
        private readonly IMapper _mapper;
        public PaginationManager(IMapper mapper)
        {
            _mapper = mapper;
        }

        //sayfalama
        //eğer pageNumber girilmemişse default olarak 1. sayfayı gösteriyorum
        public Pagination<ListProductModel> GetPage(int pageSize, int pageNumber)
        {
            var result = new Pagination<ListProductModel>() { isSuccess = false };
            result.operations = new();
            result.exeptionMessage = new();
            if (pageNumber == 0)
            {
                pageNumber = 1;
                result.exeptionMessage.Add("Sayfa sayısı girilmediğinden ilk sayfa gösterilecektir");
            }
            result.pageNumber = pageNumber;

            using (var _context = new TalhaMarketContext())
            {
                result.totalEntityCount = _context.Product.Count();
                if (pageSize > result.totalEntityCount || pageSize < 1)
                {
                    if (pageSize < 1)
                    {
                        result.exeptionMessage.Add(String.Format(
                            "Minimum sayfa genişliği 1 olmalıdır.{0} miktarı geçersiz olduğundan her sayfada 1 ürün gösterilecektir.",
                            pageSize));
                        pageSize = 1;
                    }
                    else
                    {
                        result.exeptionMessage.Add(String.Format(
                            "Maksimum sayfa genişliği {0} olmalıdır. {1} miktarı geçersiz olduğundan sayfada {2} ürün gösterilecektir."
                            , result.totalEntityCount, pageSize, result.totalEntityCount));
                        pageSize = result.totalEntityCount;
                    }
                }

                /*bu kısımda ise toplam sayfa sayısını alıyorum. toplam ürün sayısını sayfa genişliğine bölüp bunu yukarı yuvarlıyorum.
                yukarı yuvarlamamın sebebi bölme işlemi virgüllü çıkabilir. ürün dışarda kalmaması içindir. bu duruma örnek vermek gerekirsek 
                25 ürün var ve her sayfada 10 ürün var ise toplam 3 sayfa olur. ilk 2 sayfada dolu halde 10 ar ürün, 3. sayfada ise 5 ürün olur
                bölüm işlemi 2,5 çıkar. bunu yukarı yuvarlarız ki 3. sayfanın da olduğunu belirtmek için. 3. sayfa full dolu değil ama 
                yarım da olsa sayfa sayfadır. Ceiling işlemi yukarı yuvarlamadır.*/
                result.totalPageCount = (int)Math.Ceiling(result.totalEntityCount / (double)pageSize);

                if (pageNumber > result.totalPageCount || pageNumber < 1)
                {
                    if (pageNumber < 1)
                    {
                        result.exeptionMessage.Add(String.Format(
                            "{0} sayfa numarası geçersiz olduğundan ilk sayfa gösterilecektir", pageNumber));
                        pageNumber = 1;
                    }
                    else
                    {
                        result.exeptionMessage.Add(String.Format(
                            "Toplam sayfa sayısı {0}. {1} nolu sayfa olmadığından son sayfa gösterilecektir",
                            result.totalPageCount, pageNumber));
                        pageNumber = result.totalPageCount;
                    }
                }
                /*buradaki işlem şöyledir: Skip() ile belirtilen miktardaki ürün atlanır. Take() ile belirtilen ürün kadar alınır
                sayfa 1 i görüntülemek isteyen kişi hiç sayfa atlamaz. sayfa 3 ü görüntülemek isterseniz 2 sayfa atlarsınız. yani 
                pageNumber-1. peki kaç ürün atlayacaksınız? pagesize kadar sayfadaki ürünleri atlayacaksınız. sonuç olarak 
                Skip(pageNumber-1)*pageSize. peki sonra kaç ürün alacaksınız? sayfa genişliği kadar. Take(pageSize);*/
                var products = _context.Product.Skip((pageNumber - 1) * pageSize).Take(pageSize).ToList();
                List<ListProductModel> productList = _mapper.Map<List<TalhaMarket.DB.Entities.Product>, List<ListProductModel>>(products);
                result.entities = productList;
                result.operations.Add(String.Format("Sayfalama: Sayfadaki Toplam Ürün {0}, Sayfa Sayısı {1}", products.Count, pageNumber));

            }
            if (result.entities.Count > 0)
            {
                result.isSuccess = true;
                result.exeptionMessage.Add("İşlem Başarılı.");
            }
            else
            {
                result.exeptionMessage.Add("Girilen değerler doğru değil.");
            }
            return result;
        }

        //sıralama
        public FilterSort<ListProductModel> Sorting(string sortName, bool type)
        {
            //ascending azdan çoğa(artan), descending çoktan aza(azalan)
            //True ascending, False descending olarak belirledim
            var result = new FilterSort<ListProductModel>() { isSuccess = false };
            result.operations = new();
            result.exeptionMessage = new();
            using (var _context = new TalhaMarketContext())
            {
                var products = _context.Product.OrderByDescending(sortName).ToList();
                if (type)
                {
                    products = _context.Product.OrderBy(sortName).ToList();
                }
                List<ListProductModel> productList = _mapper.Map<List<TalhaMarket.DB.Entities.Product>, List<ListProductModel>>(products);
                result.entities = productList;
                result.operations.Add(String.Format("Sıralama:Sıralanan {0}. Tür: {1}", sortName, type == true ? "Artan" : "Azalan"));
            }
            if (result.entities.Count > 0)
            {
                result.isSuccess = true;
                result.exeptionMessage.Add("İşlem Başarılı.");
            }
            else
            {
                result.exeptionMessage.Add("Girilen değerler doğru değil.");
            }
            return result;
        }

        //filtre
        public FilterSort<ListProductModel> Filter(string filterName, filterEnum type, string filterItem)
        {
            var result = new FilterSort<ListProductModel>() { isSuccess = false };
            result.operations = new();
            result.exeptionMessage = new();
            using (var _context = new TalhaMarketContext())
            {
                //filtreleme sonucunda hiç veri yoksa boş products listesi dönmesi için böyle bir şey yazdım. boş ise kontrol yapıyorum exeptionMessage için
                var products = _context.Product.Take(0).ToList();
                //girilen filtrenin üstündeki entityler
                if (type == filterEnum.over)
                {
                    switch (filterName)
                    {
                        case "Price":
                            products = _context.Product.Where(p => p.Price >= int.Parse(filterItem)).ToList();
                            break;
                        case "Stock":
                            products = _context.Product.Where(p => p.Stock >= int.Parse(filterItem)).ToList();
                            break;
                        default:
                            result.exeptionMessage.Add("Geçerli bir filtre giriniz");
                            break;
                    }
                }
                //girilen filtrenin altındaki entityler
                else if (type == filterEnum.under)
                {
                    switch (filterName)
                    {
                        case "Price":
                            products = _context.Product.Where(p => p.Price <= int.Parse(filterItem)).ToList();
                            break;
                        case "Stock":
                            products = _context.Product.Where(p => p.Stock <= int.Parse(filterItem)).ToList();
                            break;
                        default:
                            result.exeptionMessage.Add("Geçerli bir filtre giriniz");
                            break;
                    }
                }
                //girilen filtreye eşit olan entityler
                else
                {
                    switch (filterName)
                    {
                        case "CategoryId":
                            products = _context.Product.Where(p => p.CategoryId == int.Parse(filterItem)).ToList();
                            break;
                        case "DisplayName":
                            //startsWith yerine contains de kullanılabilir ama o zaman aradığımız kelime ortadaysa onu da getirir.
                            // o yüzden startsWith iyi
                            products = _context.Product.Where(p => p.DisplayName.StartsWith(filterItem)).ToList();
                            break;
                        case "Price":
                            products = _context.Product.Where(p => p.Price == int.Parse(filterItem)).ToList();
                            break;
                        case "Stock":
                            products = _context.Product.Where(p => p.Stock == int.Parse(filterItem)).ToList();
                            break;
                        default:
                            result.exeptionMessage.Add("Geçerli bir filtre giriniz");
                            break;
                    }
                }
                List<ListProductModel> productList = _mapper.Map<List<TalhaMarket.DB.Entities.Product>, List<ListProductModel>>(products);
                result.entities = productList;
                result.operations.Add(String.Format("Filtreleme :Filtre Adı {0}. Karşılaştırma Değeri: {1}. Tür: {2}", filterName, filterItem, extens.GetEnumDisplayName(type)));
            }
            if (result.entities.Count > 0)
            {
                result.isSuccess = true;
                result.exeptionMessage.Add("İşlem Başarılı.");
            }
            else
            {
                result.exeptionMessage.Add("Girilen filtreye ait ürün yoktur.");
            }
            return result;
        }

        //sayfalama, sıralama, filtreleme
        public Pagination<ListProductModel> FilterSortPaging(string filterName, filterEnum type, string filterItem, string sortName, bool sortType, int pageSize, int pageNumber)
        {
            var result = new Pagination<ListProductModel>() { isSuccess = false };
            result.operations = new();
            result.exeptionMessage = new();
            if (pageNumber == 0)
            {
                pageNumber = 1;
                result.exeptionMessage.Add("Sayfa sayısı girilmediğinden ilk sayfa gösterilecektir");
            }
            using (var _context = new TalhaMarketContext())
            {
                var products = _context.Product.Take(0).ToList();
                //sort
                products = _context.Product.OrderByDescending(sortName).ToList();
                if (sortType)
                {
                    products = _context.Product.OrderBy(sortName).ToList();
                }
                //sıralama işlemini mesaj olarak yazma
                result.operations.Add(String.Format("Sıralama:Sıralanan {0}. Tür: {1}", sortName, sortType == true ? "Artan" : "Azalan"));

                //filtreleme
                if (type == filterEnum.over)
                {
                    switch (filterName)
                    {
                        case "Price":
                            products = products.Where(p => p.Price >= int.Parse(filterItem)).ToList();
                            break;
                        case "Stock":
                            products = products.Where(p => p.Stock >= int.Parse(filterItem)).ToList();
                            break;
                        default:
                            result.exeptionMessage.Add("Geçerli bir filtre giriniz");
                            break;
                    }
                }
                else if (type == filterEnum.under)
                {
                    switch (filterName)
                    {
                        case "Price":
                            products = products.Where(p => p.Price <= int.Parse(filterItem)).ToList();
                            break;
                        case "Stock":
                            products = products.Where(p => p.Stock <= int.Parse(filterItem)).ToList();
                            break;
                        default:
                            result.exeptionMessage.Add("Geçerli bir filtre giriniz");
                            break;
                    }
                }
                else
                {
                    switch (filterName)
                    {
                        case "CategoryId":
                            products = products.Where(p => p.CategoryId == int.Parse(filterItem)).ToList();
                            break;
                        case "DisplayName":
                            products = products.Where(p => p.DisplayName.StartsWith(filterItem)).ToList();
                            break;
                        case "Price":
                            products = products.Where(p => p.Price == int.Parse(filterItem)).ToList();
                            break;
                        case "Stock":
                            products = products.Where(p => p.Stock == int.Parse(filterItem)).ToList();
                            break;
                        default:
                            result.exeptionMessage.Add("Geçerli bir filtre giriniz");
                            break;
                    }
                }
                //filtreleme işlemine ait mesaj basımı
                result.operations.Add(String.Format("Filtreleme :Filtre Adı {0}. Karşılaştırma Değeri: {1}. Tür: {2}", filterName, filterItem, extens.GetEnumDisplayName(type)));

                //pagination
                result.totalEntityCount = products.Count;
                if (pageSize > result.totalEntityCount || pageSize < 1)
                {
                    if (pageSize < 1)
                    {
                        result.exeptionMessage.Add(String.Format(
                            "Minimum sayfa genişliği 1 olmalıdır.{0} miktarı geçersiz olduğundan her sayfada 1 ürün gösterilecektir.",
                            pageSize));
                        pageSize = 1;
                    }
                    else
                    {
                        result.exeptionMessage.Add(String.Format(
                            "Maksimum sayfa genişliği {0} olmalıdır. {1} miktarı geçersiz olduğundan sayfada {2} ürün gösterilecektir."
                            , result.totalEntityCount, pageSize, result.totalEntityCount));
                        pageSize = result.totalEntityCount;
                    }
                }

                result.totalPageCount = (int)Math.Ceiling(result.totalEntityCount / (double)pageSize);

                if (pageNumber > result.totalPageCount || pageNumber < 1)
                {
                    if (pageNumber < 1)
                    {
                        result.exeptionMessage.Add(String.Format(
                            "{0} sayfa numarası geçersiz olduğundan ilk sayfa gösterilecektir", pageNumber));
                        pageNumber = 1;
                    }
                    else
                    {
                        result.exeptionMessage.Add(String.Format(
                            "Toplam sayfa sayısı {0}. {1} nolu sayfa olmadığından son sayfa gösterilecektir",
                            result.totalPageCount, pageNumber));
                        pageNumber = result.totalPageCount;
                    }
                }
                result.pageNumber = pageNumber;
                products = products.Skip((pageNumber - 1) * pageSize).Take(pageSize).ToList();
                List<ListProductModel> productList = _mapper.Map<List<TalhaMarket.DB.Entities.Product>, List<ListProductModel>>(products);
                result.entities = productList;
                result.operations.Add(String.Format("Sayfalama: Sayfadaki Toplam Ürün {0}, Sayfa Sayısı {1}", products.Count, pageNumber));

            }
            if (result.entities.Count > 0)
            {
                result.isSuccess = true;
                result.exeptionMessage.Add("İşlem Başarılı.");
            }
            else
            {
                result.exeptionMessage.Add("İşlemlere uyan ürün bulunmamaktadır.");
            }
            return result;
        }
    }
}
