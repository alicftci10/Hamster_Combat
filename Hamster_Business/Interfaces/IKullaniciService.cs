using Hamster_DataAccess.DBModels;
using Hamster_Entities.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Hamster_Business.Interfaces
{
    public interface IKullaniciService
    {
        KullaniciViewModel GetKullanici(KullaniciViewModel model);

        KullaniciListViewModel GetList(string KullaniciAdi, int? Yetki, string? ErrorMessage);

        Kullanici GetId(int pId);

        int Add(KullaniciViewModel item);

        int Update(KullaniciViewModel item);

        Kullanici Delete(int pId);
    }
}
