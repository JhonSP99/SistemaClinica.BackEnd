CREATE  PROCEDURE SP_Medicamentos_Desactivar
	@IdMedicamento VARCHAR(10),
	@ModificadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR (60) OUTPUT
	AS 
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @ExisteMedicamento BIT

			SET @ExisteMedicamento = dbo.FN_Medicamento_VerificaExistenciaPorId(@ExisteMedicamento)

			IF(@ExisteMedicamento = 1)
				BEGIN
					UPDATE Medicamentos
					SET
						Activo = 0,
						FechaModificacion = GETDATE(),
						ModificadoPor = @ModificadoPor
					WHERE 
						@IdMedicamento = @IdMedicamento

					SET @ExisteError = 0
				END 
			ELSE
				BEGIN
					SET @ExisteError = 1
					SET @DetalleError = 'Medicamento: '+	@IdMedicamento	+' No Existe'
				END
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		
		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error al eliminar el Medicamento: '+	@IdMedicamento	+ '. Número de Error: ' + @NumeroDeError

	END CATCH