using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TalhaMarket.Core.Helpers
{
    public enum filterEnum
    {
        [Display(Name = "Üstünde")]
        over = 0,
        [Display(Name = "Altında")]
        under = 1,
        [Display(Name = "Eşit")]
        equal = 2
    }
}