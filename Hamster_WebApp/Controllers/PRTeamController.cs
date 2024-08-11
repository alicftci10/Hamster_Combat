using Hamster_Entities.Models;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System.Text;

namespace Hamster_WebApp.Controllers
{
    public class PRTeamController : BaseController
    {
        public async Task<IActionResult> PRTeamListesi(string searchTerm)
        {
            using (HttpClient client = new HttpClient())
            {
                string url = "https://localhost:7120/api/PRTeamApi/GetListPRTeam";

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

        public IActionResult PRTeamCreate()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> PRTeamCreate(OrtakViewModel model)
        {
            using (HttpClient client = new HttpClient())
            {
                string url = "https://localhost:7120/api/PRTeamApi/Save";

                var json = JsonConvert.SerializeObject(model);
                var content = new StringContent(json, Encoding.UTF8, "application/json");

                client.DefaultRequestHeaders.Add("Authorization", "Bearer " + CurrentKullanici.JwtToken);

                var response = await client.PostAsync(url, content);

                if (response.IsSuccessStatusCode)
                {
                    return RedirectToAction("PRTeamListesi");
                }
                else
                {
                    return View(model);
                }
            }
        }

        public async Task<IActionResult> PRTeamEdit(int pId)
        {
            using (HttpClient client = new HttpClient())
            {
                string url = "https://localhost:7120/api/PRTeamApi/GetPRTeam";

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
        public async Task<IActionResult> PRTeamEdit(OrtakViewModel model)
        {
            using (HttpClient client = new HttpClient())
            {
                string url = "https://localhost:7120/api/PRTeamApi/Update";

                var json = JsonConvert.SerializeObject(model);
                var content = new StringContent(json, Encoding.UTF8, "application/json");

                client.DefaultRequestHeaders.Add("Authorization", "Bearer " + CurrentKullanici.JwtToken);

                var response = await client.PutAsync(url, content);

                if (response.IsSuccessStatusCode)
                {
                    return RedirectToAction("PRTeamListesi");
                }
                else
                {
                    return View(model);
                }
            }
        }

        [HttpGet]
        public async Task<IActionResult> PRTeamDelete(int pId)
        {
            using (HttpClient client = new HttpClient())
            {
                string url = "https://localhost:7120/api/PRTeamApi/Delete";

                url += $"?pId={pId}";

                client.DefaultRequestHeaders.Add("Authorization", "Bearer " + CurrentKullanici.JwtToken);

                var response = await client.DeleteAsync(url);

                return RedirectToAction("PRTeamListesi");
            }
        }
    }
}
