using Hackathon.Contract;
using Hackathon.Contract.Authentication;
using Hackathon.Manager;
using Heckathon.Authentication;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Microsoft.OpenApi.Models;
using Provolone.Persistence.HackathonContext;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Provolone
{
    public class Startup
    {
        private string ConnectionString;
        public Startup(IConfiguration configuration, IWebHostEnvironment env)
        {
            Configuration = configuration;
            ConnectionString = env.IsDevelopment() ? Configuration.GetConnectionString("DefaultConnection") : GetConnectionString();
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddDbContext<ProvoloneContext>(options =>
                options.UseNpgsql(
                    ConnectionString));
            services.AddDatabaseDeveloperPageExceptionFilter();

            services.AddControllers();
            services.AddScoped<IAuthenticationManager, AuthenticationManager>();
            services.AddScoped<IAuthenticationToken, AuthenticationToken>();
            services.AddScoped<IUserService, UserService>();
            services.AddScoped<ProvoloneContext>();

            services.AddCors(o => o.AddPolicy("MyPolicy", builder =>
            {
                builder.AllowAnyOrigin()
                       .AllowAnyMethod()
                       .AllowAnyHeader();
            }));

            services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1", new OpenApiInfo { Title = "Provolone", Version = "v1" });
                c.AddSecurityDefinition("Bearer", new OpenApiSecurityScheme()
                {
                    Name = "Authorization",
                    Type = SecuritySchemeType.ApiKey,
                    Scheme = "Bearer",
                    BearerFormat = "JWT",
                    In = ParameterLocation.Header,
                    Description = "JWT Authorization header using the Bearer scheme. \r\n\r\n Enter 'Bearer' [space] and then your token in the text input below.\r\n\r\nExample: \"Bearer 12345abcdef\"",
                });
                c.AddSecurityRequirement(new OpenApiSecurityRequirement
                {
                    {
                          new OpenApiSecurityScheme
                            {
                                Reference = new OpenApiReference
                                {
                                    Type = ReferenceType.SecurityScheme,
                                    Id = "Bearer"
                                }
                            },
                            new string[] {}
                    }
                });
            });
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
                app.UseSwagger();
                app.UseSwaggerUI(c => c.SwaggerEndpoint("/swagger/v1/swagger.json", "Provolone v1"));
            }

            app.UseHttpsRedirection();

            app.UseRouting();
            app.UseCors("MyPolicy");

            app.UseAuthorization();

            app.UseMigrationsEndPoint();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }

        private string GetConnectionString()
        {
            var envDbUrl = Environment.GetEnvironmentVariable("DATABASE_URL");
            var herokuConnectionString = ConvertDatabaseUrlToHerokuString(envDbUrl);
            return herokuConnectionString;
        }

        public static string ConvertDatabaseUrlToHerokuString(string envDatabaseUrl)
        {
            Uri url;
            bool isUrl = Uri.TryCreate(envDatabaseUrl, UriKind.Absolute, out url);
            if (isUrl)
            {
                return $"Server={url.Host};Port={url.Port};Database={url.LocalPath.Substring(1)};User Id={url.UserInfo.Split(':')[0]};Password={url.UserInfo.Split(':')[1]};Pooling=true;SSL Mode=Require;Trust Server Certificate=True;";
            }

            throw new FormatException($"Database Url is not right format! Check this {envDatabaseUrl}.");
        }
    }
}
