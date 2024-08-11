using Hamster_DataAccess.DBModels;
using Hamster_Entities.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Hamster_Business.Interfaces
{
    public interface IWeb3Service
    {
        List<OrtakViewModel> GetList(string searchTerm, int KullaniciId);

        Web3 GetId(int pId);

        int Add(OrtakViewModel item);

        int Update(OrtakViewModel item);

        Web3 Delete(int pId);
    }
}
