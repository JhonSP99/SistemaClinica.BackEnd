namespace SistemaClinica.BackEnd.API.Models
{
    public class Doctor
    {
		public string IdDoctor { get; set; }

		public string Nombre { get; set; }

		public string Apellidos { get; set; }

		public bool Activo { get; set; }

		public DateTime FechaCreacion { get; set; }

		public DateTime? FechaModificacion { get; set; }

		public string CreadoPor { get; set; }

		public string ModificadoPor { get; set; }
        public int IdCita { get; internal set; }
        public string IdPaciente { get; internal set; }
    }
}
