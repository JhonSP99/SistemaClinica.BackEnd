CREATE  PROCEDURE SP_MedicamentosCitas_Actualizar
	@IdCita VARCHAR(10),
	@IdMedicamento int,
	@Precio decimal,
	@ModificadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @ExisteMedicamentosCitas BIT
		
			SET @ExisteMedicamentosCitas = dbo.FN_MedicamentosCitas_VerificaExistenciaPorId(@ExisteMedicamentosCitas)
		
			IF(@ExisteMedicamentosCitas = 1)
				BEGIN
					UPDATE MedicamentoCitas
					SET
					    Precio=@Precio,
						FechaModificacion = GETDATE(),
						ModificadoPor = @ModificadoPor
					WHERE 
						@IdCita = @IdCita

					SET @ExisteError = 0
				END
			ELSE
				BEGIN
					SET @ExisteError = 1
					SET @DetalleError = 'MedicamentosCitas: '+	@IdCita	+' No Existe'
				END
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH

		ROLLBACK TRANSACTION
		
		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error actualizado el MedicamentosCitas: '+	@IdCita	+ '. Número de Error: ' + @NumeroDeError		

	END CATCH