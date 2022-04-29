using System.ComponentModel.DataAnnotations;

namespace SistemaClinica.BackEnd.API.Dtos
{
	public class PacienteDtos
	{
		[Required(ErrorMessage = "{0} es un campo obligatorio")]
		[MaxLength(4, ErrorMessage = "{0} tiene que tener máximo {1} caracteres")]
		public string Idpaciente { get; set; }

		[Required(ErrorMessage = "{0} es un campo obligatorio")]
		[MaxLength(20, ErrorMessage = "{0} tiene que tener máximo {1} caracteres")]
		public string Nombre { get; set; }

		[Required(ErrorMessage = "{0} es un campo obligatorio")]
		[MaxLength(30, ErrorMessage = "{0} tiene que tener máximo {1} caracteres")]
		public string Apellidos { get; set; }

		[Required(ErrorMessage = "{0} es un campo obligatorio")]
		[MaxLength(8, ErrorMessage = "{0} tiene que tener máximo {1} caracteres")]
		public DateTime? FechaNacimiento { get; set; }

		[Required(ErrorMessage = "{0} es un campo obligatorio")]
		[MaxLength(10, ErrorMessage = "{0} tiene que tener máximo {1} caracteres")]
		public string Telefono { get; set; }

		[Required(ErrorMessage = "{0} es un campo obligatorio")]
		[MaxLength(30, ErrorMessage = "{0} tiene que tener máximo {1} caracteres")]
		public string Email { get; set; }


		[Required(ErrorMessage = "{0} es un campo obligatorio")]
		[MaxLength(1, ErrorMessage = "{0} tiene que tener máximo {1} caracteres")]
		public bool Activo { get; set; }

	}
}
