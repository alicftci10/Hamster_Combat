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
	public interface IEFWeb3Repository : IRepository<Web3>
	{
		List<OrtakViewModel> List(string searchTerm, int KullaniciId);
	}
}
