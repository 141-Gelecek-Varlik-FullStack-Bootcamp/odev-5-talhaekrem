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
    public class MailManager : IMailService
    {
        //private readonly SmtpConfigDto
        private readonly IUserService _userService;
        public MailManager(IUserService userService)
        {
            _userService = userService;
        }

        public async Task SendWelcomeMail(int userId)
        {
            using var client = CreateSmtpClient();
            var user = _userService.GetUser(userId);
            MimeMessage message = new MimeMessage();

            MailboxAddress from = new MailboxAddress("Talha Market", "talhaekrem0@yandex.com");
            message.From.Add(from);

            MailboxAddress to = new MailboxAddress(user.Entity.Name, user.Entity.Email);
            message.To.Add(to);
            message.Subject = "Hos Geldiniz";
            BodyBuilder body = new BodyBuilder();
            body.HtmlBody = $"<h2>Talha Markete Hoş Geldin {user.Entity.Name} {user.Entity.SurName}!</h2><h5>Sizi burada görmekten dolayı çok mutluyuz.</h5><p>Hemen ürünlerini satmaya başla</p>";
            body.TextBody = "Ürünleriniz milyonlara ulaşması dileğiyle...";
            message.Body = body.ToMessageBody();
            await client.SendAsync(message);
            client.Disconnect(true);
            client.Dispose();
        }

        private SmtpClient CreateSmtpClient()
        {
            SmtpClient smtp = new SmtpClient();
            smtp.Connect("smtp.yandex.com", 465, true);
            smtp.Authenticate("talhaekrem0@yandex.com", "utcatnisyvmvweje");
            //SmtpClient smtp = new SmtpClient("smtp.yandex.ru", 465);
            //smtp.UseDefaultCredentials = false;
            //smtp.Credentials = new NetworkCredential("talhaekrem0@yandex.com", "talha.123");
            //smtp.EnableSsl = true;
            return smtp;
        }
    }
}