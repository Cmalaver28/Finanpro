using System.Collections.Generic;

public class Usuario
{
    public int Id { get; set; }
    public string Nombre { get; set; }
    public string Email { get; set; }
    public string Contraseña { get; set; }
    public ICollection<Ahorro> Ahorro { get; set; } = new List<Ahorro>();
}
