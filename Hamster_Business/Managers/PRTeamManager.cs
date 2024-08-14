using Hamster_Business.Interfaces;
using Hamster_DataAccess.DBModels;
using Hamster_DataAccess.EFInterface;
using Hamster_DataAccess.EFOperations;
using Hamster_Entities.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Hamster_Business.Managers
{
    public class PRTeamManager : BaseManager, IPRTeamService
    {
        private readonly IEFPRTeamRepository _PRTeamRepository;
        public PRTeamManager(IEFPRTeamRepository PRTeamRepository)
        {
            _PRTeamRepository = PRTeamRepository;
        }

        private PrTeam GetViewModel(OrtakViewModel model)
        {
            PrTeam item = new PrTeam();

            item.Sol = model.Sol;
            item.Sag = model.Sag;
            item.SaatlikKazanc = model.SaatlikKazanc.Value;
            item.YukseltmeMaliyeti = model.YukseltmeMaliyeti.Value;

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

        public List<OrtakViewModel> GetList(string searchTerm, int KullaniciId)
        {
            return _PRTeamRepository.List(searchTerm, KullaniciId);
        }

        public PrTeam GetId(int pId)
        {
            return _PRTeamRepository.GetSelect(pId);
        }

        public int Add(OrtakViewModel item)
        {
            return _PRTeamRepository.Add(GetViewModel(item)).Id;
        }

        public int Update(OrtakViewModel item)
        {
            return _PRTeamRepository.Update(GetViewModel(item)).Id;
        }

        public PrTeam Delete(int pId)
        {
            return _PRTeamRepository.Delete(pId);
        }
    }
}
