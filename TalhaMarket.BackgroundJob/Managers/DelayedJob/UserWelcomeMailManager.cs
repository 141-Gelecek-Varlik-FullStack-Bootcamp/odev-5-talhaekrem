using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TalhaMarket.Service.MailSender;

namespace TalhaMarket.BackgroundJob.Managers.DelayedJob
{
    public class UserWelcomeMailManager
    {
        private readonly IMailService _mailService;

        public UserWelcomeMailManager(IMailService mailService)
        {
            _mailService = mailService ?? throw new ArgumentNullException(nameof(mailService));
        }
        public async Task Process(int userId)
        {
            await _mailService.SendWelcomeMail(userId);
        }
    }
}
