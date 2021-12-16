using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace TalhaMarket.Core.Helpers
{
    public static class extens
    {
        public static string GetEnumDisplayName(this Enum filterType)
        {
            var type = filterType.GetType().GetMember(filterType.ToString()).First().GetCustomAttribute<DisplayAttribute>().Name;
            return type;
        }
    }
}
