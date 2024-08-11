using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Hamster_Entities.Models
{
    public class KullaniciListViewModel
    {
        public List<KullaniciViewModel> Kullanicilar { get; set; }

        public string? ErrorMessage { get; set; }
    }
}
