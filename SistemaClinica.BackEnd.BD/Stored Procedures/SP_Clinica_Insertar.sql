CREATE PROCEDURE SP_Clinica_Insertar
	@IdClinica VARCHAR(10),
	@Horario VARCHAR(30),
	@CreadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY		
		BEGIN TRANSACTION
			
			INSERT INTO Clinica(IdClinica, Horario, CreadoPor)
			VALUES(@IdClinica, @Horario, @CreadoPor)		

			SET @ExisteError = 0

		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	
		ROLLBACK TRANSACTION

		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @CreadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error insertando clinica. Número de Error: ' + @NumeroDeError
		
	END CATCH