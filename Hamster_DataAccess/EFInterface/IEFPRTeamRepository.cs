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
	public interface IEFPRTeamRepository : IRepository<PrTeam>
	{
		List<OrtakViewModel> List(string searchTerm, int KullaniciId);
	}
}
