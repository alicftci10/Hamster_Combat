using Hamster_DataAccess.DBContext;
using Hamster_DataAccess.DBModels;
using Hamster_DataAccess.EFInterface;
using Hamster_DataAccess.GenericRepository.Repository;
using Hamster_Entities.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

namespace Hamster_DataAccess.EFOperations
{
	public class EFSpecials : GenericRepository<Special>, IEFSpecialsRepository
	{
		public EFSpecials(HamsterContext hamsterContext) : base(hamsterContext) { }

		public List<SpecialsViewModel> List(string searchTerm, int KullaniciId)
		{
		buraya:

			using (HamsterContext hs = new HamsterContext())
			{
				var query = hs.Specials.AsQueryable();

				if (!string.IsNullOrEmpty(searchTerm))
				{
					query = query.Where(i => i.Sol.Contains(searchTerm) || i.Orta.Contains(searchTerm) || i.Sag.Contains(searchTerm) || Convert.ToString(i.SaatlikKazanc).Contains(searchTerm) || Convert.ToString(i.YukseltmeMaliyeti).Contains(searchTerm) || Convert.ToString(i.Sonuc).Contains(searchTerm));
				}

				var modelList = query.Where(i => i.KullaniciId == KullaniciId).Select(i => new SpecialsViewModel
				{
					Id = i.Id,
					SiraNo = i.SiraNo,
					Sol = i.Sol,
					Orta = i.Orta,
					Sag = i.Sag,
					SaatlikKazanc = i.SaatlikKazanc,
					YukseltmeMaliyeti = i.YukseltmeMaliyeti,
					Sonuc = i.Sonuc,
					GeriSayim = i.GeriSayim,
					TimeDifferenceInSeconds = (i.GeriSayim.HasValue ? (int)(i.GeriSayim.Value - DateTime.Now).TotalSeconds : (int?)null),
					KullaniciId = i.KullaniciId,
					stringSonuc = i.GeriSayim < DateTime.Now ? "You own this card" : null

				}).ToList();

				foreach (var item in modelList)
				{
					if (item.GeriSayim < DateTime.Now && item.Orta != null)
					{
						Special s = hs.Specials.FirstOrDefault(i => i.Id == item.Id);

						s.Sag = s.Orta;
						s.Orta = null;

						hs.Specials.Update(s);
						hs.SaveChanges();

						Change(KullaniciId);

						goto buraya;
					}
				}

				return modelList;
			}
		}

		public void Change(int KullaniciId)
		{
			using (HamsterContext hs = new HamsterContext())
			{
				var solList = hs.Specials.OrderByDescending(i => i.SiraNo).Where(i => i.Sol != null && i.KullaniciId == KullaniciId).ToList();
				var ortaList = hs.Specials.OrderByDescending(i => i.SiraNo).Where(i => i.Orta != null && i.KullaniciId == KullaniciId).ToList();
				var sagList = hs.Specials.OrderByDescending(i => i.SiraNo).Where(i => i.Sag != null && i.KullaniciId == KullaniciId).ToList();

				var siraNoMax = 200;
				var siraNoMin = 100;

				foreach (var item in solList)
				{
					Special s = hs.Specials.FirstOrDefault(i => i.Id == item.Id);

					s.Sag = item.Sol;
					s.Sol = null;

					s.SiraNo = siraNoMax;
					siraNoMax--;

					hs.Specials.Update(s);
					hs.SaveChanges();
				}

				foreach (var item in sagList)
				{
					Special s = hs.Specials.FirstOrDefault(i => i.Id == item.Id);

					s.Sol = item.Sag;
					s.Sag = null;

					s.SiraNo = siraNoMin;
					siraNoMin--;

					hs.Specials.Update(s);
					hs.SaveChanges();
				}

				foreach (var item in ortaList)
				{
					Special s = hs.Specials.FirstOrDefault(i => i.Id == item.Id);

					s.SiraNo = siraNoMin;
					siraNoMin--;

					hs.Specials.Update(s);
					hs.SaveChanges();
				}
			}
		}
	}
}