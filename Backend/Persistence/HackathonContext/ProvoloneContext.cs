using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Provolone.Persistence.HackathonContext
{
    public partial class ProvoloneContext : DbContext
    {
        public ProvoloneContext()
        {
        }

        public ProvoloneContext(DbContextOptions<ProvoloneContext> options)
            : base(options)
        {
        }

        //public virtual DbSet<TestDB> TestTable { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseNpgsql("Host=localhost;Database=Hackathon;Username=postgres;Password=qwerty1234;Port=5432;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("Relational:Collation", "English_United States.1252");

            /*modelBuilder.Entity<TestDB>(entity =>
            {
                entity.ToTable("TestTable");

                entity.Property(e => e.Id).ValueGeneratedNever();
            });*/

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
