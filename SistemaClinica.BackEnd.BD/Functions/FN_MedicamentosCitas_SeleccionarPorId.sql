CREATE  FUNCTION dbo.FN_MedicamentosCitas_SeleccionarPorId(
	@IdCita VARCHAR(10)
)
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_MedicamentosCitas_SeleccionarTodos AS MedicamentosCitas
		WHERE 
			IdCita = @IdCita