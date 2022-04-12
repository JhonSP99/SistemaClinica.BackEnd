CREATE  FUNCTION dbo.FN_Enfermedad_SeleccionarTodos()
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_Enfermedad_SeleccionarTodos