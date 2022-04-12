CREATE FUNCTION dbo.FN_DiagnosticoCita_VerificaExistenciaPorId( 
	@IdCita VARCHAR(10))
RETURNS BIT AS
BEGIN
	DECLARE @ExisteDiagnosticoCita BIT;
	
	SET @ExisteDiagnosticoCita = (SELECT count(IdCita) FROM DiagnosticoCita WHERE IdCita = @IdCita)
	 
    RETURN @ExisteDiagnosticoCita
END