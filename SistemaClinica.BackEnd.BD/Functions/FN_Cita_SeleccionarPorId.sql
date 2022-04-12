CREATE FUNCTION dbo.FN_Cita_SeleccionarPorId(
	@IdCita VARCHAR(10)
)
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_Cita_SeleccionarTodos AS Cita
		WHERE 
			IdCita = @IdCita