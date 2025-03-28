using System.ComponentModel.DataAnnotations;

public class Ingreso
{
    [Key]
    public Guid Id { get; set; } = Guid.NewGuid();

    [Required]
    public Guid UsuarioId { get; set; }

    public Usuario Usuario { get; set; }

    [Required]
    public decimal Monto { get; set; }

    [Required]
    public int Mes { get; set; }

    public Guid? EtiquetaId { get; set; }

    public Etiqueta Etiqueta { get; set; }
}
