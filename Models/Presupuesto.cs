using System.ComponentModel.DataAnnotations;

public class Presupuesto
{
    [Key]
    public Guid Id { get; set; } = Guid.NewGuid();

    [Required]
    public Guid UsuarioId { get; set; }

    public Usuario Usuario { get; set; }

    [Required]
    public string Tipo { get; set; } 

    [Required]
    public decimal MontoEsperado { get; set; }

    [Required]
    public DateTime FechaInicio { get; set; }

    [Required]
    public DateTime FechaFin { get; set; }
}
