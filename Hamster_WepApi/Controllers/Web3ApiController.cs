using Hamster_Business.Interfaces;
using Hamster_Entities.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Hamster_WepApi.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class Web3ApiController : BaseApiController
    {
        IWeb3Service _web3;
        public Web3ApiController(IWeb3Service web3)
        {
            _web3 = web3;
        }

        [HttpGet]
        [Authorize]
        public IActionResult GetListWeb3(string? searchTerm)
        {
            int KullaniciId = GetCurrentUserInfo(HttpContext).Id;

            return Ok(_web3.GetList(searchTerm, KullaniciId));
        }

        [HttpGet]
        [Authorize]
        public IActionResult GetWeb3(int pId)
        {
            return Ok(_web3.GetId(pId));
        }

        [HttpPost]
        [Authorize]
        public IActionResult Save([FromBody] OrtakViewModel model)
        {
            model.KullaniciId = GetCurrentUserInfo(HttpContext).Id;

            return Ok(_web3.Add(model));
        }

        [HttpPut]
        [Authorize]
        public IActionResult Update([FromBody] OrtakViewModel model)
        {
            return Ok(_web3.Update(model));
        }

        [HttpDelete]
        [Authorize]
        public IActionResult Delete(int pId)
        {
            return Ok(_web3.Delete(pId));
        }
    }
}
