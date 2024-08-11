using Hamster_Entities.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System;
using System.Net.Http;
using System.Reflection;
using System.Security.Cryptography;
using System.Text;
using static System.Net.Mime.MediaTypeNames;

namespace Hamster_WebApp.Controllers
{
    public class LegalController : BaseController
    {
        public async Task<IActionResult> LegalListesi(string searchTerm)
        {
            using (HttpClient client = new HttpClient())
            {
                string url = "https://localhost:7120/api/LegalApi/GetListLegal";

                if (!string.IsNullOrEmpty(searchTerm))
                {
                    url += $"?searchTerm={searchTerm}";
                }

                client.DefaultRequestHeaders.Add("Authorization", "Bearer " + CurrentKullanici.JwtToken);

                var response = await client.GetAsync(url);

                var data = response.Content.ReadAsStringAsync();

                List<OrtakViewModel> modelList = new List<OrtakViewModel>();

                if (response.IsSuccessStatusCode)
                {
                    modelList = JsonConvert.DeserializeObject<List<OrtakViewModel>>(data.Result);
                }

                return View(modelList);
            }
        }

        public IActionResult LegalCreate()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> LegalCreate(OrtakViewModel model)
        {
            using (HttpClient client = new HttpClient())
            {
                string url = "https://localhost:7120/api/LegalApi/Save";

                var json = JsonConvert.SerializeObject(model);
                var content = new StringContent(json, Encoding.UTF8, "application/json");

                client.DefaultRequestHeaders.Add("Authorization", "Bearer " + CurrentKullanici.JwtToken);

                var response = await client.PostAsync(url, content);

                if (response.IsSuccessStatusCode)
                {
                    return RedirectToAction("LegalListesi");
                }
                else
                {
                    return View(model);
                }
            }
        }

        public async Task<IActionResult> LegalEdit(int pId)
        {
            using (HttpClient client = new HttpClient())
            {
                string url = "https://localhost:7120/api/LegalApi/GetLegal";

                url += $"?pId={pId}";

                client.DefaultRequestHeaders.Add("Authorization", "Bearer " + CurrentKullanici.JwtToken);

                var response = await client.GetAsync(url);

                var data = response.Content.ReadAsStringAsync();

                OrtakViewModel model = new OrtakViewModel();

                if (response.IsSuccessStatusCode)
                {
                    model = JsonConvert.DeserializeObject<OrtakViewModel>(data.Result);
                }

                return View(model);
            }
        }

        [HttpPost]
        public async Task<IActionResult> LegalEdit(OrtakViewModel model)
        {
            using (HttpClient client = new HttpClient())
            {
                string url = "https://localhost:7120/api/LegalApi/Update";

                var json = JsonConvert.SerializeObject(model);
                var content = new StringContent(json, Encoding.UTF8, "application/json");

                client.DefaultRequestHeaders.Add("Authorization", "Bearer " + CurrentKullanici.JwtToken);

                var response = await client.PutAsync(url, content);

                if (response.IsSuccessStatusCode)
                {
                    return RedirectToAction("LegalListesi");
                }
                else
                {
                    return View(model);
                }
            }
        }

        [HttpGet]
        public async Task<IActionResult> LegalDelete(int pId)
        {
            using (HttpClient client = new HttpClient())
            {
                string url = "https://localhost:7120/api/LegalApi/Delete";

                url += $"?pId={pId}";

                client.DefaultRequestHeaders.Add("Authorization", "Bearer " + CurrentKullanici.JwtToken);

                var response = await client.DeleteAsync(url);

                return RedirectToAction("LegalListesi");
            }
        }
    }
}
