using System;
using System.Collections.Generic;

namespace Hamster_DataAccess.DBModels;

public partial class Market
{
    public int Id { get; set; }

    public string? Sol { get; set; }

    public string? Sag { get; set; }

    public int SaatlikKazanc { get; set; }

    public int YukseltmeMaliyeti { get; set; }

    public decimal Sonuc { get; set; }

    public int KullaniciId { get; set; }

    public virtual Kullanici Kullanici { get; set; } = null!;
}
