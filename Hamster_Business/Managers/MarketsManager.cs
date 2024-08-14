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
	public class MarketsManager : BaseManager, IMarketsService
	{
		private readonly IEFMarketsRepository _MarketsRepository;
		public MarketsManager(IEFMarketsRepository MarketsRepository)
		{
			_MarketsRepository = MarketsRepository;
		}

		private Market GetViewModel(OrtakViewModel model)
		{
			Market item = new Market();

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
			return _MarketsRepository.List(searchTerm, KullaniciId);
		}

		public Market GetId(int pId)
		{
			return _MarketsRepository.GetSelect(pId);
		}

		public int Add(OrtakViewModel item)
		{
			return _MarketsRepository.Add(GetViewModel(item)).Id;
		}

		public int Update(OrtakViewModel item)
		{
			return _MarketsRepository.Update(GetViewModel(item)).Id;
		}

		public Market Delete(int pId)
		{
			return _MarketsRepository.Delete(pId);
		}
	}
}
