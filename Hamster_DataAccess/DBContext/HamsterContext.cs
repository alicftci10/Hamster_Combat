using System;
using System.Collections.Generic;
using Hamster_DataAccess.DBModels;
using Microsoft.EntityFrameworkCore;

namespace Hamster_DataAccess.DBContext;

public partial class HamsterContext : DbContext
{
    public HamsterContext()
    {
    }

    public HamsterContext(DbContextOptions<HamsterContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Kullanici> Kullanicis { get; set; }

    public virtual DbSet<Legal> Legals { get; set; }

    public virtual DbSet<Market> Markets { get; set; }

    public virtual DbSet<PrTeam> PrTeams { get; set; }

    public virtual DbSet<Special> Specials { get; set; }

    public virtual DbSet<Web3> Web3s { get; set; }

    public virtual DbSet<Yetki> Yetkis { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Server=ALI\\SQLEXPRESS;Database=Hamster;Trusted_Connection=True;TrustServerCertificate=True");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Kullanici>(entity =>
        {
            entity.ToTable("Kullanici");

            entity.Property(e => e.Ad).HasMaxLength(50);
            entity.Property(e => e.KayitTarihi).HasColumnType("datetime");
            entity.Property(e => e.KullaniciAdi).HasMaxLength(50);
            entity.Property(e => e.Sifre).HasMaxLength(50);
            entity.Property(e => e.Soyad).HasMaxLength(50);

            entity.HasOne(d => d.YetkiNavigation).WithMany(p => p.Kullanicis)
                .HasForeignKey(d => d.Yetki)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Kullanici_Yetki");
        });

        modelBuilder.Entity<Legal>(entity =>
        {
            entity.ToTable("Legal");

            entity.Property(e => e.Sag).HasMaxLength(50);
            entity.Property(e => e.Sol).HasMaxLength(50);
            entity.Property(e => e.Sonuc).HasColumnType("decimal(18, 2)");

            entity.HasOne(d => d.Kullanici).WithMany(p => p.Legals)
                .HasForeignKey(d => d.KullaniciId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Legal_Kullanici");
        });

        modelBuilder.Entity<Market>(entity =>
        {
            entity.Property(e => e.Sag).HasMaxLength(50);
            entity.Property(e => e.Sol).HasMaxLength(50);
            entity.Property(e => e.Sonuc).HasColumnType("decimal(18, 2)");

            entity.HasOne(d => d.Kullanici).WithMany(p => p.Markets)
                .HasForeignKey(d => d.KullaniciId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Markets_Kullanici");
        });

        modelBuilder.Entity<PrTeam>(entity =>
        {
            entity.ToTable("PR&Team");

            entity.Property(e => e.Sag).HasMaxLength(50);
            entity.Property(e => e.Sol).HasMaxLength(50);
            entity.Property(e => e.Sonuc).HasColumnType("decimal(18, 2)");

            entity.HasOne(d => d.Kullanici).WithMany(p => p.PrTeams)
                .HasForeignKey(d => d.KullaniciId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_PR&Team_Kullanici");
        });

        modelBuilder.Entity<Special>(entity =>
        {
            entity.Property(e => e.GeriSayim).HasColumnType("datetime");
            entity.Property(e => e.Orta).HasMaxLength(50);
            entity.Property(e => e.Sag).HasMaxLength(50);
            entity.Property(e => e.Sol).HasMaxLength(50);
            entity.Property(e => e.Sonuc).HasColumnType("decimal(18, 2)");

            entity.HasOne(d => d.Kullanici).WithMany(p => p.Specials)
                .HasForeignKey(d => d.KullaniciId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Specials_Kullanici");
        });

        modelBuilder.Entity<Web3>(entity =>
        {
            entity.ToTable("Web3");

            entity.Property(e => e.Sag).HasMaxLength(50);
            entity.Property(e => e.Sol).HasMaxLength(50);
            entity.Property(e => e.Sonuc).HasColumnType("decimal(18, 2)");

            entity.HasOne(d => d.Kullanici).WithMany(p => p.Web3s)
                .HasForeignKey(d => d.KullaniciId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Web3_Kullanici");
        });

        modelBuilder.Entity<Yetki>(entity =>
        {
            entity.ToTable("Yetki");

            entity.Property(e => e.YetkiAdi).HasMaxLength(50);
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
