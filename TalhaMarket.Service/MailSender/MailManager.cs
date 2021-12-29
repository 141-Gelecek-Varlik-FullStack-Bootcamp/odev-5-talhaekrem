using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TalhaMarket.Service.User;
using MailKit.Net.Smtp;
using MimeKit;
namespace TalhaMarket.Service.MailSender
{
    //mail yollama servisidir. Hangfire delayed olarak tetiklenince burası çalışacaktır.
    //mail yollamak için Mimekit paketini kullanıyorum. Çoğu portu destekler.
    public class MailManager : IMailService
    {
        private readonly IUserService _userService;
        public MailManager(IUserService userService)
        {
            _userService = userService;
        }

        //öncelikle userIdyi alıyorum. Maili yollayacağım kullanıcıya ait bilgileri veritabanından almak için(adı, soyadı, e posta adresi...)
        public async Task SendWelcomeMail(int userId)
        {
            //altta private olarak tanımladığım smtp bağlantısını kurgulayıp çalıştırıyorum.
            using var client = CreateSmtpClient();
            //userı alıyorum.
            var user = _userService.GetUser(userId);
            //mail yollama servisi
            MimeMessage message = new MimeMessage();

            //maili yollayan kişinin görünen adı ve maili
            MailboxAddress from = new MailboxAddress("Talha Market", "talhaekrem0@yandex.com");
            message.From.Add(from);

            //maili alacak kişinin görünen adı ve maili
            MailboxAddress to = new MailboxAddress($"{user.Entity.Name}", user.Entity.Email);
            message.To.Add(to);
            //mailin konusu
            message.Subject = "Talha Markete Hoş Geldiniz";
            //mailin spama düşmemesi için Headerda Unsubscribe seçeneği olması gerekiyor.Yandexin makalelerinde yazıyordu. onu ekliyorum
            message.Headers.Add("List-Unsubscribe", "<mailto:talhekrem0@yandex.com?subject=unsubscribe>");
            //mesaj içeriğini html olarak hazırlıyorum.
            message.Body = new TextPart("html")
            {
                Text = String.Format(@"<h1>Talha Markete Hoş Geldin {0} {1}</h1><h2>Sizi burada görmekten dolayı çok mutluyuz.</h2><hr><h4>Hemen ürünlerini satmaya başla</h4><p><i>Ürünlerinizin milyonlara ulaşması dileğiyle...</i></p><br>--Talha Market Mail Sender With <b>Hangfire</b><hr>", user.Entity.Name, user.Entity.SurName)
            };
            //asenkron olarak maili yolla ve smtpden çıkış yap, bırak
            await client.SendAsync(message);
            client.Disconnect(true);
            client.Dispose();
        }

        //gmailin smtp servisi, ücretli olan workspace hesabı istediğinden yandexin ücretsiz servisini kullanıyorum.
        // Connect yeri sabittir. İnternette mevcut. bağantıyı kurduktan sonra maili atacak ana hesabı girmeniz gerekiyor.
        //bunun için kendime yandex hesabı oluşturdum. İnternette nasıl Authenticate yapılacağına dair yazılar mevcuttur.
        // Lütfen benim hesabını kullanmayın. Kendinize hesap açıp kendi şifrenizi oluşturun.
        private SmtpClient CreateSmtpClient()
        {
            SmtpClient smtp = new SmtpClient();
            smtp.Connect("smtp.yandex.com", 465, true);
            smtp.Authenticate("talhaekrem0@yandex.com", "njfqmehnzooebuum");
            return smtp;
        }
    }
}