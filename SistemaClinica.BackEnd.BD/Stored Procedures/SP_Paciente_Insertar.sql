CREATE  PROCEDURE SP_Paciente_Insertar
	@Idpaciente VARCHAR(10),
	@Horario VARCHAR(30),
	@CreadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY		
		BEGIN TRANSACTION
			
			INSERT INTO Paciente(IdPaciente, Horario, CreadoPor)
			VALUES(@Idpaciente, @Horario, @CreadoPor)		

			SET @ExisteError = 0

		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	
		ROLLBACK TRANSACTION

		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @CreadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error insertando Paciente. Número de Error: ' + @NumeroDeError
		
	END CATCH