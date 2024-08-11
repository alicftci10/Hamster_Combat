﻿using Hamster_Business.Interfaces;
using Hamster_DataAccess.DBModels;
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
            return new EFPRTeam().List(searchTerm, KullaniciId);
        }

        public PrTeam GetId(int pId)
        {
            return new EFPRTeam().GetSelect(pId);
        }

        public int Add(OrtakViewModel item)
        {
            return new EFPRTeam().Add(GetViewModel(item));
        }

        public int Update(OrtakViewModel item)
        {
            return new EFPRTeam().Update(GetViewModel(item));
        }

        public PrTeam Delete(int pId)
        {
            return new EFPRTeam().Delete(pId);
        }
    }
}