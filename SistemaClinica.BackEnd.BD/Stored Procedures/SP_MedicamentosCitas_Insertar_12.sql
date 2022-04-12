CREATE  PROCEDURE SP_MedicamentosCitas_Insertar
	@IdCita int,
	@IdMedicamento int,
	@Precio decimal,
	@CreadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY		
		BEGIN TRANSACTION
			
			INSERT INTO MedicamentoCitas(IdCita,IdMedicamento,Precio, CreadoPor)
			VALUES(@IdCita ,@IdMedicamento,@Precio,  @CreadoPor)		

			SET @ExisteError = 0

		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	
		ROLLBACK TRANSACTION

		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @CreadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error insertando un medicamento. Número de Error: ' + @IdCita
		
	END CATCH