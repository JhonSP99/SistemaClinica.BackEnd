CREATE PROCEDURE SP_Cita_Insertar
	@IdCita int,
    @FechaHora datetime,
    @IdPaciente int,
    @IdDoctor int,
    @MontoConsulta decimal,
    @MontoMedicamento decimal,
    @MontoTotal decimal,
    @IdEstado int,
	@CreadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY		
		BEGIN TRANSACTION
			
			INSERT INTO Cita(IdCita,FechaHora,IdPaciente,IdDoctor,MontoConsulta,MontoMedicamento,MontoTotal,IdEstado ,CreadoPor)
			VALUES(@IdCita, @FechaHora, @IdPaciente, @IdDoctor, @MontoConsulta, @MontoMedicamento, @MontoTotal, @IdEstado,  @CreadoPor)		

			SET @ExisteError = 0

		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	
		ROLLBACK TRANSACTION

		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @CreadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error insertando una Cita. Número de Error: ' + @NumeroDeError
		
	END CATCH