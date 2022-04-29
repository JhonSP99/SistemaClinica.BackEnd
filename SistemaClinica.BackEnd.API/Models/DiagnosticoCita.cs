namespace SistemaClinica.BackEnd.API.Models
{
    public class DiagnosticoCita
    {
		public int IdCita { get; set; }

		public string IdEnfermedad { get; set; }

		public string Detalle { get; set; }

		public bool? Activo { get; set; }

		public DateTime FechaCreacion { get; set; }

		public DateTime? FechaModificacion { get; set; }

		public string CreadoPor { get; set; }

		public string ModificadoPor { get; set; }

	}
}
