using Hamster_Business.Interfaces;
using Hamster_Entities.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Hamster_WepApi.Controllers
{
	[Route("api/[controller]/[action]")]
	[ApiController]
	public class SpecialsApiController : BaseApiController
	{
		ISpecialsService _specials;
		public SpecialsApiController(ISpecialsService specials)
		{
			_specials = specials;
		}

		[HttpGet]
		[Authorize]
		public IActionResult GetListSpecials(string? searchTerm)
		{
			int KullaniciId = GetCurrentUserInfo(HttpContext).Id;

			return Ok(_specials.GetList(searchTerm, KullaniciId));
		}

		[HttpGet]
		[Authorize]
		public IActionResult GetSpecials(int pId)
		{
			return Ok(_specials.GetId(pId));
		}

		[HttpPost]
		[Authorize]
		public IActionResult Save([FromBody] SpecialsViewModel model)
		{
			model.KullaniciId = GetCurrentUserInfo(HttpContext).Id;

			return Ok(_specials.Add(model));
		}

		[HttpPut]
		[Authorize]
		public IActionResult Update([FromBody] SpecialsViewModel model)
		{
			return Ok(_specials.Update(model));
		}

		[HttpDelete]
		[Authorize]
		public IActionResult Delete(int pId)
		{
			return Ok(_specials.Delete(pId));
		}

		[HttpGet]
		[Authorize]
		public void Change()
		{
			int KullaniciId = GetCurrentUserInfo(HttpContext).Id;

			_specials.Change(KullaniciId);
		}
	}
}
