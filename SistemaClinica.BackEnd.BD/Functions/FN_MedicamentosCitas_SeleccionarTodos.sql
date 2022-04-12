CREATE  FUNCTION dbo.FN_MedicamentosCitas_SeleccionarTodos()
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_MedicamentosCitas_SeleccionarTodos