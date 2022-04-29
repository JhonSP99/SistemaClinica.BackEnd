using System.ComponentModel.DataAnnotations;

namespace SistemaClinica.BackEnd.API.Dtos
{
    public class MedicamentoDtos
    {
		[Required(ErrorMessage = "{0} es un campo obligatorio")]
		[MaxLength(4, ErrorMessage = "{0} tiene que tener máximo {1} caracteres")]
		public int IdMedicamento { get; set; }

		[Required(ErrorMessage = "{0} es un campo obligatorio")]
		[MaxLength(20, ErrorMessage = "{0} tiene que tener máximo {1} caracteres")]
		public string Nombre { get; set; }

		[Required(ErrorMessage = "{0} es un campo obligatorio")]
		[MaxLength(30, ErrorMessage = "{0} tiene que tener máximo {1} caracteres")]
		public string ModoAdministración { get; set; }

		[Required(ErrorMessage = "{0} es un campo obligatorio")]
		[MaxLength(20, ErrorMessage = "{0} tiene que tener máximo {1} caracteres")]
		public string Función { get; set; }

		[Required(ErrorMessage = "{0} es un campo obligatorio")]
		[MaxLength(9, ErrorMessage = "{0} tiene que tener máximo {1} caracteres")]
		public decimal? Precio { get; set; }

		[Required(ErrorMessage = "{0} es un campo obligatorio")]
		[MaxLength(1, ErrorMessage = "{0} tiene que tener máximo {1} caracteres")]
		public bool Activo { get; set; }

		
	}
}
