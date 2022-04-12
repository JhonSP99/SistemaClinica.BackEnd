CREATE  FUNCTION dbo.FN_EstadoCita_SeleccionarTodos()
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_EstadoCita_SeleccionarTodos