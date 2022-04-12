CREATE FUNCTION dbo.FN_Enfermedad_VerificaExistenciaPorId ( 
	@IdEnfermedad VARCHAR(10))
RETURNS BIT AS
BEGIN
	DECLARE @ExisteEnfermedad BIT;
	
	SET @ExisteEnfermedad = (SELECT count(Id_Enfermedad) FROM Enfermedades WHERE Id_Enfermedad = @IdEnfermedad)
	 
    RETURN @ExisteEnfermedad
END;