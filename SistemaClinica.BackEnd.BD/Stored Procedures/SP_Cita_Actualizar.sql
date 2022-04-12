CREATE PROCEDURE SP_Cita_Actualizar
	@IdCita int,
    @FechaHora datetime,
    @IdPaciente int,
    @IdDoctor int,
    @IdConsultorio int,
    @MontoConsulta decimal,
    @MontoMedicamento decimal,
    @MontoTotal decimal,
    @IdEstado int,
	@ModificadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @ExisteCita BIT
		
			SET @ExisteCita = dbo.FN_Cita_VerificaExistenciaPorId(@ExisteCita)
		
			IF(@ExisteCita = 1)
				BEGIN
					UPDATE Cita 
					SET
					    IdCita=@IdCita ,
                        FechaHora=@FechaHora ,
                        IdPaciente=@IdPaciente, 
                        IdDoctor= @IdDoctor, 
                        @IdConsultorio= @IdConsultorio ,
                        MontoConsulta= @MontoConsulta ,
                        MontoMedicamento = @MontoMedicamento,
                        MontoTotal =@MontoTotal ,
                        IdEstado= @IdEstado ,
						FechaModificacion = GETDATE(),
						ModificadoPor = @ModificadoPor
					WHERE 
						@IdCita = @IdCita

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
		SET @DetalleError = 'Error actualizado el Cita: '+	@IdCita	+ '. Número de Error: ' + @NumeroDeError		

	END CATCH