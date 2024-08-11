using Hamster_Business.Interfaces;
using Hamster_DataAccess.EFOperations;
using Hamster_Entities.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Hamster_Business.Managers
{
    public class HamsterManager:BaseManager,IHamsterService
    {
        public HamsterViewModel HamsterListesi(int KullaniciId)
        {
            return new EFHamster().HamsterListesi(KullaniciId);
        }

        public List<TablolarViewModel> BuyuklerListesi(int KullaniciId)
        {
            return new EFHamster().BuyuklerListesi(KullaniciId);
        }

        public List<TablolarViewModel> KucuklerListesi(int KullaniciId)
        {
            return new EFHamster().KucuklerListesi(KullaniciId);
        }

        public List<TablolarViewModel> SearchListesi(string searchTerm, int KullaniciId)
        {
            return new EFHamster().SearchListesi(searchTerm, KullaniciId);
        }
    }
}
