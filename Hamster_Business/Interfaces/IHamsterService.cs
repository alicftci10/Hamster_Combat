using Hamster_DataAccess.EFOperations;
using Hamster_Entities.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Hamster_Business.Interfaces
{
    public interface IHamsterService
    {
        HamsterViewModel HamsterListesi(int KullaniciId);

        List<TablolarViewModel> BuyuklerListesi(int KullaniciId);

        List<TablolarViewModel> KucuklerListesi(int KullaniciId);

        List<TablolarViewModel> SearchListesi(string searchTerm, int KullaniciId);
    }
}
