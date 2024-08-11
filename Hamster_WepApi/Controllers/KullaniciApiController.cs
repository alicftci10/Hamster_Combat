using Hamster_Business.Interfaces;
using Hamster_DataAccess.DBContext;
using Hamster_Entities.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore.Metadata.Internal;

namespace Hamster_WepApi.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class KullaniciApiController : BaseApiController
    {
        IKullaniciService _kullanici;
        public KullaniciApiController(IKullaniciService kullanici)
        {
            _kullanici = kullanici;
        }

        [HttpGet]
        [Authorize]
        public IActionResult GetListKullanici(string? ErrorMessage)
        {
            string KullaniciAdi = GetCurrentUserInfo(HttpContext).KullaniciAdi;
            int? Yetki = GetCurrentUserInfo(HttpContext).Yetki;

            return Ok(_kullanici.GetList(KullaniciAdi, Yetki, ErrorMessage));
        }

        [HttpGet]
        [Authorize]
        public IActionResult GetKullanici(int pId)
        {
            return Ok(_kullanici.GetId(pId));
        }

        [HttpPost]
        [Authorize]
        public IActionResult Save([FromBody] KullaniciViewModel model)
        {
            return Ok(_kullanici.Add(model));
        }

        [HttpPut]
        [Authorize]
        public IActionResult Update([FromBody] KullaniciViewModel model)
        {
            return Ok(_kullanici.Update(model));
        }

        [HttpDelete]
        [Authorize]
        public IActionResult Delete(int pId)
        {
            return Ok(_kullanici.Delete(pId));
        }
    }
}
