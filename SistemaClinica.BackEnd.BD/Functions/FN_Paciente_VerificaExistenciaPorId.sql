CREATE  FUNCTION FN_Paciente_VerificaExistenciaPorId ( 
	@Idpaciente VARCHAR(10))
RETURNS BIT AS
BEGIN
	DECLARE @ExistePaciente BIT;
	
	SET @ExistePaciente = (SELECT count(Idpaciente) FROM Paciente WHERE Idpaciente = @Idpaciente)
	 
    RETURN @ExistePaciente
END;