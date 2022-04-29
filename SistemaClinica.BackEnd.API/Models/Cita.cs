namespace SistemaClinica.BackEnd.API.Models
{
    public class Cita
    {
		public int IdCita { get; set; }

		public DateTime? FechaHora { get; set; }

		public string IdPaciente { get; set; }

		public string IdDoctor { get; set; }

		public int? IdConsultorio { get; set; }

		public decimal? MontoConsulta { get; set; }

		public decimal? MontoMedicamento { get; set; }

		public decimal? MontoTotal { get; set; }

		public int? IdEstado { get; set; }

		public DateTime FechaCreacion { get; set; }

		public DateTime? FechaModificacion { get; set; }

		public string CreadoPor { get; set; }

		public string ModificadoPor { get; set; }

		public bool Activo { get; set; }
	}
}
