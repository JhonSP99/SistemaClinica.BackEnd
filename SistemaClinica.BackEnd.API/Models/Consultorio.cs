namespace SistemaClinica.BackEnd.API.Models
{
    public class Consultorio
    {
		public int IdConsultorio { get; set; }

		public int? IdClinica { get; set; }

		public string Nombreconsultorio { get; set; }

		public string Direccion { get; set; }

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
