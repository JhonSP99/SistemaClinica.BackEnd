using System.ComponentModel.DataAnnotations;

namespace SistemaClinica.BackEnd.API.Dtos
{
    public class EnfermedadDtos
    {
		[Required(ErrorMessage = "{0} es un campo obligatorio")]
		[MaxLength(50, ErrorMessage = "{0} tiene que tener máximo {1} caracteres")]
		public string IdEnfermedad { get; set; }

		[Required(ErrorMessage = "{0} es un campo obligatorio")]
		[MaxLength(20, ErrorMessage = "{0} tiene que tener máximo {1} caracteres")]
		public string Nombre { get; set; }

	}
}
