CREATE  FUNCTION dbo.FN_Medicamento_SeleccionarTodos()
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_Medicamento_SeleccionarTodos