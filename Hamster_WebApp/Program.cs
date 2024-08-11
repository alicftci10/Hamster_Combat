using Microsoft.IdentityModel.Tokens;
using System.Text;

namespace Hamster_WebApp
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var builder = WebApplication.CreateBuilder(args);

            #region AddRazorRuntimeCompilation ekleyerek projemizin cshtml'inde yap�lan de�i�ilikleri anl�k olarak sayfay� F5 dedi�imizde g�rebiliriz.
            builder.Services.AddControllersWithViews().AddRazorRuntimeCompilation();
            #endregion

            #region Session Kullanabilmek i�in gerekli olan Services yap�land�rmas�
            builder.Services.AddDistributedMemoryCache();
            builder.Services.AddSession(i =>
            {
                i.IdleTimeout = TimeSpan.FromHours(6);//Session s�resini 6 saat olarak ayarlad�k.
            });
            #endregion

            var app = builder.Build();

            // Configure the HTTP request pipeline.
            if (!app.Environment.IsDevelopment())
            {
                app.UseExceptionHandler("/Home/Error");
                // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
                app.UseHsts();
            }

            app.UseHttpsRedirection();
            app.UseStaticFiles();

            app.UseSession();//Session yap�s�n�n kullanmas�n� sa�lar.

            app.UseRouting();

            app.UseAuthorization();

            app.MapControllerRoute(
                name: "default",
                pattern: "{controller=Hamster}/{action=HamsterListesi}/{id?}");

            app.Run();
        }
    }
}
