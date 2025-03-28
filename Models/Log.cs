using System;

public class Log
{
    public int Id { get; set; }
    public string Tipo { get; set; } 
    public string Mensaje { get; set; }
    public string Detalle { get; set; }
    public DateTime Fecha { get; set; } = DateTime.Now;
}
