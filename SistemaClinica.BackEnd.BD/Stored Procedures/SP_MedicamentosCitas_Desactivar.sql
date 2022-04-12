CREATE  PROCEDURE SP_MedicamentosCitas_Desactivar
	@IdCita  VARCHAR(10),
	@ModificadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR (60) OUTPUT
	AS 
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @ExisteMedicamentosCitas BIT

			SET @ExisteMedicamentosCitas = dbo.FN_MedicamentosCitas_VerificaExistenciaPorId(@IdCita)

			IF(@ExisteMedicamentosCitas = 1)
				BEGIN
					UPDATE MedicamentoCitas
					SET
						Activo = 0,
						FechaModificacion = GETDATE(),
						ModificadoPor = @ModificadoPor
					WHERE 
						@IdCita = @IdCita

					SET @ExisteError = 0
				END 
			ELSE
				BEGIN
					SET @ExisteError = 1
					SET @DetalleError = 'MedicamentosCitas: '+	@IdCita 	+' No Existe'
				END
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		
		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error al eliminar el MedicamentosCitas: '+	@IdCita 	+ '. Número de Error: ' + @NumeroDeError

	END CATCH