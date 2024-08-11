using Hamster_Entities.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System.Collections.Generic;
using System.Text;

namespace Hamster_WebApp.Controllers
{
    public class SpecialsController : BaseController
    {
        public async Task<IActionResult> SpecialsListesi(string searchTerm)
        {
            using (HttpClient client = new HttpClient())
            {
                string url = "https://localhost:7120/api/SpecialsApi/GetListSpecials";

                if (!string.IsNullOrEmpty(searchTerm))
                {
                    url += $"?searchTerm={searchTerm}";
                }

                client.DefaultRequestHeaders.Add("Authorization", "Bearer " + CurrentKullanici.JwtToken);

                var response = await client.GetAsync(url);

                var data = response.Content.ReadAsStringAsync();

                List<SpecialsViewModel> modelList = new List<SpecialsViewModel>();

                if (response.IsSuccessStatusCode)
                {
                    modelList = JsonConvert.DeserializeObject<List<SpecialsViewModel>>(data.Result);

                    List<int> list = new List<int>();

                    foreach (var item in modelList)
                    {
                        list.Add(item.SiraNo.Value);
                    }

                    HttpContext.Session.SetString("SiraNoList", JsonConvert.SerializeObject(list));
                }

                return View(modelList);
            }
        }

        public IActionResult SpecialsCreate()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> SpecialsCreate(SpecialsViewModel model)
        {
            using (HttpClient client = new HttpClient())
            {
                if (ModelState.IsValid)
                {
                    var SiraNo = HttpContext.Session.GetString("SiraNoList");

                    List<int> SiraNoList = JsonConvert.DeserializeObject<List<int>>(SiraNo);

                    if (SiraNoList.Contains(model.SiraNo.Value))
                    {
                        ModelState.AddModelError("SiraNo", "Bu Numara kayıtı mevcut, lütfen farklı numara giriniz.");
                        return View(model);
                    }

                    string url = "https://localhost:7120/api/SpecialsApi/Save";

                    var json = JsonConvert.SerializeObject(model);
                    var content = new StringContent(json, Encoding.UTF8, "application/json");

                    client.DefaultRequestHeaders.Add("Authorization", "Bearer " + CurrentKullanici.JwtToken);

                    var response = await client.PostAsync(url, content);

                    if (response.IsSuccessStatusCode)
                    {
                        return RedirectToAction("SpecialsListesi");
                    }
                    else
                    {
                        return View(model);
                    }
                }

                return View(model);
            }
        }

        public async Task<IActionResult> SpecialsEdit(int pId)
        {
            using (HttpClient client = new HttpClient())
            {
                string url = "https://localhost:7120/api/SpecialsApi/GetSpecials";

                url += $"?pId={pId}";

                client.DefaultRequestHeaders.Add("Authorization", "Bearer " + CurrentKullanici.JwtToken);

                var response = await client.GetAsync(url);

                var data = response.Content.ReadAsStringAsync();

                SpecialsViewModel model = new SpecialsViewModel();

                if (response.IsSuccessStatusCode)
                {
                    model = JsonConvert.DeserializeObject<SpecialsViewModel>(data.Result);

                    HttpContext.Session.SetInt32("secilenSiraNo", model.SiraNo.Value);
                }

                return View(model);
            }
        }

        [HttpPost]
        public async Task<IActionResult> SpecialsEdit(SpecialsViewModel model)
        {
            using (HttpClient client = new HttpClient())
            {
                if (ModelState.IsValid)
                {
                    int? secilenSiraNo = HttpContext.Session.GetInt32("secilenSiraNo");

                    if (model.SiraNo == secilenSiraNo)
                    {
                        goto buraya;
                    }

                    var SiraNo = HttpContext.Session.GetString("SiraNoList");

                    List<int> SiraNoList = JsonConvert.DeserializeObject<List<int>>(SiraNo);

                    if (SiraNoList.Contains(model.SiraNo.Value))
                    {
                        ModelState.AddModelError("SiraNo", "Bu Numara kayıtı mevcut, lütfen farklı numara giriniz.");
                        return View(model);
                    }

                buraya:

                    string url = "https://localhost:7120/api/SpecialsApi/Update";

                    var json = JsonConvert.SerializeObject(model);
                    var content = new StringContent(json, Encoding.UTF8, "application/json");

                    client.DefaultRequestHeaders.Add("Authorization", "Bearer " + CurrentKullanici.JwtToken);

                    var response = await client.PutAsync(url, content);

                    if (response.IsSuccessStatusCode)
                    {
                        return RedirectToAction("SpecialsListesi");
                    }
                    else
                    {
                        return View(model);
                    }
                }

                return View(model);
            }
        }

        [HttpGet]
        public async Task<IActionResult> SpecialsDelete(int pId)
        {
            using (HttpClient client = new HttpClient())
            {
                string url = "https://localhost:7120/api/SpecialsApi/Delete";

                url += $"?pId={pId}";

                client.DefaultRequestHeaders.Add("Authorization", "Bearer " + CurrentKullanici.JwtToken);

                var response = await client.DeleteAsync(url);

                return RedirectToAction("SpecialsListesi");
            }
        }

        public async Task<IActionResult> Change()
        {
            using (HttpClient client = new HttpClient())
            {
                string url = "https://localhost:7120/api/SpecialsApi/Change";

                client.DefaultRequestHeaders.Add("Authorization", "Bearer " + CurrentKullanici.JwtToken);

                var response = await client.GetAsync(url);

                return RedirectToAction("SpecialsListesi");
            }
        }
    }
}
