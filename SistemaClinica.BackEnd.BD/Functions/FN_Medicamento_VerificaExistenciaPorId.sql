CREATE  FUNCTION dbo.FN_Medicamento_VerificaExistenciaPorId ( 
	@IdMedicamento VARCHAR(10))
RETURNS BIT AS
BEGIN
	DECLARE @ExisteMedicamento BIT;
	
	SET @ExisteMedicamento = (SELECT count(IdMedicamento) FROM Medicamentos WHERE IdMedicamento = @IdMedicamento)
	 
    RETURN @ExisteMedicamento
END