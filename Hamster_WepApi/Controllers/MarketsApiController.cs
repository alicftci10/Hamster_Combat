using Hamster_Business.Interfaces;
using Hamster_Entities.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Hamster_WepApi.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class MarketsApiController : BaseApiController
    {
        IMarketsService _markets;
        public MarketsApiController(IMarketsService markets)
        {
            _markets = markets;
        }

        [HttpGet]
        [Authorize]
        public IActionResult GetListMarkets(string? searchTerm)
        {
            int KullaniciId = GetCurrentUserInfo(HttpContext).Id;

            return Ok(_markets.GetList(searchTerm, KullaniciId));
        }

        [HttpGet]
        [Authorize]
        public IActionResult GetMarkets(int pId)
        {
            return Ok(_markets.GetId(pId));
        }

        [HttpPost]
        [Authorize]
        public IActionResult Save([FromBody] OrtakViewModel model)
        {
            model.KullaniciId = GetCurrentUserInfo(HttpContext).Id;

            return Ok(_markets.Add(model));
        }

        [HttpPut]
        [Authorize]
        public IActionResult Update([FromBody] OrtakViewModel model)
        {
            return Ok(_markets.Update(model));
        }

        [HttpDelete]
        [Authorize]
        public IActionResult Delete(int pId)
        {
            return Ok(_markets.Delete(pId));
        }
    }
}
