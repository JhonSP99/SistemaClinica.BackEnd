CREATE  FUNCTION dbo.FN_EstadoCita_VerificaExistenciaPorId ( 
	@idEstado VARCHAR(10))
RETURNS BIT AS
BEGIN
	DECLARE @ExisteEstadoCita BIT;
	
	SET @ExisteEstadoCita = (SELECT count(idEstado) FROM EstadoCita WHERE idEstado = @idEstado)
	 
    RETURN @ExisteEstadoCita
END