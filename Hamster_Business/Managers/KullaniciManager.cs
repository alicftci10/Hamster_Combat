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
    public class KullaniciManager : BaseManager, IKullaniciService
    {
		private readonly IEFKullaniciRepository _KullaniciRepository;
		public KullaniciManager(IEFKullaniciRepository KullaniciRepository)
		{
			_KullaniciRepository = KullaniciRepository;
		}

		public KullaniciViewModel GetKullanici(KullaniciViewModel model)
        {
            string? ErrorMessage = null;
            Kullanici kul = _KullaniciRepository.GetKullanici(model, out ErrorMessage);
            
            model.Id = kul.Id;
            model.Ad = kul.Ad;
            model.Soyad = kul.Soyad;
            model.KullaniciAdi = kul.KullaniciAdi;
            model.Sifre = kul.Sifre;
            model.Yetki = kul.Yetki;
            model.KayitTarihi = kul.KayitTarihi;
            model.ErrorMessage = ErrorMessage;

            return model;
        }

        private Kullanici GetViewModel(KullaniciViewModel model)
        {
            Kullanici item = new Kullanici();

            item.Ad = model.Ad;
            item.Soyad = model.Soyad;
            item.KullaniciAdi = model.KullaniciAdi;
            item.Sifre = model.Sifre;
            item.KayitTarihi = DateTime.Now;
            item.Yetki = model.Yetki.Value;

            if (model.Id > 0)
            {
                item.Id = model.Id;
            }

            return item;
        }

        public KullaniciListViewModel GetList(string KullaniciAdi, int? Yetki, string? ErrorMessage)
        {
            return _KullaniciRepository.List(KullaniciAdi, Yetki, ErrorMessage);
        }

        public Kullanici GetId(int pId)
        {
            return _KullaniciRepository.GetSelect(pId);
        }

        public int Add(KullaniciViewModel item)
        {
            return _KullaniciRepository.Add(GetViewModel(item)).Id;
        }

        public int Update(KullaniciViewModel item)
        {
            return _KullaniciRepository.Update(GetViewModel(item)).Id;
        }

        public Kullanici Delete(int pId)
        {
            return _KullaniciRepository.Delete(pId);
        }
    }
}
