CREATE PROCEDURE SP_Paciente_Actualizar
	@Idpaciente VARCHAR(10),
	@Horario VARCHAR(30),
	@ModificadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @ExistePaciente BIT
		
			SET @ExistePaciente = dbo.FN_Paciente_VerificaExistenciaPorId(@Idpaciente)
		
			IF(@ExistePaciente = 1)
				BEGIN
					UPDATE Paciente
					SET
						FechaModificacion = GETDATE(),
						ModificadoPor = @ModificadoPor
					WHERE 
						Idpaciente = @Idpaciente

					SET @ExisteError = 0
				END
			ELSE
				BEGIN
					SET @ExisteError = 1
					SET @DetalleError = 'Paciente: '+	@Idpaciente	+' No Existe'
				END
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH

		ROLLBACK TRANSACTION
		
		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error actualizado el Paciente: '+	@Idpaciente	+ '. Número de Error: ' + @NumeroDeError		

	END CATCH