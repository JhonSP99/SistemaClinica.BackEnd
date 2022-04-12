CREATE  PROCEDURE SP_Consultorio_Insertar
	@IdConsultorio VARCHAR(10),
	@Horario VARCHAR(30),
	@CreadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY		
		BEGIN TRANSACTION
			
			INSERT INTO Consultorio(IdConsultorio, Horario, CreadoPor)
			VALUES(@IdConsultorio, @Horario, @CreadoPor)		

			SET @ExisteError = 0

		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	
		ROLLBACK TRANSACTION

		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @CreadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error insertando consultorio. Número de Error: ' + @NumeroDeError
		
	END CATCH