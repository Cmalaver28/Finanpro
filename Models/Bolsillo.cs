using System.Collections.Generic;

public class Bolsillo
{
    public int Id { get; set; }
    public string Nombre { get; set; }
    public decimal Saldo { get; set; }
    public ICollection<Ahorro> Ahorro { get; set; } = new List<Ahorro>();
}
