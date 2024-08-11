using Hamster_DataAccess.DBContext;
using Hamster_DataAccess.DBModels;
using Hamster_Entities.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Hamster_DataAccess.EFOperations
{
    public class EFPRTeam : EFBase
    {
        public List<OrtakViewModel> List(string searchTerm, int KullaniciId)
        {
            using (HamsterContext hs = new HamsterContext())
            {
                var query = hs.PrTeams.AsQueryable();

                if (!string.IsNullOrEmpty(searchTerm))
                {
                    query = query.Where(i => i.Sol.Contains(searchTerm) || i.Sag.Contains(searchTerm) || Convert.ToString(i.SaatlikKazanc).Contains(searchTerm) || Convert.ToString(i.YukseltmeMaliyeti).Contains(searchTerm) || Convert.ToString(i.Sonuc).Contains(searchTerm));
                }

                var modelList = query.Where(i => i.KullaniciId == KullaniciId).Select(i => new OrtakViewModel
                {
                    Id = i.Id,
                    Sol = i.Sol,
                    Sag = i.Sag,
                    SaatlikKazanc = i.SaatlikKazanc,
                    YukseltmeMaliyeti = i.YukseltmeMaliyeti,
                    Sonuc = i.Sonuc,
                    KullaniciId = i.KullaniciId

                }).ToList();

                return modelList;
            }
        }

        public PrTeam GetSelect(int pId)
        {
            using (HamsterContext hs = new HamsterContext())
            {
                var select = hs.PrTeams.FirstOrDefault(i => i.Id == pId);
                return select;
            }
        }

        public int Add(PrTeam item)
        {
            using (HamsterContext hs = new HamsterContext())
            {
                hs.PrTeams.Add(item);
                return hs.SaveChanges();
            }
        }

        public int Update(PrTeam item)
        {
            using (HamsterContext hs = new HamsterContext())
            {
                hs.PrTeams.Update(item);
                return hs.SaveChanges();
            }
        }
        public PrTeam Delete(int pId)
        {
            using (HamsterContext hs = new HamsterContext())
            {
                var delete = hs.PrTeams.FirstOrDefault(i => i.Id == pId);

                hs.PrTeams.Remove(delete);
                hs.SaveChanges();
                return delete;
            }
        }
    }
}
