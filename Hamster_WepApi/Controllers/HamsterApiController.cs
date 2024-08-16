using Hamster_Business.Interfaces;
using Hamster_Entities.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Hamster_WepApi.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class HamsterApiController : BaseApiController
    {
        IHamsterService _hamster;
        public HamsterApiController(IHamsterService hamster)
        {
            _hamster = hamster;
        }

        [HttpGet]
        [Authorize]
        public IActionResult GetListHamster()
        {
            int KullaniciId = GetCurrentUserInfo(HttpContext).Id;

            return Ok(_hamster.HamsterListesi(KullaniciId));
        }

        [HttpGet]
        [Authorize]
        public IActionResult GetListBuyukler()
        {
            int KullaniciId = GetCurrentUserInfo(HttpContext).Id;

            return Ok(_hamster.BuyuklerListesi(KullaniciId));
        }

        [HttpGet]
        [Authorize]
        public IActionResult GetListKucukler()
        {
            int KullaniciId = GetCurrentUserInfo(HttpContext).Id;

            return Ok(_hamster.KucuklerListesi(KullaniciId));
        }

        [HttpGet]
        [Authorize]
        public IActionResult GetListYaklasanlar()
        {
            int KullaniciId = GetCurrentUserInfo(HttpContext).Id;

            return Ok(_hamster.YaklasanlarList(KullaniciId));
        }

        [HttpGet]
        [Authorize]
        public IActionResult GetListSearch(string? searchTerm)
        {
            int KullaniciId = GetCurrentUserInfo(HttpContext).Id;

            return Ok(_hamster.SearchListesi(searchTerm, KullaniciId));
        }
    }
}
