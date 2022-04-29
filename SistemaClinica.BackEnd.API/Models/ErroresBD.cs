namespace SistemaClinica.BackEnd.API.Models
{
    public class ErroresBD
    {
		public int IdError { get; set; }

		public int? NumeroDeError { get; set; }

		public string MensajeDelError { get; set; }

		public int? LineaDelError { get; set; }

		public DateTime FechaCreacion { get; set; }

		public string CreadoPor { get; set; }
	}
}
