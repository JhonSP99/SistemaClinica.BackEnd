namespace SistemaClinica.BackEnd.API.Models
{
    public class EstadoCita
    {
		public int idEstado { get; set; }

		public string Estado { get; set; }

		public bool Activo { get; set; }

		public DateTime FechaCreacion { get; set; }

		public DateTime? FechaModificacion { get; set; }

		public string CreadoPor { get; set; }

		public string ModificadoPor { get; set; }

	}
}
