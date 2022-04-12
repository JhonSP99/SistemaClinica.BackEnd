CREATE  FUNCTION dbo.FN_EstadoCita_SeleccionarPorId(
	@idEstado VARCHAR(10)
)
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_EstadoCita_SeleccionarTodos AS EstadoCita
		WHERE 
			@idEstado = @idEstado