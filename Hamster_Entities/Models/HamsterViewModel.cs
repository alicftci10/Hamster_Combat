using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Hamster_Entities.Models
{
    public class HamsterViewModel
    {
        public int EnBuyukId { get; set; }
        public int EnKucukId { get; set; }
        public decimal? EnBuyukDeger { get; set; }
        public decimal? EnKucukDeger { get; set; }
        public string EnBuyukDegerText { get; set; }
        public string EnKucukDegerText { get; set; }
        public int EnBuyukKaydet { get; set; }
        public int EnKucukKaydet { get; set; }
        public int? MaxTimeDifferenceInSeconds { get; set; }
        public int? MinTimeDifferenceInSeconds { get; set; }
        public int? KullaniciId { get; set; }
    }
}
