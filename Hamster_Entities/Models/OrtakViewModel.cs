using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Hamster_Entities.Models
{
    public class OrtakViewModel : BaseViewModel
    {
        public int Id { get; set; }

        public string? Sol { get; set; }

        public string? Sag { get; set; }

        [Required(ErrorMessage = "Saatlik Kazanç Boş Girilemez")]
        public int? SaatlikKazanc { get; set; }

        [Required(ErrorMessage = "Yükseltme Maliyeti Boş Girilemez")]
        public int? YukseltmeMaliyeti { get; set; }

        public decimal Sonuc { get; set; }

        public int KullaniciId { get; set; }
    }
}
