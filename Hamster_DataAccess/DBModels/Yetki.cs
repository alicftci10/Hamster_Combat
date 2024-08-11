using System;
using System.Collections.Generic;

namespace Hamster_DataAccess.DBModels;

public partial class Yetki
{
    public int Id { get; set; }

    public string YetkiAdi { get; set; } = null!;

    public virtual ICollection<Kullanici> Kullanicis { get; set; } = new List<Kullanici>();
}
