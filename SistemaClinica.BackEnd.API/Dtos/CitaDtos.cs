using System.ComponentModel.DataAnnotations;

namespace SistemaClinica.BackEnd.API.Dtos
{
    public class CitaDtos
    {
		[Required(ErrorMessage = "{0} es un campo obligatorio")]
		[MaxLength(4, ErrorMessage = "{0} tiene que tener máximo {1} caracteres")]
		public int IdCita { get; set; }

		[Required(ErrorMessage = "{0} es un campo obligatorio")]
		[MaxLength(8, ErrorMessage = "{0} tiene que tener máximo {1} caracteres")]
		public DateTime? FechaHora { get; set; }

		[Required(ErrorMessage = "{0} es un campo obligatorio")]
		[MaxLength(50, ErrorMessage = "{0} tiene que tener máximo {1} caracteres")]
		public string IdEnfermedad { get; set; }


		[Required(ErrorMessage = "{0} es un campo obligatorio")]
		[MaxLength(50, ErrorMessage = "{0} tiene que tener máximo {1} caracteres")]
		public string IdDoctor { get; set; }


		[Required(ErrorMessage = "{0} es un campo obligatorio")]
		[MaxLength(50, ErrorMessage = "{0} tiene que tener máximo {1} caracteres")]
		public int? IdConsultorio { get; set; }

		[Required(ErrorMessage = "{0} es un campo obligatorio")]
		[MaxLength(9, ErrorMessage = "{0} tiene que tener máximo {1} caracteres")]
		public decimal? MontoConsulta { get; set; }

		[Required(ErrorMessage = "{0} es un campo obligatorio")]
		[MaxLength(9, ErrorMessage = "{0} tiene que tener máximo {1} caracteres")]
		public decimal? MontoMedicamento { get; set; }

		[Required(ErrorMessage = "{0} es un campo obligatorio")]
		[MaxLength(9, ErrorMessage = "{0} tiene que tener máximo {1} caracteres")]
		public decimal? MontoTotal { get; set; }

		[Required(ErrorMessage = "{0} es un campo obligatorio")]
		[MaxLength(4, ErrorMessage = "{0} tiene que tener máximo {1} caracteres")]
		public int? IdEstado { get; set; }

		[Required(ErrorMessage = "{0} es un campo obligatorio")]
		[MaxLength(1, ErrorMessage = "{0} tiene que tener máximo {1} caracteres")]
		public bool Activo { get; set; }
	}
}
