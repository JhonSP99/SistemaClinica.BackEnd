CREATE  PROCEDURE SP_EstadoCita_Actualizar
	@idEstado VARCHAR(10),
	@Nombre Varchar(20),
	@ModificadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @ExisteEstadoCita BIT
		
			SET @ExisteEstadoCita = dbo.FN_EstadoCita_VerificaExistenciaPorId (@ExisteEstadoCita)
		
			IF(@ExisteEstadoCita = 1)
				BEGIN
					UPDATE EstadoCita
					SET

						FechaModificacion = GETDATE(),
						ModificadoPor = @ModificadoPor
					WHERE 
						idEstado = @idEstado

					SET @ExisteError = 0
				END
			ELSE
				BEGIN
					SET @ExisteError = 1
					SET @DetalleError = 'EstadoCita: '+	@idEstado	+' No Existe'
				END
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH

		ROLLBACK TRANSACTION
		
		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor


		SET @ExisteError = 1
		SET @DetalleError = 'Error actualizado el EstadoCita: '+	@idEstado	+ '. Número de Error: ' + @NumeroDeError		

	END CATCH