CREATE FUNCTION dbo.FN_Enfermedad_VerificaExistenciaPorId ( 
	@IdEnfermedad VARCHAR(10))
RETURNS BIT AS
BEGIN
	DECLARE @ExisteEnfermedad BIT;
	
	SET @ExisteEnfermedad = (SELECT count(IdEnfermedad) FROM Enfermedades WHERE IdEnfermedad = @IdEnfermedad)
	 
    RETURN @ExisteEnfermedad
END;