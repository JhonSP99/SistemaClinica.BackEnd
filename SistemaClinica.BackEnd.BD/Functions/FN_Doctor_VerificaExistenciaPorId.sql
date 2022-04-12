CREATE  FUNCTION dbo.FN_Doctor_VerificaExistenciaPorId ( 
	@IdDoctor VARCHAR(10))
RETURNS BIT AS
BEGIN
	DECLARE @ExisteDoctor BIT;
	
	SET @ExisteDoctor = (SELECT count(IdDoctor) FROM Doctores WHERE IdDoctor = @IdDoctor)
	 
    RETURN @ExisteDoctor
END