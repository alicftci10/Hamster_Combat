using Hamster_Business.Interfaces;
using Hamster_DataAccess.DBContext;
using Hamster_DataAccess.DBModels;
using Hamster_Entities.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Hamster_WepApi.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class LegalApiController : BaseApiController
    {
        ILegalService _legal;
        public LegalApiController(ILegalService legal)
        {
            _legal = legal;
        }

        [HttpGet]
        [Authorize]
        public IActionResult GetListLegal(string? searchTerm)
        {
            int KullaniciId = GetCurrentUserInfo(HttpContext).Id;

            return Ok(_legal.GetList(searchTerm, KullaniciId));
        }

        [HttpGet]
        [Authorize]
        public IActionResult GetLegal(int pId)
        {
            return Ok(_legal.GetId(pId));
        }

        [HttpPost]
        [Authorize]
        public IActionResult Save([FromBody] OrtakViewModel model)
        {
            model.KullaniciId = GetCurrentUserInfo(HttpContext).Id;

            return Ok(_legal.Add(model));
        }

        [HttpPut]
        [Authorize]
        public IActionResult Update([FromBody] OrtakViewModel model)
        {
            return Ok(_legal.Update(model));
        }

        [HttpDelete]
        [Authorize]
        public IActionResult Delete(int pId)
        {
            return Ok(_legal.Delete(pId));
        }
    }
}
