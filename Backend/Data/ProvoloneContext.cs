using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using InternshippClass.Models;
using Microsoft.EntityFrameworkCore;
using Provolone.Domains.Entities;

namespace InternshippClass.Data
{
    public class ProvoloneContext : DbContext
    {
        public ProvoloneContext(DbContextOptions<ProvoloneContext> options)
            : base(options)
        {
        }

        public DbSet<User> Users { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            /*modelBuilder.Entity<Intern>()
                .HasOne(_ => _.Location)
                .WithMany(_ => _.LocalInterns)
                .HasForeignKey("locationId")
                .IsRequired();*/
        }
    }
}