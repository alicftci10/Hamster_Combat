using Hamster_DataAccess.DBModels;
using Hamster_DataAccess.GenericRepository.Interfaces;
using Hamster_Entities.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Hamster_DataAccess.EFInterface
{
	public interface IEFSpecialsRepository : IRepository<Special>
	{
		List<SpecialsViewModel> List(string searchTerm, int KullaniciId);

		void Change(int KullaniciId);
	}
}
