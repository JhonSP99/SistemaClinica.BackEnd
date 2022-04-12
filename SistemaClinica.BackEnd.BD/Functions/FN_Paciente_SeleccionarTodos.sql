CREATE  FUNCTION FN_Paciente_SeleccionarTodos()
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_Paciente_SeleccionarTodos