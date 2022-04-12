CREATE PROCEDURE SP_Doctor_Actualizar
	@IdDoctor VARCHAR(10),
	@ModificadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @ExisteDoctor BIT
		
			SET @ExisteDoctor = dbo.FN_Doctor_VerificaExistenciaPorId(@ExisteDoctor)
		
			IF(@ExisteDoctor = 1)
				BEGIN
					UPDATE Doctores 
					SET
						FechaModificacion = GETDATE(),
						ModificadoPor = @ModificadoPor
					WHERE 
						IdDoctor = @IdDoctor

					SET @ExisteError = 0
				END
			ELSE
				BEGIN
					SET @ExisteError = 1
					SET @DetalleError = 'Doctor: '+	@IdDoctor	+' No Existe'
				END
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH

		ROLLBACK TRANSACTION
		
		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error actualizado el Doctor: '+	@IdDoctor	+ '. Número de Error: ' + @NumeroDeError		

	END CATCH