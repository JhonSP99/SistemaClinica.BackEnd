CREATE  FUNCTION dbo.FN_Medicamento_SeleccionarPorId(
	@IdMedicamento VARCHAR(10)
)
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_Medicamento_SeleccionarTodos AS Medicamentos
		WHERE 
			Medicamentos.IdMedicamento = @IdMedicamento