using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Hamster_Entities.Models
{
    public class TablolarViewModel
    {
        public int Id { get; set; }

        public string? Sol { get; set; }

        public string? Sag { get; set; }

        public int? SaatlikKazanc { get; set; }

        public int? YukseltmeMaliyeti { get; set; }

        public decimal Sonuc { get; set; }

        public int KullaniciId { get; set; }

        public int? SiraNo { get; set; }

        public string? Orta { get; set; }

        public string? stringSonuc { get; set; }

        public DateTime? GeriSayim { get; set; }

        public int? TimeDifferenceInSeconds { get; set; }

        public string? Tablo { get; set; }
    }
}
