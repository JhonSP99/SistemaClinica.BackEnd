CREATE  FUNCTION FN_EstadoCita_VerificaExistenciaPorId(@idEstado INT)
	RETURNS BIT AS
BEGIN 
	DECLARE @ExisteEstadoCita BIT;
	SET @ExisteEstadoCita =(SELECT COUNT(idEstado) FROM EstadoCita WHERE idEstado = @idEstado)

RETURN @ExisteEstadoCita
END