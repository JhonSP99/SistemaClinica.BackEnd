CREATE FUNCTION FN_Consultorio_SeleccionarTodos()
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_Consultorio_SeleccionarTodos