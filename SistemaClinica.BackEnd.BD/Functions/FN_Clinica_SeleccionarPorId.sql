CREATE  FUNCTION FN_Clinica_SeleccionarPorId(
	@IdClinica VARCHAR(10)
)


RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_Clinica_SeleccionarTodos AS Clinica
		WHERE 
			Clinica.IdClinica = @IdClinica