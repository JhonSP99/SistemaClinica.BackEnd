CREATE  PROCEDURE SP_DiagnosticoCita_Actualizar
	@IdCita int,
	@IdEnfermedades int,
	@ModificadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @ExisteDiagnosticoCita BIT
		
			SET @ExisteDiagnosticoCita = dbo.FN_DiagnosticoCita_VerificaExistenciaPorId(@ExisteDiagnosticoCita)
		
			IF(@ExisteDiagnosticoCita = 1)
				BEGIN
					UPDATE DiagnosticoCita 
					SET
						FechaModificacion = GETDATE(),
						ModificadoPor = @ModificadoPor
					WHERE 
						@IdCita = @IdCita

					SET @ExisteError = 0
				END
			ELSE
				BEGIN
					SET @ExisteError = 1
					SET @DetalleError = 'DiagnosticoCita: '+	@IdCita	+' No Existe'
				END
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH

		ROLLBACK TRANSACTION
		
		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error actualizado el Diagnostico cita: '+	@IdCita	+ '. Número de Error: ' + @NumeroDeError		

	END CATCH