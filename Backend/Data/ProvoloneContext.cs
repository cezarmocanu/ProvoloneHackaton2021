using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using InternshippClass.Models;
using InternshippClass.Models.Entities;
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

        public DbSet<Role> Roles { get; set; }

        public DbSet<Permission> Permissions { get; set; }

        public DbSet<Discipline> Disciplines { get; set; }

        public DbSet<Field> Fields { get; set; }

        public DbSet<GroupToDiscipline> GroupsToDisciplines { get; set; }

        public DbSet<Learner> Learners { get; set; }

        public DbSet<Mark> Marks { get; set; }

        public DbSet<VocationalGroup> VocationalGroups { get; set; }

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