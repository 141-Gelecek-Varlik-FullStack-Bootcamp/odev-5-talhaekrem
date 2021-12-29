using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TalhaMarket.BackgroundJob.Managers.DelayedJob;

namespace TalhaMarket.BackgroundJob.Schedules
{
    public static class DelayedJobs
    {
        [Obsolete]
        public static void SendWelcomeMailJob(int userId)
        {
            Hangfire.BackgroundJob.Schedule<UserWelcomeMailManager>(
                job => job.Process(userId), TimeSpan.FromDays(1));
        }
    }
}
