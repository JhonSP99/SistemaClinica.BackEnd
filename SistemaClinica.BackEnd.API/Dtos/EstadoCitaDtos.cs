using System.ComponentModel.DataAnnotations;

namespace SistemaClinica.BackEnd.API.Dtos
{
	public class EstadoCitaDtos
	{
		[Required(ErrorMessage = "{0} es un campo obligatorio")]
		[MaxLength(4, ErrorMessage = "{0} tiene que tener máximo {1} caracteres")]
		public int idEstado { get; set; }

		[Required(ErrorMessage = "{0} es un campo obligatorio")]
		[MaxLength(25, ErrorMessage = "{0} tiene que tener máximo {1} caracteres")]
		public string Estado { get; set; }

		[Required(ErrorMessage = "{0} es un campo obligatorio")]
		[MaxLength(1, ErrorMessage = "{0} tiene que tener máximo {1} caracteres")]
		public bool Activo { get; set; }

	}
}
