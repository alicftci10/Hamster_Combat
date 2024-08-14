using Hamster_DataAccess.DBContext;
using Hamster_DataAccess.DBModels;
using Hamster_DataAccess.EFInterface;
using Hamster_DataAccess.GenericRepository.Repository;
using Hamster_Entities.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Hamster_DataAccess.EFOperations
{
	public class EFWeb3 : GenericRepository<Web3>, IEFWeb3Repository
	{
		public EFWeb3(HamsterContext hamsterContext) : base(hamsterContext) { }

		public List<OrtakViewModel> List(string searchTerm, int KullaniciId)
		{
			using (HamsterContext hs = new HamsterContext())
			{
				var query = hs.Web3s.AsQueryable();

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
	}
}
