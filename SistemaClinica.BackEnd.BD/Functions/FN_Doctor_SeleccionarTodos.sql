CREATE  FUNCTION dbo.FN_Doctor_SeleccionarTodos()
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_Doctor_SeleccionarTodos