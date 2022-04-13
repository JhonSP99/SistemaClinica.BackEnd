CREATE PROCEDURE SP_Cita_Desactivar
	@IdCita VARCHAR(10),
	@ModificadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR (60) OUTPUT
	AS 
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @ExisteCita BIT

			SET @ExisteCita = dbo.FN_Cita_VerificaExistenciaPorId(@ExisteCita)

			IF(@ExisteCita = 1)
				BEGIN
					UPDATE Cita
					SET
						
						FechaModificacion = GETDATE(),
						ModificadoPor = @ModificadoPor
					WHERE 
						IdCita = @IdCita

					SET @ExisteError = 0
				END 
			ELSE
				BEGIN
					SET @ExisteError = 1
					SET @DetalleError = 'Cita: '+	@IdCita	+' No Existe'
				END
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		
		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error al eliminar el Cita: '+	@IdCita	+ '. Número de Error: ' + @NumeroDeError

	END CATCH
	GO