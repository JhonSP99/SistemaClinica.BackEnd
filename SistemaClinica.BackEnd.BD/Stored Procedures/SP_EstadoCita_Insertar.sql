CREATE PROCEDURE SP_EstadoCita_Insertar
	@idEstado VARCHAR(10),
	@Nombre varchar(20),
	@CreadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY		
		BEGIN TRANSACTION
			
			INSERT INTO EstadoCita(idEstado, CreadoPor)
			VALUES(@idEstado,  @CreadoPor)		

			SET @ExisteError = 0

		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	
		ROLLBACK TRANSACTION

		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @CreadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error insertando un EstadoCita. Número de Error: ' + @NumeroDeError
		
	END CATCH