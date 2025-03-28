using System.ComponentModel.DataAnnotations;

public class Egreso
{
    [Key]
    public Guid Id { get; set; } = Guid.NewGuid();

    [Required]
    public Guid UsuarioId { get; set; }

    public Usuario Usuario { get; set; }

    [Required]
    public decimal Monto { get; set; }

    public DateTime Fecha { get; set; } = DateTime.Now;

    public Guid? EtiquetaId { get; set; }

    public Etiqueta Etiqueta { get; set; }
}
