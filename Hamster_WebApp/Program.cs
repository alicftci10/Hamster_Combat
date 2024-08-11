using Microsoft.IdentityModel.Tokens;
using System.Text;

namespace Hamster_WebApp
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var builder = WebApplication.CreateBuilder(args);

            #region AddRazorRuntimeCompilation ekleyerek projemizin cshtml'inde yapýlan deðiþilikleri anlýk olarak sayfayý F5 dediðimizde görebiliriz.
            builder.Services.AddControllersWithViews().AddRazorRuntimeCompilation();
            #endregion

            #region Session Kullanabilmek için gerekli olan Services yapýlandýrmasý
            builder.Services.AddDistributedMemoryCache();
            builder.Services.AddSession(i =>
            {
                i.IdleTimeout = TimeSpan.FromHours(6);//Session süresini 6 saat olarak ayarladýk.
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

            app.UseSession();//Session yapýsýnýn kullanmasýný saðlar.

            app.UseRouting();

            app.UseAuthorization();

            app.MapControllerRoute(
                name: "default",
                pattern: "{controller=Hamster}/{action=HamsterListesi}/{id?}");

            app.Run();
        }
    }
}
