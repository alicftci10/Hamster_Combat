using Hamster_DataAccess.DBContext;
using Hamster_Entities.Models;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System.Text;
using static System.Net.Mime.MediaTypeNames;
using static System.Runtime.InteropServices.JavaScript.JSType;

namespace Hamster_WebApp.Controllers
{
    public class LoginController : Controller
    {
        public IActionResult LoginEkrani(string p)
        {
            KullaniciViewModel model = new KullaniciViewModel();

            if (p == "logout")
            {
                HttpContext.Session.Clear();
            }

            return View(model);
        }

        [HttpPost]
        public async Task<IActionResult> LoginEkrani(KullaniciViewModel model)
        {
            using (HttpClient client = new HttpClient())
            {
                string url = "https://localhost:7120/api/LoginApi/Giris";

                var json = JsonConvert.SerializeObject(model);
                var content = new StringContent(json, Encoding.UTF8, "application/json");

                var response = await client.PostAsync(url, content);

                var text = response.Content.ReadAsStringAsync();

                if (response.IsSuccessStatusCode)
                {
                    model = JsonConvert.DeserializeObject<KullaniciViewModel>(text.Result);

                    if (model != null && model.Id > 0)
                    {
                        HttpContext.Session.SetString("Kullanici", text.Result);

                        return RedirectToAction("HamsterListesi", "Hamster");
                    }
                    else if (model.ErrorMessage == "1")
                    {
                        ModelState.AddModelError("Sifre", "Şifre yanlış!! lütfen tekrar deneyiniz.");
                    }
                    else
                    {
                        ModelState.AddModelError("Sifre", "Kullanıcı Adı veya Şifre yanlış!! lütfen tekrar deneyiniz.");
                    }
                }

                return View(model);
            }
        }
    }
}
