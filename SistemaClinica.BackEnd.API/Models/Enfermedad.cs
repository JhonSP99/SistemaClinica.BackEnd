namespace SistemaClinica.BackEnd.API.Models
{
    public class Enfermedad
    {
		public string IdEnfermedad { get; set; }

		public string Nombre { get; set; }

		public bool Activo { get; set; }

		public DateTime FechaCreacion { get; set; }

		public DateTime? FechaModificacion { get; set; }

		public string CreadoPor { get; set; }

		public string ModificadoPor { get; set; }
        public int IdCita { get; internal set; }
    }
}
