CREATE  FUNCTION dbo.FN_DiagnosticoCita_SeleccionarPorId(
	@IdCita VARCHAR(10)
)
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_Cita_SeleccionarTodos AS DiagnosticoCita
		WHERE 
			IdCita = @IdCita