using Hamster_Entities.Models;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System.Text;

namespace Hamster_WebApp.Controllers
{
    public class Web3Controller : BaseController
    {
        public async Task<IActionResult> Web3Listesi(string searchTerm)
        {
            using (HttpClient client = new HttpClient())
            {
                string url = "https://localhost:7120/api/Web3Api/GetListWeb3";

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

        public IActionResult Web3Create()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Web3Create(OrtakViewModel model)
        {
            using (HttpClient client = new HttpClient())
            {
                string url = "https://localhost:7120/api/Web3Api/Save";

                var json = JsonConvert.SerializeObject(model);
                var content = new StringContent(json, Encoding.UTF8, "application/json");

                client.DefaultRequestHeaders.Add("Authorization", "Bearer " + CurrentKullanici.JwtToken);

                var response = await client.PostAsync(url, content);

                if (response.IsSuccessStatusCode)
                {
                    return RedirectToAction("Web3Listesi");
                }
                else
                {
                    return View(model);
                }
            }
        }

        public async Task<IActionResult> Web3Edit(int pId)
        {
            using (HttpClient client = new HttpClient())
            {
                string url = "https://localhost:7120/api/Web3Api/GetWeb3";

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
        public async Task<IActionResult> Web3Edit(OrtakViewModel model)
        {
            using (HttpClient client = new HttpClient())
            {
                string url = "https://localhost:7120/api/Web3Api/Update";

                var json = JsonConvert.SerializeObject(model);
                var content = new StringContent(json, Encoding.UTF8, "application/json");

                client.DefaultRequestHeaders.Add("Authorization", "Bearer " + CurrentKullanici.JwtToken);

                var response = await client.PutAsync(url, content);

                if (response.IsSuccessStatusCode)
                {
                    return RedirectToAction("Web3Listesi");
                }
                else
                {
                    return View(model);
                }
            }
        }

        [HttpGet]
        public async Task<IActionResult> Web3Delete(int pId)
        {
            using (HttpClient client = new HttpClient())
            {
                string url = "https://localhost:7120/api/Web3Api/Delete";

                url += $"?pId={pId}";

                client.DefaultRequestHeaders.Add("Authorization", "Bearer " + CurrentKullanici.JwtToken);

                var response = await client.DeleteAsync(url);

                return RedirectToAction("Web3Listesi");
            }
        }
    }
}
