using Hamster_DataAccess.DBModels;
using Hamster_Entities.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Hamster_Business.Interfaces
{
    public interface IPRTeamService
    {
        List<OrtakViewModel> GetList(string searchTerm, int KullaniciId);

        PrTeam GetId(int pId);

        int Add(OrtakViewModel item);

        int Update(OrtakViewModel item);

        PrTeam Delete(int pId);
    }
}
