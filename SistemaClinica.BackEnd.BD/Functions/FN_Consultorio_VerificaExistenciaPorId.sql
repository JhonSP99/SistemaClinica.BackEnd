CREATE  FUNCTION FN_Consultorio_VerificaExistenciaPorId ( 
	@IdConsultorio VARCHAR(10))
RETURNS BIT AS
BEGIN
	DECLARE @ExisteConsultorio BIT;
	
	SET @ExisteConsultorio = (SELECT count(IdConsultorio) FROM Consultorio WHERE IdConsultorio = @IdConsultorio)
	 
    RETURN @ExisteConsultorio
END;