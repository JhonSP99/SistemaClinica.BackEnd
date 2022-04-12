CREATE  FUNCTION FN_Clinica_SeleccionarTodos()
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_Clinica_SeleccionarTodos