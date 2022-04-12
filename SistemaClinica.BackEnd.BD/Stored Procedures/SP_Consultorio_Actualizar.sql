CREATE  PROCEDURE SP_Consultorio_Actualizar
	@IdConsultorio VARCHAR(10),
	@Horario VARCHAR(30),
	@ModificadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @ExisteConsultorio BIT
		
			SET @ExisteConsultorio = dbo.FN_Consultorio_VerificaExistenciaPorId(@ExisteConsultorio)
		
			IF(@ExisteConsultorio = 1)
				BEGIN
					UPDATE Consultorio
					SET
						FechaModificacion = GETDATE(),
						ModificadoPor = @ModificadoPor
					WHERE 
						IdConsultorio = @IdConsultorio

					SET @ExisteError = 0
				END
			ELSE
				BEGIN
					SET @ExisteError = 1
					SET @DetalleError = 'Consultorio: '+	@IdConsultorio	+' No Existe'
				END
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH

		ROLLBACK TRANSACTION
		
		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error actualizado el consultorio: '+	@IdConsultorio	+ '. Número de Error: ' + @NumeroDeError		

	END CATCH