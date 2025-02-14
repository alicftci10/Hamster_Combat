﻿using Hamster_Business.Interfaces;
using Hamster_DataAccess.DBModels;
using Hamster_DataAccess.EFInterface;
using Hamster_DataAccess.EFOperations;
using Hamster_Entities.Models;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

namespace Hamster_Business.Managers
{
    public class LegalManager : BaseManager, ILegalService
    {
		private readonly IEFLegalRepository _LegalRepository;
		public LegalManager(IEFLegalRepository LegalRepository)
		{
			_LegalRepository = LegalRepository;
		}

		private Legal GetViewModel(OrtakViewModel model)
        {
            Legal item = new Legal();

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
            return _LegalRepository.List(searchTerm, KullaniciId);
        }

        public Legal GetId(int pId)
        {
            return _LegalRepository.GetSelect(pId);
        }

        public int Add(OrtakViewModel item)
        {
            return _LegalRepository.Add(GetViewModel(item)).Id;
        }

        public int Update(OrtakViewModel item)
        {
            return _LegalRepository.Update(GetViewModel(item)).Id;
        }

        public Legal Delete(int pId)
        {
            return _LegalRepository.Delete(pId);
        }
    }
}
