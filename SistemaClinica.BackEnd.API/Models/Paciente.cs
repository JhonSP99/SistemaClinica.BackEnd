namespace SistemaClinica.BackEnd.API.Models
{
    public class Paciente
    {
		public string Idpaciente { get; set; }

		public string Nombre { get; set; }

		public string Apellidos { get; set; }

		public DateTime? FechaNacimiento { get; set; }

		public string Telefono { get; set; }

		public string Email { get; set; }

		public string Horario { get; set; }

		public bool Activo { get; set; }

		public DateTime FechaCreacion { get; set; }

		public DateTime? FechaModificacion { get; set; }

		public string CreadoPor { get; set; }

		public string ModificadoPor { get; set; }
        public int IdCita { get; internal set; }
    }
}
