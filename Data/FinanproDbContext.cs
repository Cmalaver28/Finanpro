using Microsoft.EntityFrameworkCore;

namespace Finanpro.Data
{
    public class FinanproDbContext : DbContext
    {
        public FinanproDbContext(DbContextOptions<FinanproDbContext> options) : base(options) { }

        public DbSet<Usuario> Usuarios { get; set; }
        public DbSet<Ingreso> Ingresos { get; set; }
        public DbSet<Egreso> Egresos { get; set; }
        public DbSet<Etiqueta> Etiquetas { get; set; }
        public DbSet<Bolsillo> Bolsillos { get; set; }
        public DbSet<Ahorro> Ahorros { get; set; }
        public DbSet<Presupuesto> Presupuestos { get; set; }
        public DbSet<Log> Logs { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Ahorro>()
                .HasOne(a => a.Usuario)
                .WithMany(u => u.Ahorro)
                .HasForeignKey(a => a.UsuarioId)
                .OnDelete(DeleteBehavior.NoAction); 

            modelBuilder.Entity<Ahorro>()
                .HasOne(a => a.Bolsillo)
                .WithMany(b => b.Ahorro)
                .HasForeignKey(a => a.BolsilloId)
                .OnDelete(DeleteBehavior.NoAction); 

            base.OnModelCreating(modelBuilder);
        }
    }
}
