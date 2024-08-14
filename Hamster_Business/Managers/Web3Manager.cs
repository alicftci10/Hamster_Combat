using Hamster_Business.Interfaces;
using Hamster_DataAccess.DBModels;
using Hamster_DataAccess.EFInterface;
using Hamster_DataAccess.EFOperations;
using Hamster_Entities.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Hamster_Business.Managers
{
    public class Web3Manager:BaseManager,IWeb3Service
    {
		private readonly IEFWeb3Repository _Web3Repository;
		public Web3Manager(IEFWeb3Repository Web3Repository)
		{
			_Web3Repository = Web3Repository;
		}

		private Web3 GetViewModel(OrtakViewModel model)
        {
            Web3 item = new Web3();

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
            return _Web3Repository.List(searchTerm, KullaniciId);
        }

        public Web3 GetId(int pId)
        {
            return _Web3Repository.GetSelect(pId);
        }

        public int Add(OrtakViewModel item)
        {
            return _Web3Repository.Add(GetViewModel(item)).Id;
        }

        public int Update(OrtakViewModel item)
        {
            return _Web3Repository.Update(GetViewModel(item)).Id;
        }

        public Web3 Delete(int pId)
        {
            return _Web3Repository.Delete(pId);
        }
    }
}
