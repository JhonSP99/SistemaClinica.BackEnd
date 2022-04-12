CREATE FUNCTION FN_Clinica_VerificaExistenciaPorId (@IdClinica VARCHAR(10))
RETURNS BIT AS
BEGIN
	DECLARE @ExisteClinica BIT;
	
	SET @ExisteClinica = (SELECT count(IdClinica) FROM Clinica WHERE IdClinica = @IdClinica)
	 
    RETURN @ExisteClinica
END;