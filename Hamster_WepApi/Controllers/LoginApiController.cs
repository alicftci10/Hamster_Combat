using Hamster_Business.Interfaces;
using Hamster_Entities.Models;
using Microsoft.AspNetCore.Components.Server.ProtectedBrowserStorage;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using static System.Net.Mime.MediaTypeNames;

namespace Hamster_WepApi.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class LoginApiController : BaseApiController
    {
        private readonly IKullaniciService _Kullanici;
        public LoginApiController(IKullaniciService Kullanici)
        {
            _Kullanici = Kullanici;
        }

        [HttpPost]
        public IActionResult Giris([FromBody] KullaniciViewModel model)
        {
            var kullaniciList = _Kullanici.GetKullanici(model);

            if (kullaniciList.Id > 0)
            {
                kullaniciList.JwtToken = GenerateJwtToken(kullaniciList);
            }

            return Ok(kullaniciList);
        }
    }
}
