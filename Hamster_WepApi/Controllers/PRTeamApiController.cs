using Hamster_Business.Interfaces;
using Hamster_Entities.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Hamster_WepApi.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class PRTeamApiController : BaseApiController
    {
        IPRTeamService _prteam;
        public PRTeamApiController(IPRTeamService prteam)
        {
            _prteam = prteam;
        }

        [HttpGet]
        [Authorize]
        public IActionResult GetListPRTeam(string? searchTerm)
        {
            int KullaniciId = GetCurrentUserInfo(HttpContext).Id;

            return Ok(_prteam.GetList(searchTerm, KullaniciId));
        }

        [HttpGet]
        [Authorize]
        public IActionResult GetPRTeam(int pId)
        {
            return Ok(_prteam.GetId(pId));
        }

        [HttpPost]
        [Authorize]
        public IActionResult Save([FromBody] OrtakViewModel model)
        {
            model.KullaniciId = GetCurrentUserInfo(HttpContext).Id;

            return Ok(_prteam.Add(model));
        }

        [HttpPut]
        [Authorize]
        public IActionResult Update([FromBody] OrtakViewModel model)
        {
            return Ok(_prteam.Update(model));
        }

        [HttpDelete]
        [Authorize]
        public IActionResult Delete(int pId)
        {
            return Ok(_prteam.Delete(pId));
        }
    }
}
