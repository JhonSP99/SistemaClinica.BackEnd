CREATE  PROCEDURE SP_Enfermedad_Desactivar
	@IdEnfermedad VARCHAR(10),
	@ModificadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR (60) OUTPUT
	AS 
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @ExisteEnfermedad BIT

			SET @ExisteEnfermedad = dbo.FN_Enfermedad_VerificaExistenciaPorId(@ExisteEnfermedad)

			IF(@ExisteEnfermedad = 1)
				BEGIN
					UPDATE Enfermedades 
					SET
						Activo = 0,
						FechaModificacion = GETDATE(),
						ModificadoPor = @ModificadoPor
					WHERE 
						@IdEnfermedad = @IdEnfermedad

					SET @ExisteError = 0
				END 
			ELSE
				BEGIN
					SET @ExisteError = 1
					SET @DetalleError = 'Enfermedad: '+	@IdEnfermedad	+' No Existe'
				END
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		
		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error al eliminar el Enfermedad: '+	@IdEnfermedad	+ '. Número de Error: ' + @NumeroDeError

	END CATCH