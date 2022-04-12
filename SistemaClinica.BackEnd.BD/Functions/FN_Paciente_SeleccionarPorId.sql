CREATE FUNCTION FN_Paciente_SeleccionarPorId(@Idpaciente VARCHAR(10))


RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_Paciente_SeleccionarTodos AS Pacientes
		WHERE 
			Pacientes.Idpaciente= @Idpaciente