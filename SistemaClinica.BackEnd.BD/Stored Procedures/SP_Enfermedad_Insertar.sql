CREATE  PROCEDURE SP_Enfermedad_Insertar
	@IdEnfermedad VARCHAR(10),
	@CreadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY		
		BEGIN TRANSACTION
			
			INSERT INTO Enfermedades( IdEnfermedad,  CreadoPor)
			VALUES(@IdEnfermedad,  @CreadoPor)		

			SET @ExisteError = 0

		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	
		ROLLBACK TRANSACTION

		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @CreadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error insertando una Enfermedad. Número de Error: ' + @NumeroDeError
		
	END CATCH