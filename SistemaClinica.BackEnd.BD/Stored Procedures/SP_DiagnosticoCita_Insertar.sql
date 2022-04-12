CREATE  PROCEDURE SP_DiagnosticoCita_Insertar
	@IdCita int,
	@IdEnfermedades int,
	@CreadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY		
		BEGIN TRANSACTION
			
			INSERT INTO DiagnosticoCita(IdCita, IdEnfermedad, CreadoPor)
			VALUES(@IdCita, @IdEnfermedades, @CreadoPor)		

			SET @ExisteError = 0

		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	
		ROLLBACK TRANSACTION

		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @CreadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error insertando un DiagnosticoCita. Número de Error: ' + @NumeroDeError
		
	END CATCH