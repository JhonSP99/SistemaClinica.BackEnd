CREATE  FUNCTION dbo.FN_MedicamentosCitas_VerificaExistenciaPorId ( 
	@IdCita  VARCHAR(10))
RETURNS BIT AS
BEGIN
	DECLARE @ExisteMedicamentosCitas BIT;
	
	SET @ExisteMedicamentosCitas = (SELECT count(IdCita ) FROM MedicamentoCitas WHERE IdCita  = @IdCita)
	 
    RETURN @ExisteMedicamentosCitas
END