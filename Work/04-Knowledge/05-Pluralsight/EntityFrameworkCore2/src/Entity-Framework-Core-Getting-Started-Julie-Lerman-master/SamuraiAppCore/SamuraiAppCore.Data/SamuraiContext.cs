using Microsoft.EntityFrameworkCore;
using SamuraiAppCore.Domain;

namespace SamuraiAppCore.Data
{
    public class SamuraiContext : DbContext
    {
        public DbSet<Samurai> Samurais { get; set; }
        public DbSet<Battle> Battles { get; set; }
        public DbSet<Quote> Quotes { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<SamuraiBattle>()
                .HasKey(s => new { s.BattleId, s.SamuraiId });
            //modelBuilder.Entity<Samurai>()
            //    .Property(s => new { s.SecretIdentity }).IsRequired();
            base.OnModelCreating(modelBuilder);
        }

        protected override void OnConfiguring(DbContextOptionsBuilder optionBuilder)
        {
            optionBuilder.UseSqlServer(
                "Server = (localdb)\\mssqllocaldb; Database = SamuraiData; Trusted_Connection = True; ");
        }
    }
}
