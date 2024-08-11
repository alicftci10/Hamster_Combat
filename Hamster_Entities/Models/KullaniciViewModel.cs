using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Hamster_Entities.Models
{
    public class KullaniciViewModel
    {
        public int Id { get; set; }

        [Required(ErrorMessage = "Ad Boş Girilemez")]
        public string Ad { get; set; }

        [Required(ErrorMessage = "Soyad Boş Girilemez")]
        public string Soyad { get; set; }

        [Required(ErrorMessage = "Kullanıcı Adı Boş Girilemez")]
        public string KullaniciAdi { get; set; }

        [Required(ErrorMessage = "Şifre Boş Girilemez")]
        public string Sifre { get; set; }

        [Required(ErrorMessage = "Yetki Boş Girilemez")]
        public int? Yetki { get; set; }

        public DateTime KayitTarihi { get; set; }

        public string? ErrorMessage { get; set; }

        public bool IsSuccess { get; set; }

        public string? JwtToken { get; set; }
    }
}
