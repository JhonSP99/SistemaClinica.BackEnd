CREATE FUNCTION dbo.FN_Doctor_SeleccionarPorId(
@IdDoctor VARCHAR(10)
)
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_Doctor_SeleccionarTodos AS Doctores
		WHERE 
			Doctores.IdDoctor = @IdDoctor