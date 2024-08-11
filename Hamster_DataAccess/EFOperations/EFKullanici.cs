using Hamster_DataAccess.DBContext;
using Hamster_DataAccess.DBModels;
using Hamster_Entities.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

namespace Hamster_DataAccess.EFOperations
{
    public class EFKullanici : EFBase
    {
        public Kullanici GetKullanici(KullaniciViewModel model, out string? ErrorMessage)
        {
            using (HamsterContext hs = new HamsterContext())
            {
                var kullanici = hs.Kullanicis.FirstOrDefault(i => i.KullaniciAdi == model.KullaniciAdi && i.Sifre == model.Sifre);
                var kullaniciadi = hs.Kullanicis.FirstOrDefault(i => i.KullaniciAdi == model.KullaniciAdi);
                var sifre = hs.Kullanicis.FirstOrDefault(i => i.Sifre == model.Sifre);

                if (kullanici != null)
                {
                    ErrorMessage = null;
                    return kullanici;
                }
                else if (kullaniciadi != null && kullaniciadi.Sifre != model.Sifre)
                {
                    ErrorMessage = "1";
                }
                else if (sifre != null && sifre.KullaniciAdi != model.KullaniciAdi)
                {
                    ErrorMessage = "2";
                }
                else
                {
                    ErrorMessage = "3";
                }

                return new Kullanici();
            }
        }

        public KullaniciListViewModel List(string KullaniciAdi, int? Yetki, string? ErrorMessage)
        {
            var viewModel = new KullaniciListViewModel
            {
                Kullanicilar = new List<KullaniciViewModel>()
            };

            using (HamsterContext hs = new HamsterContext())
            {
                viewModel.Kullanicilar = hs.Kullanicis.Select(i => new KullaniciViewModel
                {
                    Id = i.Id,
                    Ad = i.Ad,
                    Soyad = i.Soyad,
                    KullaniciAdi = i.KullaniciAdi,
                    Sifre = i.Sifre,
                    KayitTarihi = i.KayitTarihi,
                    Yetki = i.Yetki
                }).ToList();

                if (Yetki == 2)
                {
                    foreach (var item in viewModel.Kullanicilar)
                    {
                        if (item.KullaniciAdi != KullaniciAdi)
                        {
                            item.Sifre = "****";
                        }
                    }
                }
            }

            viewModel.ErrorMessage = ErrorMessage;

            return viewModel;
        }

        public Kullanici GetSelect(int pId)
        {
            using (HamsterContext hs = new HamsterContext())
            {
                var select = hs.Kullanicis.FirstOrDefault(i => i.Id == pId);

                return select;
            }
        }

        public int Add(Kullanici item)
        {
            using (HamsterContext hs = new HamsterContext())
            {
                hs.Kullanicis.Add(item);
                return hs.SaveChanges();
            }
        }

        public int Update(Kullanici item)
        {
            using (HamsterContext hs = new HamsterContext())
            {
                hs.Kullanicis.Update(item);
                return hs.SaveChanges();
            }
        }
        public Kullanici Delete(int pId)
        {
            using (HamsterContext hs = new HamsterContext())
            {
                var delete = hs.Kullanicis.FirstOrDefault(i => i.Id == pId);

                hs.Kullanicis.Remove(delete);
                hs.SaveChanges();
                return delete;
            }
        }
    }
}
