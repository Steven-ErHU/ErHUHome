using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace ScaffoldFromDatabase
{
    public partial class SamuraiDataCoreContext : DbContext
    {
        public SamuraiDataCoreContext()
        {
        }

        public SamuraiDataCoreContext(DbContextOptions<SamuraiDataCoreContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Battles> Battles { get; set; }
        public virtual DbSet<Quotes> Quotes { get; set; }
        public virtual DbSet<SamuraiBattle> SamuraiBattle { get; set; }
        public virtual DbSet<Samurais> Samurais { get; set; }
        public virtual DbSet<SecretIdentity> SecretIdentity { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. See http://go.microsoft.com/fwlink/?LinkId=723263 for guidance on storing connection strings.
                optionsBuilder.UseSqlServer("Server = (localdb)\\mssqllocaldb; Database = SamuraiDataCore; Trusted_Connection = True;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("ProductVersion", "2.2.0-rtm-35687");

            modelBuilder.Entity<Quotes>(entity =>
            {
                entity.HasIndex(e => e.SamuraiId);

                entity.HasOne(d => d.Samurai)
                    .WithMany(p => p.Quotes)
                    .HasForeignKey(d => d.SamuraiId);
            });

            modelBuilder.Entity<SamuraiBattle>(entity =>
            {
                entity.HasKey(e => new { e.BattleId, e.SamuraiId });

                entity.HasIndex(e => e.SamuraiId);

                entity.HasOne(d => d.Battle)
                    .WithMany(p => p.SamuraiBattle)
                    .HasForeignKey(d => d.BattleId);

                entity.HasOne(d => d.Samurai)
                    .WithMany(p => p.SamuraiBattle)
                    .HasForeignKey(d => d.SamuraiId);
            });

            modelBuilder.Entity<Samurais>(entity =>
            {
                entity.HasIndex(e => e.BattleId);

                entity.HasOne(d => d.Battle)
                    .WithMany(p => p.Samurais)
                    .HasForeignKey(d => d.BattleId);
            });

            modelBuilder.Entity<SecretIdentity>(entity =>
            {
                entity.HasIndex(e => e.SamuraiId)
                    .IsUnique();

                entity.HasOne(d => d.Samurai)
                    .WithOne(p => p.SecretIdentity)
                    .HasForeignKey<SecretIdentity>(d => d.SamuraiId);
            });
        }
    }
}
