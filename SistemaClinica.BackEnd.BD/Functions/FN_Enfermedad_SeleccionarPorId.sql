CREATE  FUNCTION dbo.FN_Enfermedad_SeleccionarPorId(
	@IdEnfermedad VARCHAR(10)
)
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_Enfermedad_SeleccionarTodos AS Enfermedades
		WHERE 
			Enfermedades.IdEnfermedad = @IdEnfermedad