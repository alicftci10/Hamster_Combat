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
    public class EFHamster
    {
        public HamsterViewModel HamsterListesi(int KullaniciId)
        {
            HamsterViewModel icerik = new HamsterViewModel();

            using (HamsterContext hs = new HamsterContext())
            {
                var buyukPRTeams = hs.PrTeams.OrderByDescending(i => i.Sonuc).Where(i => i.KullaniciId == KullaniciId).FirstOrDefault();
                var buyukMarkets = hs.Markets.OrderByDescending(i => i.Sonuc).Where(i => i.KullaniciId == KullaniciId).FirstOrDefault();
                var buyukLegals = hs.Legals.OrderByDescending(i => i.Sonuc).Where(i => i.KullaniciId == KullaniciId).FirstOrDefault();
                var buyukWeb3 = hs.Web3s.OrderByDescending(i => i.Sonuc).Where(i => i.KullaniciId == KullaniciId).FirstOrDefault();
                var bSpecials = hs.Specials.OrderByDescending(i => i.Sonuc).Where(i => i.KullaniciId == KullaniciId).Select(i => new SpecialsViewModel
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

                List<SpecialsViewModel> buyukSpecialsList = new List<SpecialsViewModel>();
                foreach (var item in bSpecials)
                {
                    if (item.stringSonuc == null)
                    {
                        buyukSpecialsList.Add(item);
                    }
                }

                var buyukSpecials = buyukSpecialsList.FirstOrDefault();

                List<decimal> buyukler = new List<decimal>
                { buyukPRTeams?.Sonuc ?? 0, buyukMarkets?.Sonuc ?? 0, buyukLegals?.Sonuc ?? 0, buyukWeb3?.Sonuc ?? 0, buyukSpecials?.Sonuc ?? 0 };

                icerik.EnBuyukDeger = 0;

                foreach (var item in buyukler)
                {
                    if (item > icerik.EnBuyukDeger)
                    {
                        icerik.EnBuyukDeger = item;

                        if (icerik.EnBuyukDeger == buyukPRTeams?.Sonuc)
                        {
                            if (buyukPRTeams.Sol != null)
                            {
                                icerik.EnBuyukDegerText = buyukPRTeams.Sol;
                                icerik.EnBuyukKaydet = 1;
                                icerik.EnBuyukId = buyukPRTeams.Id;
                            }
                            else
                            {
                                icerik.EnBuyukDegerText = buyukPRTeams.Sag;
                                icerik.EnBuyukKaydet = 2;
                                icerik.EnBuyukId = buyukPRTeams.Id;
                            }
                        }

                        if (icerik.EnBuyukDeger == buyukMarkets?.Sonuc)
                        {
                            if (buyukMarkets.Sol != null)
                            {
                                icerik.EnBuyukDegerText = buyukMarkets.Sol;
                                icerik.EnBuyukKaydet = 3;
                                icerik.EnBuyukId = buyukMarkets.Id;
                            }
                            else
                            {
                                icerik.EnBuyukDegerText = buyukMarkets.Sag;
                                icerik.EnBuyukKaydet = 4;
                                icerik.EnBuyukId = buyukMarkets.Id;
                            }
                        }

                        if (icerik.EnBuyukDeger == buyukLegals?.Sonuc)
                        {
                            if (buyukLegals.Sol != null)
                            {
                                icerik.EnBuyukDegerText = buyukLegals.Sol;
                                icerik.EnBuyukKaydet = 5;
                                icerik.EnBuyukId = buyukLegals.Id;
                            }
                            else
                            {
                                icerik.EnBuyukDegerText = buyukLegals.Sag;
                                icerik.EnBuyukKaydet = 6;
                                icerik.EnBuyukId = buyukLegals.Id;
                            }
                        }

                        if (icerik.EnBuyukDeger == buyukWeb3?.Sonuc)
                        {
                            if (buyukWeb3.Sol != null)
                            {
                                icerik.EnBuyukDegerText = buyukWeb3.Sol;
                                icerik.EnBuyukKaydet = 7;
                                icerik.EnBuyukId = buyukWeb3.Id;
                            }
                            else
                            {
                                icerik.EnBuyukDegerText = buyukWeb3.Sag;
                                icerik.EnBuyukKaydet = 8;
                                icerik.EnBuyukId = buyukWeb3.Id;
                            }
                        }

                        if (icerik.EnBuyukDeger == buyukSpecials?.Sonuc)
                        {
                            if (buyukSpecials.Sol != null)
                            {
                                icerik.EnBuyukDegerText = buyukSpecials.Sol;
                                icerik.EnBuyukKaydet = 9;
                                icerik.EnBuyukId = buyukSpecials.Id;
                                icerik.MaxTimeDifferenceInSeconds = buyukSpecials.TimeDifferenceInSeconds;
                            }
                            else if (buyukSpecials.Orta != null)
                            {
                                icerik.EnBuyukDegerText = buyukSpecials.Orta;
                                icerik.EnBuyukKaydet = 10;
                                icerik.EnBuyukId = buyukSpecials.Id;
                                icerik.MaxTimeDifferenceInSeconds = buyukSpecials.TimeDifferenceInSeconds;
                            }
                            else
                            {
                                icerik.EnBuyukDegerText = buyukSpecials.Sag;
                                icerik.EnBuyukKaydet = 11;
                                icerik.EnBuyukId = buyukSpecials.Id;
                                icerik.MaxTimeDifferenceInSeconds = buyukSpecials.TimeDifferenceInSeconds;
                            }
                        }
                    }
                }

                if (icerik.EnBuyukDeger == 0)
                {
                    icerik.EnBuyukDeger = null;
                }

                var kucukPRTeams = hs.PrTeams.OrderBy(i => i.Sonuc).Where(i => i.KullaniciId == KullaniciId).FirstOrDefault();
                var kucukMarkets = hs.Markets.OrderBy(i => i.Sonuc).Where(i => i.KullaniciId == KullaniciId).FirstOrDefault();
                var kucukLegals = hs.Legals.OrderBy(i => i.Sonuc).Where(i => i.KullaniciId == KullaniciId).FirstOrDefault();
                var kucukWeb3 = hs.Web3s.OrderBy(i => i.Sonuc).Where(i => i.KullaniciId == KullaniciId).FirstOrDefault();
                var kSpecials = hs.Specials.OrderBy(i => i.Sonuc).Where(i => i.KullaniciId == KullaniciId).Select(i => new SpecialsViewModel
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

                List<SpecialsViewModel> kucukSpecialsList = new List<SpecialsViewModel>();
                foreach (var item in kSpecials)
                {
                    if (item.stringSonuc == null)
                    {
                        kucukSpecialsList.Add(item);
                    }
                }

                var kucukSpecials = kucukSpecialsList.FirstOrDefault();

                List<decimal> kucukler = new List<decimal>
                { kucukPRTeams?.Sonuc ?? decimal.MaxValue, kucukMarkets?.Sonuc ?? decimal.MaxValue, kucukLegals?.Sonuc ?? decimal.MaxValue, kucukWeb3?.Sonuc ?? decimal.MaxValue, kucukSpecials?.Sonuc ?? decimal.MaxValue };

                icerik.EnKucukDeger = decimal.MaxValue;

                foreach (var item in kucukler)
                {
                    if (item < icerik.EnKucukDeger)
                    {
                        icerik.EnKucukDeger = item;

                        if (icerik.EnKucukDeger == kucukPRTeams?.Sonuc)
                        {
                            if (kucukPRTeams.Sol != null)
                            {
                                icerik.EnKucukDegerText = kucukPRTeams.Sol;
                                icerik.EnKucukKaydet = 1;
                                icerik.EnKucukId = kucukPRTeams.Id;
                            }
                            else
                            {
                                icerik.EnKucukDegerText = kucukPRTeams.Sag;
                                icerik.EnKucukKaydet = 2;
                                icerik.EnKucukId = kucukPRTeams.Id;
                            }
                        }

                        if (icerik.EnKucukDeger == kucukMarkets?.Sonuc)
                        {
                            if (kucukMarkets.Sol != null)
                            {
                                icerik.EnKucukDegerText = kucukMarkets.Sol;
                                icerik.EnKucukKaydet = 3;
                                icerik.EnKucukId = kucukMarkets.Id;
                            }
                            else
                            {
                                icerik.EnKucukDegerText = kucukMarkets.Sag;
                                icerik.EnKucukKaydet = 4;
                                icerik.EnKucukId = kucukMarkets.Id;
                            }
                        }

                        if (icerik.EnKucukDeger == kucukLegals?.Sonuc)
                        {
                            if (kucukLegals.Sol != null)
                            {
                                icerik.EnKucukDegerText = kucukLegals.Sol;
                                icerik.EnKucukKaydet = 5;
                                icerik.EnKucukId = kucukLegals.Id;
                            }
                            else
                            {
                                icerik.EnKucukDegerText = kucukLegals.Sag;
                                icerik.EnKucukKaydet = 6;
                                icerik.EnKucukId = kucukLegals.Id;
                            }
                        }

                        if (icerik.EnKucukDeger == kucukWeb3?.Sonuc)
                        {
                            if (kucukWeb3.Sol != null)
                            {
                                icerik.EnKucukDegerText = kucukWeb3.Sol;
                                icerik.EnKucukKaydet = 7;
                                icerik.EnKucukId = kucukWeb3.Id;
                            }
                            else
                            {
                                icerik.EnKucukDegerText = kucukWeb3.Sag;
                                icerik.EnKucukKaydet = 8;
                                icerik.EnKucukId = kucukWeb3.Id;
                            }
                        }

                        if (icerik.EnKucukDeger == kucukSpecials?.Sonuc)
                        {
                            if (kucukSpecials.Sol != null)
                            {
                                icerik.EnKucukDegerText = kucukSpecials.Sol;
                                icerik.EnKucukKaydet = 9;
                                icerik.EnKucukId = kucukSpecials.Id;
                                icerik.MinTimeDifferenceInSeconds = kucukSpecials.TimeDifferenceInSeconds;
                            }
                            else if (kucukSpecials.Orta != null)
                            {
                                icerik.EnKucukDegerText = kucukSpecials.Orta;
                                icerik.EnKucukKaydet = 10;
                                icerik.EnKucukId = kucukSpecials.Id;
                                icerik.MinTimeDifferenceInSeconds = kucukSpecials.TimeDifferenceInSeconds;
                            }
                            else
                            {
                                icerik.EnKucukDegerText = kucukSpecials.Sag;
                                icerik.EnKucukKaydet = 11;
                                icerik.EnKucukId = kucukSpecials.Id;
                                icerik.MinTimeDifferenceInSeconds = kucukSpecials.TimeDifferenceInSeconds;
                            }
                        }
                    }
                }

                if (icerik.EnKucukDeger == decimal.MaxValue)
                {
                    icerik.EnKucukDeger = null;
                }
            }

            return icerik;
        }

        public List<TablolarViewModel> BuyuklerListesi(int KullaniciId)
        {
            List<TablolarViewModel> model = new List<TablolarViewModel>();

            using (HamsterContext hs = new HamsterContext())
            {
                var buyukPRTeamsList = hs.PrTeams.OrderByDescending(i => i.Sonuc).Where(i => i.KullaniciId == KullaniciId).Select(i => new TablolarViewModel
                {
                    Id = i.Id,
                    Sol = i.Sol,
                    Sag = i.Sag,
                    SaatlikKazanc = i.SaatlikKazanc,
                    YukseltmeMaliyeti = i.YukseltmeMaliyeti,
                    Sonuc = i.Sonuc,
                    KullaniciId = i.KullaniciId,
                    Tablo = "PRTeam"

                }).ToList();

                var buyukMarketsList = hs.Markets.OrderByDescending(i => i.Sonuc).Where(i => i.KullaniciId == KullaniciId).Select(i => new TablolarViewModel
                {
                    Id = i.Id,
                    Sol = i.Sol,
                    Sag = i.Sag,
                    SaatlikKazanc = i.SaatlikKazanc,
                    YukseltmeMaliyeti = i.YukseltmeMaliyeti,
                    Sonuc = i.Sonuc,
                    KullaniciId = i.KullaniciId,
                    Tablo = "Markets"

                }).ToList();

                var buyukLegalsList = hs.Legals.OrderByDescending(i => i.Sonuc).Where(i => i.KullaniciId == KullaniciId).Select(i => new TablolarViewModel
                {
                    Id = i.Id,
                    Sol = i.Sol,
                    Sag = i.Sag,
                    SaatlikKazanc = i.SaatlikKazanc,
                    YukseltmeMaliyeti = i.YukseltmeMaliyeti,
                    Sonuc = i.Sonuc,
                    KullaniciId = i.KullaniciId,
                    Tablo = "Legal"

                }).ToList();

                var buyukWeb3List = hs.Web3s.OrderByDescending(i => i.Sonuc).Where(i => i.KullaniciId == KullaniciId).Select(i => new TablolarViewModel
                {
                    Id = i.Id,
                    Sol = i.Sol,
                    Sag = i.Sag,
                    SaatlikKazanc = i.SaatlikKazanc,
                    YukseltmeMaliyeti = i.YukseltmeMaliyeti,
                    Sonuc = i.Sonuc,
                    KullaniciId = i.KullaniciId,
                    Tablo = "Web3"

                }).ToList();

                var bSpecialsList = hs.Specials.OrderByDescending(i => i.Sonuc).Where(i => i.KullaniciId == KullaniciId).Select(i => new TablolarViewModel
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
                    stringSonuc = i.GeriSayim < DateTime.Now ? "You own this card" : null,
                    Tablo = "Specials"

                }).ToList();

                List<TablolarViewModel> buyukSpecialsList = new List<TablolarViewModel>();
                foreach (var item in bSpecialsList)
                {
                    if (item.stringSonuc == null)
                    {
                        buyukSpecialsList.Add(item);
                    }
                }

                var allBuyukler = new List<TablolarViewModel>();

                allBuyukler.AddRange(buyukPRTeamsList);
                allBuyukler.AddRange(buyukMarketsList);
                allBuyukler.AddRange(buyukLegalsList);
                allBuyukler.AddRange(buyukWeb3List);
                allBuyukler.AddRange(buyukSpecialsList);

                model = allBuyukler.OrderByDescending(i => i.Sonuc).Take(10).ToList();
            }

            return model;
        }

        public List<TablolarViewModel> KucuklerListesi(int KullaniciId)
        {
            List<TablolarViewModel> model = new List<TablolarViewModel>();

            using (HamsterContext hs = new HamsterContext())
            {
                var kucukPRTeamsList = hs.PrTeams.OrderBy(i => i.Sonuc).Where(i => i.KullaniciId == KullaniciId).Select(i => new TablolarViewModel
                {
                    Id = i.Id,
                    Sol = i.Sol,
                    Sag = i.Sag,
                    SaatlikKazanc = i.SaatlikKazanc,
                    YukseltmeMaliyeti = i.YukseltmeMaliyeti,
                    Sonuc = i.Sonuc,
                    KullaniciId = i.KullaniciId,
                    Tablo = "PRTeam"

                }).ToList();

                var kucukMarketsList = hs.Markets.OrderBy(i => i.Sonuc).Where(i => i.KullaniciId == KullaniciId).Select(i => new TablolarViewModel
                {
                    Id = i.Id,
                    Sol = i.Sol,
                    Sag = i.Sag,
                    SaatlikKazanc = i.SaatlikKazanc,
                    YukseltmeMaliyeti = i.YukseltmeMaliyeti,
                    Sonuc = i.Sonuc,
                    KullaniciId = i.KullaniciId,
                    Tablo = "Markets"

                }).ToList();

                var kucukLegalsList = hs.Legals.OrderBy(i => i.Sonuc).Where(i => i.KullaniciId == KullaniciId).Select(i => new TablolarViewModel
                {
                    Id = i.Id,
                    Sol = i.Sol,
                    Sag = i.Sag,
                    SaatlikKazanc = i.SaatlikKazanc,
                    YukseltmeMaliyeti = i.YukseltmeMaliyeti,
                    Sonuc = i.Sonuc,
                    KullaniciId = i.KullaniciId,
                    Tablo = "Legal"

                }).ToList();

                var kucukWeb3List = hs.Web3s.OrderBy(i => i.Sonuc).Where(i => i.KullaniciId == KullaniciId).Select(i => new TablolarViewModel
                {
                    Id = i.Id,
                    Sol = i.Sol,
                    Sag = i.Sag,
                    SaatlikKazanc = i.SaatlikKazanc,
                    YukseltmeMaliyeti = i.YukseltmeMaliyeti,
                    Sonuc = i.Sonuc,
                    KullaniciId = i.KullaniciId,
                    Tablo = "Web3"

                }).ToList();

                var kSpecialsList = hs.Specials.OrderBy(i => i.Sonuc).Where(i => i.KullaniciId == KullaniciId).Select(i => new TablolarViewModel
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
                    stringSonuc = i.GeriSayim < DateTime.Now ? "You own this card" : null,
                    Tablo = "Specials"

                }).ToList();

                List<TablolarViewModel> kucukSpecialsList = new List<TablolarViewModel>();
                foreach (var item in kSpecialsList)
                {
                    if (item.stringSonuc == null)
                    {
                        kucukSpecialsList.Add(item);
                    }
                }

                var allKucukler = new List<TablolarViewModel>();

                allKucukler.AddRange(kucukPRTeamsList);
                allKucukler.AddRange(kucukMarketsList);
                allKucukler.AddRange(kucukLegalsList);
                allKucukler.AddRange(kucukWeb3List);
                allKucukler.AddRange(kucukSpecialsList);

                model = allKucukler.OrderBy(i => i.Sonuc).Take(10).ToList();
            }

            return model;
        }

        public List<TablolarViewModel> YaklasanlarList(int KullaniciId)
        {
            using (HamsterContext hs = new HamsterContext())
            {
                var yaklasanlarList = hs.Specials.Where(i => i.KullaniciId == KullaniciId && DateTime.Now.AddDays(1) > i.GeriSayim && i.GeriSayim > DateTime.Now).Select(i => new TablolarViewModel
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
                    stringSonuc = i.GeriSayim < DateTime.Now ? "You own this card" : null,
                    Tablo = "Specials"

                }).ToList();

                return yaklasanlarList;
            }
        }

        public List<TablolarViewModel> SearchListesi(string searchTerm, int KullaniciId)
        {
            List<TablolarViewModel> searchResults = new List<TablolarViewModel>();

            var PRTeam = SearchPRTeamListesi(searchTerm, KullaniciId);
            searchResults.AddRange(PRTeam);

            var Markets = SearchMarketsListesi(searchTerm, KullaniciId);
            searchResults.AddRange(Markets);

            var Legal = SearchLegalListesi(searchTerm, KullaniciId);
            searchResults.AddRange(Legal);

            var Web3 = SearchWeb3Listesi(searchTerm, KullaniciId);
            searchResults.AddRange(Web3);

            var Specials = SearchSpecialsListesi(searchTerm, KullaniciId);
            searchResults.AddRange(Specials);

            return searchResults;
        }

        public List<TablolarViewModel> SearchPRTeamListesi(string searchTerm, int KullaniciId)
        {
            List<TablolarViewModel> modelList = new List<TablolarViewModel>();

            using (HamsterContext hs = new HamsterContext())
            {
                modelList = hs.PrTeams.Where(i => i.KullaniciId == KullaniciId).Where(i => i.Sol.Contains(searchTerm)
                || i.Sag.Contains(searchTerm)
                || Convert.ToString(i.SaatlikKazanc).Contains(searchTerm)
                || Convert.ToString(i.YukseltmeMaliyeti).Contains(searchTerm)
                || Convert.ToString(i.Sonuc).Contains(searchTerm)).Select(i => new TablolarViewModel
                {
                    Id = i.Id,
                    Sol = i.Sol,
                    Sag = i.Sag,
                    SaatlikKazanc = i.SaatlikKazanc,
                    YukseltmeMaliyeti = i.YukseltmeMaliyeti,
                    Sonuc = i.Sonuc,
                    KullaniciId = i.KullaniciId,
                    Tablo = "PRTeam"

                }).ToList();
            }

            return modelList;
        }

        public List<TablolarViewModel> SearchMarketsListesi(string searchTerm, int KullaniciId)
        {
            List<TablolarViewModel> modelList = new List<TablolarViewModel>();

            using (HamsterContext hs = new HamsterContext())
            {
                modelList = hs.Markets.Where(i => i.KullaniciId == KullaniciId).Where(i => i.Sol.Contains(searchTerm)
                || i.Sag.Contains(searchTerm)
                || Convert.ToString(i.SaatlikKazanc).Contains(searchTerm)
                || Convert.ToString(i.YukseltmeMaliyeti).Contains(searchTerm)
                || Convert.ToString(i.Sonuc).Contains(searchTerm)).Select(i => new TablolarViewModel
                {
                    Id = i.Id,
                    Sol = i.Sol,
                    Sag = i.Sag,
                    SaatlikKazanc = i.SaatlikKazanc,
                    YukseltmeMaliyeti = i.YukseltmeMaliyeti,
                    Sonuc = i.Sonuc,
                    KullaniciId = i.KullaniciId,
                    Tablo = "Markets"

                }).ToList();
            }

            return modelList;
        }

        public List<TablolarViewModel> SearchLegalListesi(string searchTerm, int KullaniciId)
        {
            List<TablolarViewModel> modelList = new List<TablolarViewModel>();

            using (HamsterContext hs = new HamsterContext())
            {
                modelList = hs.Legals.Where(i => i.KullaniciId == KullaniciId).Where(i => i.Sol.Contains(searchTerm)
                || i.Sag.Contains(searchTerm)
                || Convert.ToString(i.SaatlikKazanc).Contains(searchTerm)
                || Convert.ToString(i.YukseltmeMaliyeti).Contains(searchTerm)
                || Convert.ToString(i.Sonuc).Contains(searchTerm)).Select(i => new TablolarViewModel
                {
                    Id = i.Id,
                    Sol = i.Sol,
                    Sag = i.Sag,
                    SaatlikKazanc = i.SaatlikKazanc,
                    YukseltmeMaliyeti = i.YukseltmeMaliyeti,
                    Sonuc = i.Sonuc,
                    KullaniciId = i.KullaniciId,
                    Tablo = "Legal"

                }).ToList();
            }

            return modelList;
        }

        public List<TablolarViewModel> SearchWeb3Listesi(string searchTerm, int KullaniciId)
        {
            List<TablolarViewModel> modelList = new List<TablolarViewModel>();

            using (HamsterContext hs = new HamsterContext())
            {
                modelList = hs.Web3s.Where(i => i.KullaniciId == KullaniciId).Where(i => i.Sol.Contains(searchTerm)
                || i.Sag.Contains(searchTerm)
                || Convert.ToString(i.SaatlikKazanc).Contains(searchTerm)
                || Convert.ToString(i.YukseltmeMaliyeti).Contains(searchTerm)
                || Convert.ToString(i.Sonuc).Contains(searchTerm)).Select(i => new TablolarViewModel
                {
                    Id = i.Id,
                    Sol = i.Sol,
                    Sag = i.Sag,
                    SaatlikKazanc = i.SaatlikKazanc,
                    YukseltmeMaliyeti = i.YukseltmeMaliyeti,
                    Sonuc = i.Sonuc,
                    KullaniciId = i.KullaniciId,
                    Tablo = "Web3"

                }).ToList();
            }

            return modelList;
        }

        public List<TablolarViewModel> SearchSpecialsListesi(string searchTerm, int KullaniciId)
        {
            List<TablolarViewModel> modelList = new List<TablolarViewModel>();

            using (HamsterContext hs = new HamsterContext())
            {
                modelList = hs.Specials.Where(i => i.KullaniciId == KullaniciId).Where(i => i.Sol.Contains(searchTerm)
                || i.Orta.Contains(searchTerm)
                || i.Sag.Contains(searchTerm)
                || Convert.ToString(i.SaatlikKazanc).Contains(searchTerm)
                || Convert.ToString(i.YukseltmeMaliyeti).Contains(searchTerm)
                || Convert.ToString(i.Sonuc).Contains(searchTerm)).Select(i => new TablolarViewModel
                {
                    Id = i.Id,
                    Sol = i.Sol,
                    Orta = i.Orta,
                    Sag = i.Sag,
                    SaatlikKazanc = i.SaatlikKazanc,
                    YukseltmeMaliyeti = i.YukseltmeMaliyeti,
                    Sonuc = i.Sonuc,
                    GeriSayim = i.GeriSayim,
                    TimeDifferenceInSeconds = (i.GeriSayim.HasValue ? (int)(i.GeriSayim.Value - DateTime.Now).TotalSeconds : (int?)null),
                    KullaniciId = i.KullaniciId,
                    stringSonuc = i.GeriSayim < DateTime.Now ? "You own this card" : null,
                    Tablo = "Specials"

                }).ToList();
            }

            return modelList;
        }
    }
}