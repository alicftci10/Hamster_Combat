using Hamster_DataAccess.DBContext;
using Hamster_Entities.Models;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;

namespace Hamster_WebApp.Controllers
{
    public class HamsterController : BaseController
    {
        public async Task<IActionResult> HamsterListesi()
        {
            using (HttpClient client = new HttpClient())
            {
                string url = "https://localhost:7120/api/HamsterApi/GetListHamster";

                client.DefaultRequestHeaders.Add("Authorization", "Bearer " + CurrentKullanici.JwtToken);

                var response = await client.GetAsync(url);

                var data = response.Content.ReadAsStringAsync();

                HamsterViewModel modelList = new HamsterViewModel();

                if (response.IsSuccessStatusCode)
                {
                    modelList = JsonConvert.DeserializeObject<HamsterViewModel>(data.Result);
                }

                return View(modelList);
            }
        }

        public async Task<IActionResult> BuyuklerListesi()
        {
            using (HttpClient client = new HttpClient())
            {
                string url = "https://localhost:7120/api/HamsterApi/GetListBuyukler";

                client.DefaultRequestHeaders.Add("Authorization", "Bearer " + CurrentKullanici.JwtToken);

                var response = await client.GetAsync(url);

                var data = response.Content.ReadAsStringAsync();

                List<TablolarViewModel> modelList = new List<TablolarViewModel>();

                if (response.IsSuccessStatusCode)
                {
                    modelList = JsonConvert.DeserializeObject<List<TablolarViewModel>>(data.Result);
                }

                return View(modelList);
            }
        }

        public async Task<IActionResult> KucuklerListesi()
        {
            using (HttpClient client = new HttpClient())
            {
                string url = "https://localhost:7120/api/HamsterApi/GetListKucukler";

                client.DefaultRequestHeaders.Add("Authorization", "Bearer " + CurrentKullanici.JwtToken);

                var response = await client.GetAsync(url);

                var data = response.Content.ReadAsStringAsync();

                List<TablolarViewModel> modelList = new List<TablolarViewModel>();

                if (response.IsSuccessStatusCode)
                {
                    modelList = JsonConvert.DeserializeObject<List<TablolarViewModel>>(data.Result);
                }

                return View(modelList);
            }
        }

        public async Task<IActionResult> YaklasanlarList()
        {
            using (HttpClient client = new HttpClient())
            {
                string url = "https://localhost:7120/api/HamsterApi/GetListYaklasanlar";

                client.DefaultRequestHeaders.Add("Authorization", "Bearer " + CurrentKullanici.JwtToken);

                var response = await client.GetAsync(url);

                var data = response.Content.ReadAsStringAsync();

                List<TablolarViewModel> modelList = new List<TablolarViewModel>();

                if (response.IsSuccessStatusCode)
                {
                    modelList = JsonConvert.DeserializeObject<List<TablolarViewModel>>(data.Result);
                }

                return View(modelList);
            }
        }

        public async Task<IActionResult> SearchListesi(string searchTerm)
        {
            using (HttpClient client = new HttpClient())
            {
                string url = "https://localhost:7120/api/HamsterApi/GetListSearch";

                if (!string.IsNullOrEmpty(searchTerm))
                {
                    url += $"?searchTerm={searchTerm}";
                }

                client.DefaultRequestHeaders.Add("Authorization", "Bearer " + CurrentKullanici.JwtToken);

                var response = await client.GetAsync(url);

                var data = response.Content.ReadAsStringAsync();

                List<TablolarViewModel> modelList = new List<TablolarViewModel>();

                if (response.IsSuccessStatusCode)
                {
                    modelList = JsonConvert.DeserializeObject<List<TablolarViewModel>>(data.Result);
                }

                return View(modelList);
            }
        } 
    }
}
