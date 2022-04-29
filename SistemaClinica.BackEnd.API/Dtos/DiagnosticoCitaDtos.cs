using System.ComponentModel.DataAnnotations;

namespace SistemaClinica.BackEnd.API.Dtos
{
    public class DiagnosticoCitaDtos
    {
		[Required(ErrorMessage = "{0} es un campo obligatorio")]
		[MaxLength(4, ErrorMessage = "{0} tiene que tener máximo {1} caracteres")]
		public int IdCita { get; set; }

		[Required(ErrorMessage = "{0} es un campo obligatorio")]
		[MaxLength(50, ErrorMessage = "{0} tiene que tener máximo {1} caracteres")]
		public string IdEnfermedad { get; set; }

		[Required(ErrorMessage = "{0} es un campo obligatorio")]
		[MaxLength(50, ErrorMessage = "{0} tiene que tener máximo {1} caracteres")]
		public string Detalle { get; set; }

	}
}
