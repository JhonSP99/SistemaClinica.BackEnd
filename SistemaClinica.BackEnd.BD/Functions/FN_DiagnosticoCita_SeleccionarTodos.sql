CREATE FUNCTION dbo.FN_DiagnosticoCita_SeleccionarTodos()
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_DiagnosticoCita_SeleccionarTodos