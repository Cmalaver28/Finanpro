public class Ahorro
{
    public int Id { get; set; }
    public decimal Monto { get; set; }
    public DateTime Fecha { get; set; }
    public int UsuarioId { get; set; }
    public Usuario Usuario { get; set; }
    public int BolsilloId { get; set; }
    public Bolsillo Bolsillo { get; set; }
}
