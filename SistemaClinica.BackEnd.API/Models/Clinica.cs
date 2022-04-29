namespace SistemaClinica.BackEnd.API.Models
{
    public class Clinica
    {
		public int IdClinica { get; set; }

		public string Nombre { get; set; }

		public string Lugar { get; set; }

		public string Telefono { get; set; }

		public string Email { get; set; }

		public string Horario { get; set; }

		public bool Activo { get; set; }

		public DateTime FechaCreacion { get; set; }

		public DateTime? FechaModificacion { get; set; }

		public string CreadoPor { get; set; }

		public string ModificadoPor { get; set; }

	}
}
