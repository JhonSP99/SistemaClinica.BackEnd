namespace SistemaClinica.BackEnd.API.Models
{
    public class Medicamento
    {
		public int IdMedicamento { get; set; }

		public string Nombre { get; set; }

		public string ModoAdministración { get; set; }

		public string Función { get; set; }

		public decimal? Precio { get; set; }

		public bool Activo { get; set; }

		public DateTime FechaCreación { get; set; }

		public DateTime? FechaModificación { get; set; }

		public string CreadoPor { get; set; }

		public string ModificadoPor { get; set; }


	}
}
