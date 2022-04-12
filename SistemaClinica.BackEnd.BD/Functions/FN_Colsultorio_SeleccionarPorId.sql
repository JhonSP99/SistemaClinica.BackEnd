CREATE  FUNCTION FN_Colsultorio_SeleccionarPorId(@IdConsultorio VARCHAR(10))
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_Consultorio_SeleccionarTodos AS Consultorio
		WHERE 
			Consultorio.IdConsultorio = @IdConsultorio