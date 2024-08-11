using Hamster_DataAccess.DBContext;
using Hamster_Entities.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.IdentityModel.Tokens;
using Newtonsoft.Json;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace Hamster_WebApp.Controllers
{
    public class BaseController : Controller
    {
        public BaseController() { }

        public KullaniciViewModel CurrentKullanici
        {
            get
            {
                KullaniciViewModel model = new KullaniciViewModel();
                string sessionKullanici = HttpContext.Session.GetString("Kullanici");
                if (!string.IsNullOrEmpty(sessionKullanici))
                {//Session Dolu
                    model = JsonConvert.DeserializeObject<KullaniciViewModel>(sessionKullanici);
                }

                return model;
            }
        }

        public override void OnActionExecuting(ActionExecutingContext context)
        {
            string sessionKullanici = HttpContext.Session.GetString("Kullanici");
            
            if (!string.IsNullOrEmpty(sessionKullanici))
            {//Session Dolu
                KullaniciViewModel model = JsonConvert.DeserializeObject<KullaniciViewModel>(sessionKullanici);

                if (model != null)
                {
                    ViewData["AdSoyad"] = model.Ad + " " + model.Soyad;
                }

            }
            else
            {//Session Boş Logine yönlendir
                context.Result = new RedirectResult("/Login/LoginEkrani");
            }

        }

        public void LoadViewBag()
        {
            using (HamsterContext hs = new HamsterContext())
            {
                ViewBag.Yetki = hs.Yetkis.Select(i => new SelectListItem()
                {
                    Value = i.Id.ToString(),
                    Text = i.YetkiAdi
                }).ToList();
            }
        }
    }
}
