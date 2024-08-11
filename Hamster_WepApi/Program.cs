using Hamster_Business.Interfaces;
using Hamster_Business.Managers;
using Hamster_DataAccess.DBContext;
using Hamster_DataAccess.DBModels;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using System.Text;

namespace Hamster_WepApi
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var builder = WebApplication.CreateBuilder(args);

            #region DI SINIFI HAMSTERCONTEXT
            //builder.Services.AddDbContext<HamsterContext>(options =>
            //options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection")));
            #endregion

            // Add services to the container.

            builder.Services.AddControllers();
            // Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
            builder.Services.AddEndpointsApiExplorer();
            builder.Services.AddSwaggerGen();

            #region Generic Repository scoped eklemeleri
            //builder.Services.AddScoped(typeof(IGenericRepository<>), typeof(GenericRepository<>));
            //builder.Services.AddScoped<ILegalService, LegalService>();
            #endregion

            #region JWT Token Konfigürasyonu - Microsoft.AspNetCore.Authentication.JwtBearer
            /*
             * JWT konfigürasyonu için "Microsoft.AspNetCore.Authentication.JwtBearer" nuget package'si kurulur.
             */

            var key = Encoding.UTF8.GetBytes("UCi9U2H{53(1RePt{Cwc8H9B>5q%rHkS");

            builder.Services.AddAuthentication(options =>
            {
                options.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
                options.DefaultScheme = JwtBearerDefaults.AuthenticationScheme;
                options.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
            }).AddJwtBearer(o =>
            {
                o.TokenValidationParameters = new TokenValidationParameters
                {
                    ValidateIssuer = true,
                    ValidateAudience = true,
                    ValidateLifetime = true,
                    ValidateIssuerSigningKey = true,
                    ValidIssuer = "HamsterJWTIssuer",
                    ValidAudience = "HamsterJWTAudience",
                    IssuerSigningKey = new SymmetricSecurityKey(key)
                };
            });

            builder.Services.AddAuthorization();

            #endregion

            #region Session Kullanabilmek için gerekli olan Services yapýlandýrmasý
            builder.Services.AddDistributedMemoryCache();
            builder.Services.AddSession(i =>
            {
                i.IdleTimeout = TimeSpan.FromHours(6);//Session süresini 6 saat olarak ayarladýk.
            });
            #endregion

            builder.Services.AddTransient<IKullaniciService, KullaniciManager>();
            builder.Services.AddTransient<IHamsterService, HamsterManager>();
            builder.Services.AddTransient<IPRTeamService, PRTeamManager>();
            builder.Services.AddTransient<IMarketsService, MarketsManager>();
            builder.Services.AddTransient<ILegalService, LegalManager>();
            builder.Services.AddTransient<IWeb3Service, Web3Manager>();
            builder.Services.AddTransient<ISpecialsService, SpecialsManager>();


            var app = builder.Build();

            // Configure the HTTP request pipeline.
            if (app.Environment.IsDevelopment())
            {
                app.UseSwagger();
                app.UseSwaggerUI();
            }

            app.UseHttpsRedirection();

            app.UseSession();//Session yapýsýnýn kullanmasýný saðlar.

            #region JWT Konfigürasyonu
            app.UseAuthentication();// JWT doðrulama middleware'i
            app.UseAuthorization();// Yetkilendirilme middleware'i
            #endregion


            app.MapControllers();

            app.Run();
        }
    }
}
