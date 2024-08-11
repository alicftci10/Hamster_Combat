using System;
using System.Collections.Generic;

namespace Hamster_DataAccess.DBModels;

public partial class Kullanici
{
    public int Id { get; set; }

    public string Ad { get; set; } = null!;

    public string Soyad { get; set; } = null!;

    public string KullaniciAdi { get; set; } = null!;

    public string Sifre { get; set; } = null!;

    public int Yetki { get; set; }

    public DateTime KayitTarihi { get; set; }

    public virtual ICollection<Legal> Legals { get; set; } = new List<Legal>();

    public virtual ICollection<Market> Markets { get; set; } = new List<Market>();

    public virtual ICollection<PrTeam> PrTeams { get; set; } = new List<PrTeam>();

    public virtual ICollection<Special> Specials { get; set; } = new List<Special>();

    public virtual ICollection<Web3> Web3s { get; set; } = new List<Web3>();

    public virtual Yetki YetkiNavigation { get; set; } = null!;
}
