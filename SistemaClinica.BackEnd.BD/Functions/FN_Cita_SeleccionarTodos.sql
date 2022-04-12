CREATE  FUNCTION dbo.FN_Cita_SeleccionarTodos()
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_Cita_SeleccionarTodos