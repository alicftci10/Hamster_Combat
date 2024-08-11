using Hamster_DataAccess.DBModels;
using Hamster_Entities.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Hamster_Business.Interfaces
{
    public interface ISpecialsService
    {
        List<SpecialsViewModel> GetList(string searchTerm, int KullaniciId);

        Special GetId(int pId);

        int Add(SpecialsViewModel item);

        int Update(SpecialsViewModel item);

        Special Delete(int pId);

        void Change(int KullaniciId);
    }
}
