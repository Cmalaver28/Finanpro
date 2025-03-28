using System.ComponentModel.DataAnnotations;

public class Etiqueta
{
    [Key]
    public Guid Id { get; set; } = Guid.NewGuid();

    [Required]
    public Guid UsuarioId { get; set; }

    public Usuario Usuario { get; set; }

    [Required]
    public string Nombre { get; set; }
}
