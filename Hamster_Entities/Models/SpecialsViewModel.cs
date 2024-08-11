using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Hamster_Entities.Models
{
    public class SpecialsViewModel : OrtakViewModel
    {
        [Required(ErrorMessage = "Sıra No Boş Girilemez")]
        public int? SiraNo { get; set; }

        public string? Orta { get; set; }

        public string? stringSonuc { get; set; }

        public DateTime? GeriSayim { get; set; }

        public int? TimeDifferenceInSeconds { get; set; }
    }
}
