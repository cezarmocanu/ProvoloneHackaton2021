using Microsoft.AspNetCore.Hosting;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Provolone.Persistence.HackathonContext;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Provolone
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var host = CreateHostBuilder(args).Build();

            bool recreateDb = args.Contains("--recreateDb");
            InitializeDb(host, recreateDb);

            host.Run();
        }

        public static IHostBuilder CreateHostBuilder(string[] args) =>
            Host.CreateDefaultBuilder(args)
                .ConfigureWebHostDefaults(webBuilder =>
                {
                    webBuilder.UseStartup<Startup>();
                });

        private static void InitializeDb(IHost host, bool recreateDb)
        {
            using (var scope = host.Services.CreateScope())
            {
                var services = scope.ServiceProvider;
                var logger = services.GetRequiredService<ILogger<Program>>();

                try
                {
                    var context = services.GetRequiredService<ProvoloneContext>();
                    var webHostEnv = services.GetRequiredService<IWebHostEnvironment>();
                    if (webHostEnv.IsDevelopment() && recreateDb)
                    {
                        logger.LogDebug("User requested to recreate Database.");
                        context.Database.EnsureDeleted();
                        logger.LogWarning("Database was removed.");
                    }
                }
                catch (Exception ex)
                {
                    logger.LogError(ex, "An error occurred creating the DB.");
                }
            }
        }
    }
}
