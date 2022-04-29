namespace SistemaClinica.BackEnd.API.Models
{
    public class MedicamentosCitas
    {
		public int? IdCita { get; set; }

		public int? IdMedicamento { get; set; }

		public decimal Precio { get; set; }

		public bool Activo { get; set; }

		public DateTime FechaCreacion { get; set; }

		public DateTime? FechaModificacion { get; set; }

		public string CreadoPor { get; set; }

		public string ModificadoPor { get; set; }


	}
}
