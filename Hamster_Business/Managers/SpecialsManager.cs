using Hamster_Business.Interfaces;
using Hamster_DataAccess.DBModels;
using Hamster_DataAccess.EFOperations;
using Hamster_Entities.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Hamster_Business.Managers
{
    public class SpecialsManager:BaseManager,ISpecialsService
    {
        private Special GetViewModel(SpecialsViewModel model)
        {
            Special item = new Special();

            item.SiraNo = model.SiraNo.Value;
            item.Sol = model.Sol;
            item.Orta = model.Orta;
            item.Sag = model.Sag;
            item.SaatlikKazanc = model.SaatlikKazanc.Value;
            item.YukseltmeMaliyeti = model.YukseltmeMaliyeti.Value;
            item.GeriSayim = model.GeriSayim;

            item.KullaniciId = model.KullaniciId;

            decimal kazanc = Convert.ToDecimal(model.SaatlikKazanc);
            decimal maliyet = Convert.ToDecimal(model.YukseltmeMaliyeti);

            model.Sonuc = Math.Round(kazanc * 100000 / maliyet, 2);

            item.Sonuc = model.Sonuc;

            if (model.Id > 0)
            {
                item.Id = model.Id;
            }

            return item;
        }

        public List<SpecialsViewModel> GetList(string searchTerm, int KullaniciId)
        {
            return new EFSpecials().List(searchTerm, KullaniciId);
        }

        public Special GetId(int pId)
        {
            return new EFSpecials().GetSelect(pId);
        }

        public int Add(SpecialsViewModel item)
        {
            return new EFSpecials().Add(GetViewModel(item));
        }

        public int Update(SpecialsViewModel item)
        {
            return new EFSpecials().Update(GetViewModel(item));
        }

        public Special Delete(int pId)
        {
            return new EFSpecials().Delete(pId);
        }

        public void Change(int KullaniciId)
        {
            new EFSpecials().Change(KullaniciId);
        }
    }
}
