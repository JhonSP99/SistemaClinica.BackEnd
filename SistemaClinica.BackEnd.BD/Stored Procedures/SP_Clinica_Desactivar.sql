CREATE PROCEDURE SP_Clinica_Desactivar
	@IdClinica VARCHAR(10),
	@ModificadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR (60) OUTPUT
	AS 
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @ExisteClinica BIT

			SET @ExisteClinica = dbo.FN_Clinica_VerificaExistenciaPorId(@IdClinica)

			IF(@ExisteClinica = 1)
				BEGIN
					UPDATE Clinica
					SET
						Activo = 0,
						FechaModificacion = GETDATE(),
						ModificadoPor = @ModificadoPor
					WHERE 
						IdClinica = @IdClinica

					SET @ExisteError = 0
				END 
			ELSE
				BEGIN
					SET @ExisteError = 1
					SET @DetalleError = 'Clinica: '+	@IdClinica	+' No Existe'
				END
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		
		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error al eliminar Clinica '+	@IdClinica	+ '. Número de Error: ' + @NumeroDeError

	END CATCH