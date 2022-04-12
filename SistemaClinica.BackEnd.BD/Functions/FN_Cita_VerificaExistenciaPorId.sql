CREATE  FUNCTION dbo.FN_Cita_VerificaExistenciaPorId ( 
	@IdCita VARCHAR(10))
RETURNS BIT AS
BEGIN
	DECLARE @ExisteCita BIT;
	
	SET @ExisteCita = (SELECT count(IdCita) FROM Cita WHERE IdCita = @IdCita)
	 
    RETURN @ExisteCita
END;