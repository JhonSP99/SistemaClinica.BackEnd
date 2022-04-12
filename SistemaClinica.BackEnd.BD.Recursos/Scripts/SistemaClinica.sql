CREATE DATABASE clinica
GO
USE clinica
GO

CREATE TABLE ErroresBD(
	IdError INT IDENTITY(1, 1),
    NumeroDeError INT,
	MensajeDelError VARCHAR(MAX),
	LineaDelError INT,	
	FechaCreacion DATETIME DEFAULT GETDATE() NOT NULL,	
	CreadoPor VARCHAR(60),
	CONSTRAINT PK_ErroresBD PRIMARY KEY(IdError)
)
GO
EXEC sp_addextendedproperty
	@name = N'MS_Description',	@value = 'Errores que se generen a nivel de Base de Datos',
   	@level0type = N'Schema',	@level0name = 'dbo',
  	@level1type = N'Table',		@level1name = 'ErroresBD'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Identificador único de cada error que se presente a nivel de base de datos',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'ErroresBD', 
   	@level2type = N'Column',	@level2name = 'IdError'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Número de error del SGBD para cada error que se presente a nivel de base de datos',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'ErroresBD', 
   	@level2type = N'Column',	@level2name = 'NumeroDeError'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Mensaje de error del SGBD para cada error que se presente a nivel de base de datos',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'ErroresBD', 
   	@level2type = N'Column',	@level2name = 'MensajeDelError'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Línea del código donde está el problema para cada error que se presente a nivel de base de datos',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'ErroresBD', 
   	@level2type = N'Column',	@level2name = 'LineaDelError'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Fecha de creación del registro',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'ErroresBD', 
   	@level2type = N'Column',	@level2name = 'FechaCreacion'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Nombre del usuario conectado a la BD que crea el registro',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'ErroresBD', 
   	@level2type = N'Column',	@level2name = 'CreadoPor'
GO
CREATE OR ALTER PROCEDURE SP_ErroresBD_Insertar
	@CreadoPor VARCHAR(60)
	AS 
	BEGIN
		INSERT INTO ErroresBD (NumeroDeError, MensajeDelError, LineaDelError, CreadoPor)
		VALUES (ERROR_NUMBER(), ERROR_MESSAGE(), ERROR_LINE(), @CreadoPor)

		RETURN @@IDENTITY
	END

CREATE TABLE Clinica(
	IdClinica int not null,
	Nombre varchar(MAX)not null,
    Lugar varchar(MAX)not null,
    Telefono varchar(20)not null,
    Email varchar (30) not null,
	Horario VARCHAR(30),
	Activo BIT NOT NULL DEFAULT 1,
	FechaCreacion DATETIME NOT NULL DEFAULT GETDATE(),
	FechaModificacion DATETIME NULL,
	CreadoPor VARCHAR(60) NULL,
	ModificadoPor VARCHAR(60) NULL,
	CONSTRAINT PK_Clinica PRIMARY KEY(IdClinica)
)
GO
INSERT INTO Clinica (IdClinica, Nombre, Lugar, Telefono, Email) 
VALUES 
('123', 'clinica valle la estrella'	,'Limon',	'26563122'	,'clinicavalleestrella@gmail.com'),
('345',	'clinica Santa cruz	','Guanacaste'	,'26554812',	'clinicasantacruz@gmail.com'),
('678',	'Fortuna',	'Limon'	,'26563647',	'clinicalafortuna@gmail.com'),
('987',	'Clinca del sur'	,'Heredia'	,'26547485',	'clinicadelsur@gmail.com'),
('145',	'clinica el Rosario',	'Cartago'	,'26503255',	'clinicaelrosario@gmail.com')

EXEC sp_addextendedproperty
	@name = N'MS_Description',	@value = 'clinicas que se gestionan  ',
   	@level0type = N'Schema',	@level0name = 'dbo',
  	@level1type = N'Table',		@level1name = 'Clinica'
GO

EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'IdClinica',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Clinica', 
   	@level2type = N'Column',	@level2name = 'IdClinica'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Nombre',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Clinica', 
   	@level2type = N'Column',	@level2name = 'Nombre'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Lugar',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Clinica', 
   	@level2type = N'Column',	@level2name = 'Lugar'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Telefono',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Clinica', 
   	@level2type = N'Column',	@level2name = 'Telefono'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Email',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Clinica', 
   	@level2type = N'Column',	@level2name = 'Email'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Horario',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Clinica', 
   	@level2type = N'Column',	@level2name = 'Horario'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Condición en la que se encuentra el registro: 1 = Activo; 0 = Inactivo o Borrado',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Clinica', 
   	@level2type = N'Column',	@level2name = 'Activo'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Fecha de creación del registro',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Clinica', 
   	@level2type = N'Column',	@level2name = 'FechaCreacion'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Fecha de modificación del registro',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Clinica', 
   	@level2type = N'Column',	@level2name = 'FechaModificacion'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Nombre del usuario que crea el registro',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Clinica', 
   	@level2type = N'Column',	@level2name = 'CreadoPor'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Nombre del usuario que modifica el registro',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Clinica', 
   	@level2type = N'Column',	@level2name = 'ModificadoPor'

CREATE PROCEDURE SP_Clinica_Actualizar
	@IdClinica VARCHAR(10),
	@Horario VARCHAR(30),
	@ModificadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @ExisteClinica BIT
		
			SET @ExisteClinica = dbo.FN_Clinica_SeleccionarPorId(@ExisteClinica)
		
			IF(@ExisteClinica = 1)
				BEGIN
					UPDATE Clinica
					SET

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
		SET @DetalleError = 'Error actualizado el Clinica: '+	@IdClinica	+ '. Número de Error: ' + @NumeroDeError		

	END CATCH


CREATE OR ALTER PROCEDURE SP_Clinica_Desactivar
	@IdClinica VARCHAR(10),
	@ModificadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR (60) OUTPUT
	AS 
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @ExisteClinica BIT

			SET @ExisteClinica = dbo.FN_Clinica_SeleccionarPorId(@ExisteClinica)

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



CREATE OR ALTER PROCEDURE SP_Clinica_Insertar
	@IdClinica VARCHAR(10),
	@Horario VARCHAR(30),
	@CreadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY		
		BEGIN TRANSACTION
			
			INSERT INTO Clinica(IdClinica, Horario, CreadoPor)
			VALUES(@IdClinica, @Horario, @CreadoPor)		

			SET @ExisteError = 0

		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	
		ROLLBACK TRANSACTION

		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @CreadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error insertando clinica. Número de Error: ' + @NumeroDeError
		
	END CATCH

CREATE FUNCTION FN_Clinica_SeleccionarPorId(
	@IdClinica VARCHAR(10)
)


RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_Clinica_SeleccionarTodos AS Clinica
		WHERE 
			Clinica.IdClinica = @IdClinica



CREATE FUNCTION FN_Clinica_SeleccionarTodos()
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_Clinica_SeleccionarTodos


CREATE FUNCTION FN_Clinica_VerificaExistenciaPorId ( 
	@IdClinica VARCHAR(10))
RETURNS BIT AS
BEGIN
	DECLARE @ExisteClinica BIT;
	
	SET @ExisteClinica = (SELECT count(IdClinica) FROM Clinica WHERE IdClinica = @IdClinica)
	 
    RETURN @ExisteClinica
END;



CREATE VIEW VW_Clinica_SeleccionarTodos
AS 
	SELECT @IdClinica,FROM Clinica WHERE Activo = 1


CREATE TABLE Paciente(
	Idpaciente nvarchar(50) not null,
    Nombre varchar(20) not null,
    Apellidos varchar (30) not null,
    FechaNacimiento datetime2(7)null,
    Telefono varchar (10)not null,
    Email varchar (30)not null,
	Horario VARCHAR(30),
	Activo BIT NOT NULL DEFAULT 1,
	FechaCreacion DATETIME NOT NULL DEFAULT GETDATE(),
	FechaModificacion DATETIME NULL,
	CreadoPor VARCHAR(60) NULL,
	ModificadoPor VARCHAR(60) NULL,
	CONSTRAINT PK_Paciente PRIMARY KEY(Idpaciente)
)
GO
INSERT INTO Paciente (Idpaciente, Nombre, Apellidos, FechaNacimiento, Telefono, Email) 
VALUES 
('5-0145-0451',	'Juan',	'Mora',	'1981-07-24 22:55:44'	,'89232315'	,'juan24@gmail.com'),
('2-0841-0362'	,'Lucia',	'Venegas',	'1986-04-12 12:45:22',	'86235661'	,'mora123@gmail.com'),
('5-0654-0953'	,'Pedro',	'Lopez',	'1995-03-25 11:30:33',	'72356721'	,'pl4319@gmail.com'),
('4-0204-0921',	'Luis'	,'Villegas'	,'2001-12-22 9:30:41',	'64246901'	,'villel234@gmail.com')

EXEC sp_addextendedproperty
	@name = N'MS_Description',	@value = 'Paciente que se gestionan  ',
   	@level0type = N'Schema',	@level0name = 'dbo',
  	@level1type = N'Table',		@level1name = 'Paciente'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Idpaciente',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Paciente', 
   	@level2type = N'Column',	@level2name = 'Idpaciente'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Nombre',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Paciente', 
   	@level2type = N'Column',	@level2name = 'Nombre'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Apellidos',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Paciente', 
   	@level2type = N'Column',	@level2name = 'Apellidos'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'FechaNacimiento',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Paciente', 
   	@level2type = N'Column',	@level2name = 'FechaNacimiento'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Telefono',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Paciente', 
   	@level2type = N'Column',	@level2name = 'Telefono'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Email',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Paciente', 
   	@level2type = N'Column',	@level2name = 'Email'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Horario',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Paciente', 
   	@level2type = N'Column',	@level2name = 'Horario'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Condición en la que se encuentra el registro: 1 = Activo; 0 = Inactivo o Borrado',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Paciente', 
   	@level2type = N'Column',	@level2name = 'Activo'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Fecha de creación del registro',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Paciente', 
   	@level2type = N'Column',	@level2name = 'FechaCreacion'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Fecha de modificación del registro',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Paciente', 
   	@level2type = N'Column',	@level2name = 'FechaModificacion'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Nombre del usuario que crea el registro',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Paciente', 
   	@level2type = N'Column',	@level2name = 'CreadoPor'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Nombre del usuario que modifica el registro',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Paciente', 
   	@level2type = N'Column',	@level2name = 'ModificadoPor'
GO


CREATE OR ALTER PROCEDURE SP_Paciente_Actualizar
	@Idpaciente VARCHAR(10),
	@Horario VARCHAR(30),
	@ModificadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @ExistePaciente BIT
		
			SET @ExistePaciente = dbo.FN_Paciente_SeleccionarPorId(@ExistePaciente)
		
			IF(@ExistePaciente = 1)
				BEGIN
					UPDATE Paciente
					SET
						FechaModificacion = GETDATE(),
						ModificadoPor = @ModificadoPor
					WHERE 
						Idpaciente = @Idpaciente

					SET @ExisteError = 0
				END
			ELSE
				BEGIN
					SET @ExisteError = 1
					SET @DetalleError = 'Paciente: '+	@Idpaciente	+' No Existe'
				END
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH

		ROLLBACK TRANSACTION
		
		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error actualizado el Paciente: '+	@Idpaciente	+ '. Número de Error: ' + @NumeroDeError		

	END CATCH


CREATE PROCEDURE SP_Paciente_Desactivar
	@Idpaciente VARCHAR(10),
	@ModificadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR (60) OUTPUT
	AS 
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @ExistePaciente BIT

			SET @ExistePaciente = dbo.FN_Paciente_SeleccionarPorId(@ExistePaciente)

			IF(@ExistePaciente = 1)
				BEGIN
					UPDATE Paciente
					SET
						Activo = 0,
						FechaModificacion = GETDATE(),
						ModificadoPor = @ModificadoPor
					WHERE 
						Idpaciente = @Idpaciente

					SET @ExisteError = 0
				END 
			ELSE
				BEGIN
					SET @ExisteError = 1
					SET @DetalleError = 'Paciente: '+	@Idpaciente	+' No Existe'
				END
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		
		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error al eliminar Paciente '+	@Idpaciente	+ '. Número de Error: ' + @NumeroDeError

	END CATCH



CREATE PROCEDURE SP_Paciente_Insertar
	@Idpaciente VARCHAR(10),
	@Horario VARCHAR(30),
	@CreadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY		
		BEGIN TRANSACTION
			
			INSERT INTO Paciente(IdPaciente, Horario, CreadoPor)
			VALUES(@Idpaciente, @Horario, @CreadoPor)		

			SET @ExisteError = 0

		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	
		ROLLBACK TRANSACTION

		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @CreadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error insertando Paciente. Número de Error: ' + @NumeroDeError
		
	END CATCH


CREATE FUNCTION FN_Paciente_SeleccionarPorId(
	@Idpaciente VARCHAR(10)
)


RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_Paciente_SeleccionarTodos AS Pacientes
		WHERE 
			Pacientes.Idpaciente= @Idpaciente



CREATE FUNCTION FN_Paciente_SeleccionarTodos()
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_Paciente_SeleccionarTodos


CREATE FUNCTION FN_Paciente_VerificaExistenciaPorId ( 
	@Idpaciente VARCHAR(10))
RETURNS BIT AS
BEGIN
	DECLARE @ExistePaciente BIT;
	
	SET @ExistePaciente = (SELECT count(Idpaciente) FROM Paciente WHERE Idpaciente = @Idpaciente)
	 
    RETURN @ExistePaciente
END;


CREATE VIEW VW_Paciente_SeleccionarTodos
AS 
	SELECT Idpaciente, Horario FROM Paciente WHERE Activo = 1


CREATE TABLE Consultorio(
	 IdConsultorio int not null,
	 IdClinica int null,
     Nombreconsultorio varchar(30) not null,
     Direccion varchar(50)not null,
     Telefono varchar(10)not null,
     Email varchar(30)not null,
	Horario VARCHAR(30),
	Activo BIT NOT NULL DEFAULT 1,
	FechaCreacion DATETIME NOT NULL DEFAULT GETDATE(),
	FechaModificacion DATETIME NULL,
	CreadoPor VARCHAR(60) NULL,
	ModificadoPor VARCHAR(60) NULL,
	CONSTRAINT PK_Consultorio PRIMARY KEY(IdConsultorio),
	CONSTRAINT FK_Consultorio_IdClinica FOREIGN KEY(IdClinica) REFERENCES Clinica(IdClinica),
)
GO
INSERT INTO Consultorio (IdConsultorio, IdClinica, Nombreconsultorio, Direccion, Telefono, Email) 
VALUES 
('11',	'123',	'grip',	'Pasillo sur'	,'26563145',	'consultorio1@gmail.com'),
('29'	,'345',	'pul'	,'pasillo norte',	'26554456',	'cosultorio2@gmail.com'),
('33'	,'678',	'cora',	'pasillo central', 	'26564512'	,'consultorio3@gmail.com'),
('44',	'987',	'pech',	'segundo piso',	'26541247'	,'consultorio4@gmail.com'),
('55'	,'145',	'nar',	'segundo piso'	,'26503956'	,'consultorio5@gmail.com')

EXEC sp_addextendedproperty
	@name = N'MS_Description',	@value = 'consultorio  que se gestionan  ',
   	@level0type = N'Schema',	@level0name = 'dbo',
  	@level1type = N'Table',		@level1name = 'Consultorio'
GO

EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'IdConsultorio',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Consultorio', 
   	@level2type = N'Column',	@level2name = 'IdConsultorio'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Nombreconsultorio',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Clinica', 
   	@level2type = N'Column',	@level2name = 'Nombreconsultorio'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Direccion',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Clinica', 
   	@level2type = N'Column',	@level2name = 'Direccion'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Telefono',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Clinica', 
   	@level2type = N'Column',	@level2name = 'Telefono'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Email',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Clinica', 
   	@level2type = N'Column',	@level2name = 'Email'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Horario',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Consultorio', 
   	@level2type = N'Column',	@level2name = 'Horario'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Condición en la que se encuentra el registro: 1 = Activo; 0 = Inactivo o Borrado',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Consultorio', 
   	@level2type = N'Column',	@level2name = 'Activo'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Fecha de creación del registro',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Consultorio', 
   	@level2type = N'Column',	@level2name = 'FechaCreacion'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Fecha de modificación del registro',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Consultorio', 
   	@level2type = N'Column',	@level2name = 'FechaModificacion'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Nombre del usuario que crea el registro',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Consultorio', 
   	@level2type = N'Column',	@level2name = 'CreadoPor'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Nombre del usuario que modifica el registro',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Consultorio', 
   	@level2type = N'Column',	@level2name = 'ModificadoPor'
GO




CREATE OR ALTER PROCEDURE SP_Consultorio_Actualizar
	@IdConsultorio VARCHAR(10),
	@Horario VARCHAR(30),
	@ModificadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @ExisteConsultorio BIT
		
			SET @ExisteConsultorio = dbo.FN_Consultorio_SeleccionarPorId(@ExisteConsultorio)
		
			IF(@ExisteConsultorio = 1)
				BEGIN
					UPDATE Consultorio
					SET
						FechaModificacion = GETDATE(),
						ModificadoPor = @ModificadoPor
					WHERE 
						IdConsultorio = @IdConsultorio

					SET @ExisteError = 0
				END
			ELSE
				BEGIN
					SET @ExisteError = 1
					SET @DetalleError = 'Consultorio: '+	@IdConsultorio	+' No Existe'
				END
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH

		ROLLBACK TRANSACTION
		
		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error actualizado el consultorio: '+	@IdConsultorio	+ '. Número de Error: ' + @NumeroDeError		

	END CATCH


CREATE PROCEDURE SP_Consultorio_Desactivar
	@IdConsultorio VARCHAR(10),
	@ModificadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR (60) OUTPUT
	AS 
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @ExisteConsultorio BIT

			SET @ExisteConsultorio = dbo.FN_Consultorio_SeleccionarPorId(@ExisteConsultorio)

			IF(@ExisteConsultorio = 1)
				BEGIN
					UPDATE Consultorio
					SET
						Activo = 0,
						FechaModificacion = GETDATE(),
						ModificadoPor = @ModificadoPor
					WHERE 
						@IdConsultorio = @IdConsultorio

					SET @ExisteError = 0
				END 
			ELSE
				BEGIN
					SET @ExisteError = 1
					SET @DetalleError = 'consultorio: '+	@IdConsultorio	+' No Existe'
				END
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		
		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error al eliminar Consultorio '+	@IdConsultorio	+ '. Número de Error: ' + @NumeroDeError

	END CATCH




CREATE OR ALTER PROCEDURE SP_Consultorio_Insertar
	@IdConsultorio VARCHAR(10),
	@Horario VARCHAR(30),
	@CreadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY		
		BEGIN TRANSACTION
			
			INSERT INTO Consultorio(IdConsultorio, Horario, CreadoPor)
			VALUES(@IdConsultorio, @Horario, @CreadoPor)		

			SET @ExisteError = 0

		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	
		ROLLBACK TRANSACTION

		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @CreadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error insertando consultorio. Número de Error: ' + @NumeroDeError
		
	END CATCH

CREATE FUNCTION FN_Colsultorio_SeleccionarPorId(
	@IdConsultorio VARCHAR(10)
)
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_Consultorio_SeleccionarTodos AS Consultorio
		WHERE 
			Colsultorios.IdConsultorio = @IdConsultorio




CREATE FUNCTION FN_Consultorio_SeleccionarTodos()
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_Consultorio_SeleccionarTodos


CREATE FUNCTION FN_Consultorio_VerificaExistenciaPorId ( 
	@IdConsultorio VARCHAR(10))
RETURNS BIT AS
BEGIN
	DECLARE @ExisteConsultorio BIT;
	
	SET @ExisteConsultorio = (SELECT count(IdConsultorio) FROM Consultorio WHERE IdConsultorio = @IdConsultorio)
	 
    RETURN @ExisteConsultorio
END;



CREATE VIEW VW_Consultorio_SeleccionarTodos
AS 
	SELECT IdConsultorio FROM Consultorio WHERE Activo = 1

CREATE TABLE Doctores(
    IdDoctor varchar,
    Nombre varchar (20)not null,
    Apellidos varchar(30)not null,
    Activo BIT NOT NULL DEFAULT 1,
	FechaCreacion DATETIME NOT NULL DEFAULT GETDATE(),
	FechaModificacion DATETIME NULL,
	CreadoPor VARCHAR(60) NULL,
	ModificadoPor VARCHAR(60) NULL,
    CONSTRAINT PK_Doctores PRIMARY KEY (IdDoctor)
)
GO
EXEC sp_addextendedproperty
	@name = N'MS_Description',	@value = 'Doctores que el sistema de C gestiona',
   	@level0type = N'Schema',	@level0name = 'dbo',
  	@level1type = N'Table',		@level1name = 'Doctores'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Nombre',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Doctores', 
   	@level2type = N'Column',	@level2name = 'Nombre'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Apellidos',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Doctores', 
   	@level2type = N'Column',	@level2name = 'Apellidos'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Condición en la que se encuentra el registro: 1 = Activo; 0 = Inactivo o Borrado',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Doctores', 
   	@level2type = N'Column',	@level2name = 'Activo'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Fecha de creación del registro',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Doctores', 
   	@level2type = N'Column',	@level2name = 'FechaCreacion'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Fecha de modificación del registro',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Doctores', 
   	@level2type = N'Column',	@level2name = 'FechaModificacion'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Nombre del usuario que crea el registro',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Doctores', 
   	@level2type = N'Column',	@level2name = 'CreadoPor'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Nombre del usuario que modifica el registro',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Doctores', 
   	@level2type = N'Column',	@level2name = 'ModificadoPor'
GO

CREATE OR ALTER PROCEDURE SP_Doctor_Actualizar
	@IdDoctor VARCHAR(10),
	@ModificadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @ExisteDoctor BIT
		
			SET @ExisteDoctor = dbo.FN_Doctor_SeleccionarPorId(@ExisteDoctor)
		
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

CREATE PROCEDURE SP_Doctor_Desactivar
	@IdDoctor VARCHAR(10),
	@ModificadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR (60) OUTPUT
	AS 
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @ExisteDoctor BIT

			SET @ExisteDoctor = dbo.FN_Doctor_SeleccionarPorId(@ExisteDoctor)

			IF(@ExisteDoctor = 1)
				BEGIN
					UPDATE Doctores 
					SET
						Activo = 0,
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
		SET @DetalleError = 'Error al eliminar el Doctor: '+	@IdDoctor	+ '. Número de Error: ' + @NumeroDeError

	END CATCH

	CREATE OR ALTER PROCEDURE SP_Doctor_Insertar
	@IdDoctor VARCHAR(10),
	@CreadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY		
		BEGIN TRANSACTION
			
			INSERT INTO Doctores(IdDoctor,  CreadoPor)
			VALUES(@IdDoctor,  @CreadoPor)		

			SET @ExisteError = 0

		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	
		ROLLBACK TRANSACTION

		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @CreadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error insertando un Doctor. Número de Error: ' + @NumeroDeError
		
	END CATCH

CREATE FUNCTION dbo.FN_Doctor_SeleccionarPorId(
	@IdDoctor VARCHAR(10)
)
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_Doctor_SeleccionarTodos AS Doctores
		WHERE 
			Doctores.IdDoctor = @IdDoctor

CREATE FUNCTION dbo.FN_Doctor_SeleccionarTodos()
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_Doctor_SeleccionarTodos

CREATE FUNCTION dbo.FN_Doctor_VerificaExistenciaPorId ( 
	@IdDoctor VARCHAR(10))
RETURNS BIT AS
BEGIN
	DECLARE @ExisteDoctor BIT;
	
	SET @ExisteDoctor = (SELECT count(IdDoctor) FROM Doctores WHERE IdDoctor = @IdDoctor)
	 
    RETURN @ExisteDoctor
END;
CREATE VIEW VW_Doctor_SeleccionarTodos
AS 
	SELECT IdDoctor FROM Doctores WHERE Activo = 1

CREATE TABLE Enfermedades(
    IdEnfermedad varchar,
    Nombre varchar (20)not null,
    Activo BIT NOT NULL DEFAULT 1,
	FechaCreacion DATETIME NOT NULL DEFAULT GETDATE(),
	FechaModificacion DATETIME NULL,
	CreadoPor VARCHAR(60) NULL,
	ModificadoPor VARCHAR(60) NULL,
    CONSTRAINT PK_Enfermedades PRIMARY KEY (IdEnfermedad)
)
GO
EXEC sp_addextendedproperty
	@name = N'MS_Description',	@value = 'Enfermedades que el sistema de C gestiona',
   	@level0type = N'Schema',	@level0name = 'dbo',
  	@level1type = N'Table',		@level1name = 'Enfermedades'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Nombre',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Enfermedades', 
   	@level2type = N'Column',	@level2name = 'Nombre'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Condición en la que se encuentra el registro: 1 = Activo; 0 = Inactivo o Borrado',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Enfermedades', 
   	@level2type = N'Column',	@level2name = 'Activo'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Fecha de creación del registro',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Enfermedades', 
   	@level2type = N'Column',	@level2name = 'FechaCreacion'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Fecha de modificación del registro',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Enfermedades', 
   	@level2type = N'Column',	@level2name = 'FechaModificacion'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Nombre del usuario que crea el registro',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Enfermedades', 
   	@level2type = N'Column',	@level2name = 'CreadoPor'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Nombre del usuario que modifica el registro',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Enfermedades', 
   	@level2type = N'Column',	@level2name = 'ModificadoPor'
GO

CREATE OR ALTER PROCEDURE SP_Enfermedad_Actualizar
	@IdEnfermedad VARCHAR(10),
	@ModificadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @ExisteEnfermedad BIT
		
			SET @ExisteEnfermedad = dbo.FN_Enfermedades_SeleccionarPorId(@ExisteEnfermedad)
		
			IF(@ExisteEnfermedad = 1)
				BEGIN
					UPDATE Enfermedades 
					SET
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
		SET @DetalleError = 'Error actualizado el Enfermedad: '+	@IdEnfermedad	+ '. Número de Error: ' + @NumeroDeError		

	END CATCH

CREATE PROCEDURE SP_Enfermedad_Desactivar
	@IdEnfermedad VARCHAR(10),
	@ModificadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR (60) OUTPUT
	AS 
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @ExisteEnfermedad BIT

			SET @ExisteEnfermedad = dbo.FN_Enfermedad_SeleccionarPorId(@ExisteEnfermedad)

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

	CREATE OR ALTER PROCEDURE SP_Enfermedad_Insertar
	@IdEnfermedad VARCHAR(10),
	@CreadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY		
		BEGIN TRANSACTION
			
			INSERT INTO Enfermedades(Id_Enfermedad,  CreadoPor)
			VALUES(@IdEnfermedad,  @CreadoPor)		

			SET @ExisteError = 0

		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	
		ROLLBACK TRANSACTION

		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @CreadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error insertando una Enfermedad. Número de Error: ' + @NumeroDeError
		
	END CATCH

CREATE FUNCTION dbo.FN_Enfermedad_SeleccionarPorId(
	@IdEnfermedad VARCHAR(10)
)
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_Enfermedad_SeleccionarTodos AS Enfermedades
		WHERE 
			Enfermedades.IdEnfermedad = @IdEnfermedad

CREATE FUNCTION dbo.FN_Enfermedad_SeleccionarTodos()
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_Enfermedad_SeleccionarTodos

CREATE FUNCTION dbo.FN_Enfermedad_VerificaExistenciaPorId ( 
	@IdEnfermedad VARCHAR(10))
RETURNS BIT AS
BEGIN
	DECLARE @ExisteEnfermedad BIT;
	
	SET @ExisteEnfermedad = (SELECT count(IdEnfermedad) FROM Enfermedades WHERE IdEnfermedad = @IdEnfermedad)
	 
    RETURN @ExisteEnfermedad
END;

CREATE VIEW VW_Enfermedad_SeleccionarTodos
AS 
	SELECT IdEnfermedad FROM Enfermedades WHERE Activo = 1

CREATE TABLE Medicamentos(
    IdMedicamento int,
    Nombre varchar(20)not null,
    ModoAdministración varchar(30)not null,
    Función varchar (20)not null,
    Precio decimal,
    Activo BIT NOT NULL DEFAULT 1,
	FechaCreación DATETIME NOT NULL DEFAULT GETDATE(),
	FechaModificación DATETIME NULL,
	CreadoPor VARCHAR(60) NULL,
	ModificadoPor VARCHAR(60) NULL,
CONSTRAINT PK_Medicamentos PRIMARY KEY (IdMedicamento)
);
GO
EXEC sp_addextendedproperty
	@name = N'MS_Description',	@value = 'Medicamentos que el sistema de C gestiona',
   	@level0type = N'Schema',	@level0name = 'dbo',
  	@level1type = N'Table',		@level1name = 'Medicamentos'
GO

EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Número de Medicamentos',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Medicamentos', 
   	@level2type = N'Column',	@level2name = 'Id_medicamento'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Nombre',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Medicamentos', 
   	@level2type = N'Column',	@level2name = 'Nombre'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'ModoAdministración',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Medicamentos', 
   	@level2type = N'Column',	@level2name = 'ModoAdministracion'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Función',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Medicamentos', 
   	@level2type = N'Column',	@level2name = 'Funcion'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Precio',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Medicamentos', 
   	@level2type = N'Column',	@level2name = 'Precio'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Condición en la que se encuentra el registro: 1 = Activo; 0 = Inactivo o Borrado',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Medicamentos', 
   	@level2type = N'Column',	@level2name = 'Activo'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Fecha de creación del registro',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Medicamentos', 
   	@level2type = N'Column',	@level2name = 'FechaCreación'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Fecha de modificación del registro',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Medicamentos', 
   	@level2type = N'Column',	@level2name = 'FechaModificación'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Nombre del usuario que crea el registro',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Medicamentos', 
   	@level2type = N'Column',	@level2name = 'CreadoPor'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Nombre del usuario que modifica el registro',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Medicamentos', 
   	@level2type = N'Column',	@level2name = 'ModificadoPor'
GO
CREATE OR ALTER PROCEDURE SP_Medicamento_Actualizar
	@IdMedicamento VARCHAR(10),
	@ModificadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @ExisteMedicamento BIT
		
			SET @ExisteMedicamento = dbo.FN_Medicamento_SeleccionarPorId(@ExisteMedicamento)
		
			IF(@ExisteMedicamento = 1)
				BEGIN
					UPDATE Medicamentos
					SET
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
		SET @DetalleError = 'Error actualizado el Medicamento: '+	@IdMedicamento	+ '. Número de Error: ' + @NumeroDeError		

	END CATCH

CREATE PROCEDURE SP_Medicamentos_Desactivar
	@IdMedicamento VARCHAR(10),
	@ModificadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR (60) OUTPUT
	AS 
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @ExisteMedicamento BIT

			SET @ExisteMedicamento = dbo.FN_Medicamento_SeleccionarPorId(@ExisteMedicamento)

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

CREATE OR ALTER PROCEDURE SP_Medicamento_Insertar
	@IdMedicamento VARCHAR(10),
	@CreadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY		
		BEGIN TRANSACTION
			
			INSERT INTO Medicamentos(@IdMedicamento,  @CreadoPor)
			VALUES(@IdMedicamento,  @CreadoPor)		

			SET @ExisteError = 0

		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	
		ROLLBACK TRANSACTION

		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @CreadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error insertando un Medicamento. Número de Error: ' + @NumeroDeError
		
	END CATCH


CREATE FUNCTION dbo.FN_Medicamento_SeleccionarPorId(
	@IdMedicamento VARCHAR(10)
)
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_Medicamento_SeleccionarTodos AS Medicamentos
		WHERE 
			Medicamentos.IdMedicamento = @IdMedicamento

CREATE FUNCTION dbo.FN_Medicamento_SeleccionarTodos()
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_Medicamento_SeleccionarTodos

CREATE FUNCTION dbo.FN_Medicamento_VerificaExistenciaPorId ( 
	@IdMedicamento VARCHAR(10))
RETURNS BIT AS
BEGIN
	DECLARE @ExisteMedicamento BIT;
	
	SET @ExisteMedicamento = (SELECT count(IdMedicamento) FROM Medicamentos WHERE IdMedicamento = @IdMedicamento)
	 
    RETURN @ExisteMedicamento
END;

CREATE VIEW VW_Medicamento_SeleccionarTodos
AS 
	SELECT IdMedicamento FROM Medicamentos WHERE Activo = 1


Create table Cita(
    IdCita int,
    FechaHora datetime,
    IdPaciente nvarchar(50)not null,
    IdDoctor nvarchar(50)not null,
    IdConsultorio int,
    MontoConsulta decimal,
    MontoMedicamento decimal,
    MontoTotal decimal,
    IdEstado int,
    FechaCreacion DATETIME NOT NULL DEFAULT GETDATE(),
	FechaModificacion DATETIME NULL,
	CreadoPor VARCHAR(60) NULL,
	ModificadoPor VARCHAR(60) NULL,
 CONSTRAINT PK_Cita PRIMARY KEY (IdCita),
 CONSTRAINT FK_Cita_IdPaciente FOREIGN KEY(IdPaciente) REFERENCES Paciente(IdPaciente),
 CONSTRAINT FK_Cita_IdDoctor FOREIGN KEY(IdDoctor) REFERENCES Doctores(IdDoctor),
 CONSTRAINT FK_Cita_IdEstado FOREIGN KEY(IdEstado) REFERENCES EstadoCita(IdEstado),
);
GO
INSERT INTO Cita (IdCita, FechaHora, IdPaciente, IdDoctor, MontoConsulta, MontoMedicamento, MontoTotal, IdEstado) 
VALUES 
('54',	'2022-07-24 22:55:44',	'5-0145-0451',	'1-0355-0455'	,	'20000',	'2500'	,'22500'	,'20'),
('21',	'2022-05-21 20:55:44',	'2-0841-0362',	'2-0378-0123'		,'20000',	'3500',	'23500',	'21'),
('36'	,'2022-06-29 21:55:44',	'5-0654-0953',	'7-008-0432',		'20000'	,'4000',	'24000',	'22'),
('24',	'2022-08-19 23:55:44'	,'4-0204-0921'	,'5-0987-0456',		'20000'	,'5000'	,'25000',	'23')


EXEC sp_addextendedproperty
	@name = N'MS_Description',	@value = 'Cita que el sistema de C gestiona',
   	@level0type = N'Schema',	@level0name = 'dbo',
  	@level1type = N'Table',		@level1name = 'Cita'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'FechaHora',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Cita', 
   	@level2type = N'Column',	@level2name = 'FechaHora'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'IdPaciente',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Cita', 
   	@level2type = N'Column',	@level2name = 'IdPaciente'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'IdDoctor',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Cita', 
   	@level2type = N'Column',	@level2name = 'IdDoctor'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'IdConsultorio',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Cita', 
   	@level2type = N'Column',	@level2name = 'IdConsultorio'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'MontoConsulta',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Cita', 
   	@level2type = N'Column',	@level2name = 'MontoConsulta'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'MontoMedicamento',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Cita', 
   	@level2type = N'Column',	@level2name = 'MontoMedicamento'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'MontoTotal',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Cita', 
   	@level2type = N'Column',	@level2name = 'MontoTotal'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'IdEstado',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Cita', 
   	@level2type = N'Column',	@level2name = 'IdEstado'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Fecha de creación del registro',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Cita', 
   	@level2type = N'Column',	@level2name = 'FechaCreacion'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Fecha de modificación del registro',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Cita', 
   	@level2type = N'Column',	@level2name = 'FechaModificacion'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Nombre del usuario que crea el registro',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Cita', 
   	@level2type = N'Column',	@level2name = 'CreadoPor'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Nombre del usuario que modifica el registro',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Cita', 
   	@level2type = N'Column',	@level2name = 'ModificadoPor'
GO

	CREATE OR ALTER PROCEDURE SP_Cita_Insertar
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
		
			SET @ExisteCita = dbo.FN_Cita_SeleccionarIdCita(@ExisteCita)
		
			IF(@ExisteCita = 1)
				BEGIN
					UPDATE Cita 
					SET
					    IdCita=@IdCita ,
                        FechaHora=@FechaHora ,
                        IdPaciente=@IdPaciente, 
                        IdDoctor= @IdDoctor, 
                        IdConsultorio= @IdConsultorio ,
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

CREATE OR ALTER PROCEDURE SP_Cita_Desactivar
	@IdCita VARCHAR(10),
	@ModificadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR (60) OUTPUT
	AS 
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @ExisteCita BIT

			SET @ExisteCita = dbo.FN_Cita_SeleccionarPorId(@ExisteCita)

			IF(@ExisteCita = 1)
				BEGIN
					UPDATE Cita
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
					SET @DetalleError = 'Cita: '+	@IdCita	+' No Existe'
				END
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		
		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error al eliminar el Cita: '+	@IdCita	+ '. Número de Error: ' + @NumeroDeError

	END CATCH


CREATE FUNCTION dbo.FN_Cita_SeleccionarPorId(
	@IdCita VARCHAR(10)
)
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_Cita_SeleccionarTodos AS Cita
		WHERE 
			Cita = @IdCita

CREATE FUNCTION dbo.FN_Cita_SeleccionarTodos()
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_Cita_SeleccionarTodos

CREATE FUNCTION dbo.FN_Cita_VerificaExistenciaPorId ( 
	@IdCita VARCHAR(10))
RETURNS BIT AS
BEGIN
	DECLARE @ExisteCita BIT;
	
	SET @ExisteCita = (SELECT count(IdCita) FROM Cita WHERE IdCita = @IdCita)
	 
    RETURN @ExisteCita
END;

CREATE VIEW VW_Cita_SeleccionarTodos
AS 
	SELECT IdCita FROM Cita WHERE Activo = 1

create table EstadoCita(
    idEstado int,
    Estado varchar(25)not null,
    Activo BIT NOT NULL DEFAULT 1,
	FechaCreacion DATETIME NOT NULL DEFAULT GETDATE(),
	FechaModificacion DATETIME NULL,
	CreadoPor VARCHAR(60) NULL,
	ModificadoPor VARCHAR(60) NULL,
constraint PK_EstadoCita primary key (idEstado)
);
GO
INSERT INTO EstadoCita (IdEstado, Estado) 
VALUES 
('20',	'pendiente'),
('21'	,'en proceso'),
('22'	,'finalizada'),
('23'	,'cancelada')

EXEC sp_addextendedproperty
	@name = N'MS_Description',	@value = 'EstadoCita que el sistema de C gestiona',
   	@level0type = N'Schema',	@level0name = 'dbo',
  	@level1type = N'Table',		@level1name = 'EstadoCita'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'IdEstado',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'EstadoCita', 
   	@level2type = N'Column',	@level2name = 'IdEstado'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Estado',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'EstadoCita', 
   	@level2type = N'Column',	@level2name = 'Estado'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Condición en la que se encuentra el registro: 1 = Activo; 0 = Inactivo o Borrado',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'EstadoCita', 
   	@level2type = N'Column',	@level2name = 'Activo'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Fecha de creación del registro',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'EstadoCita', 
   	@level2type = N'Column',	@level2name = 'FechaCreacion'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Fecha de modificación del registro',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'EstadoCita', 
   	@level2type = N'Column',	@level2name = 'FechaModificacion'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Nombre del usuario que crea el registro',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'EstadoCita', 
   	@level2type = N'Column',	@level2name = 'CreadoPor'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Nombre del usuario que modifica el registro',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'EstadoCita', 
   	@level2type = N'Column',	@level2name = 'ModificadoPor'
GO
CREATE FUNCTION FN_EstadoCita_VerificaExistenciaPorId(@idEstado INT)
	RETURNS BIT AS
BEGIN 
	DECLARE @ExisteEstadoCita BIT;
	SET @ExisteEstadoCita =(SELECT COUNT(idEstado) FROM EstadoCita WHERE idEstado = @idEstado)

RETURN @ExisteEstadoCita
END
GO

CREATE OR ALTER PROCEDURE SP_EstadoCita_Insertar
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

CREATE PROCEDURE SP_EstadoCita_Actualizar
	@idEstado VARCHAR(10),
	@Nombre Varchar(20),
	@ModificadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @ExisteEstadoCita BIT
		
			SET @ExisteEstadoCita = dbo.FN_EstadoCita_SeleccionaridEstado (@ExisteEstadoCita)
		
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

 CREATE OR ALTER PROCEDURE SP_EstadoCita_Desactivar
	@idEstado VARCHAR(10),
	@ModificadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR (60) OUTPUT
	AS 
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @ExisteEstadoCita BIT

			SET @ExisteEstadoCita = dbo.FN_EstadoCita_SeleccionaridEstado(@ExisteEstadoCita)

			IF(@ExisteEstadoCita = 1)
				BEGIN
					UPDATE EstadoCita
					SET
						Activo = 0,
						FechaModificacion = GETDATE(),
						ModificadoPor = @ModificadoPor
					WHERE 
						@idEstado = @idEstado

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
		SET @DetalleError = 'Error al eliminar el EstadoCita: '+	@idEstado	+ '. Número de Error: ' + @NumeroDeError

	END CATCH

	CREATE OR ALTER PROCEDURE SP_ErroresBD_Insertar
	@CreadoPor VARCHAR(60)
	AS 
	BEGIN
		INSERT INTO ErroresBD (NumeroDeError, MensajeDelError, LineaDelError, CreadoPor)
		VALUES (ERROR_NUMBER(), ERROR_MESSAGE(), ERROR_LINE(), @CreadoPor)

		RETURN @@IDENTITY
	END

CREATE FUNCTION dbo.FN_EstadoCita_SeleccionarPorId(
	@idEstado VARCHAR(10)
)
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_EstadoCita_SeleccionarTodos AS EstadoCita
		WHERE 
			idEstado = @idEstado

CREATE FUNCTION dbo.FN_EstadoCita_SeleccionarTodos()
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_EstadoCita_SeleccionarTodos

CREATE FUNCTION dbo.FN_EstadoCita_VerificaExistenciaPorId ( 
	@idEstado VARCHAR(10))
RETURNS BIT AS
BEGIN
	DECLARE @ExisteEstadoCita BIT;
	
	SET @ExisteEstadoCita = (SELECT count(idEstado) FROM EstadoCita WHERE idEstado = @idEstado)
	 
    RETURN @ExisteEstadoCita
END;

CREATE VIEW VW_EstadoCita_SeleccionarTodos
AS 
	SELECT idEstado FROM EstadoCita WHERE Activo = 1


Create Table DiagnosticoCita(
    IdCita int,
    IdEnfermedad nvarchar(50)not null,
    Detalle varchar(50)not null,
    Activo BIT NOT NULL DEFAULT 1,
	FechaCreacion DATETIME NOT NULL DEFAULT GETDATE(),
	FechaModificacion DATETIME NULL,
	CreadoPor VARCHAR(60) NULL,
	ModificadoPor VARCHAR(60) NULL
 CONSTRAINT PK_DiagnosticoCita primary key(IdCita,IdEnfermedad), 
 CONSTRAINT FK_DiagnosticoCita_IdCita FOREIGN KEY(IdCita) REFERENCES Cita(IdCita),
);
GO
INSERT INTO DiagnosticoCita (IdCita, IdEnfermedad, Detalle) 
VALUES 
('54'	,'6',	'se cayo de un arbol'),
('21',	'7',	'se quebro el pierna'),
('36'	,'11'	,'se accidento en carro'),
('24'	,'9'	,'se corto el brazo')

EXEC sp_addextendedproperty
	@name = N'MS_Description',	@value = 'DiagnosticoCita que el sistema de C gestiona',
   	@level0type = N'Schema',	@level0name = 'dbo',
  	@level1type = N'Table',		@level1name = 'DiagnosticoCita'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Detalle',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'DiagnosticoCita', 
   	@level2type = N'Column',	@level2name = 'Detalle'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Condición en la que se encuentra el registro: 1 = Activo; 0 = Inactivo o Borrado',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'DiagnosticoCita', 
   	@level2type = N'Column',	@level2name = 'Activo'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Fecha de creación del registro',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'DiagnosticoCita', 
   	@level2type = N'Column',	@level2name = 'FechaCreacion'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Fecha de modificación del registro',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'DiagnosticoCita', 
   	@level2type = N'Column',	@level2name = 'FechaModificacion'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Nombre del usuario que crea el registro',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'DiagnosticoCita', 
   	@level2type = N'Column',	@level2name = 'CreadoPor'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Nombre del usuario que modifica el registro',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'DiagnosticoCita', 
   	@level2type = N'Column',	@level2name = 'ModificadoPor'
GO

	CREATE OR ALTER PROCEDURE SP_DiagnosticoCita_Insertar
	@IdCita int,
	@IdEnfermedades int,
	@CreadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY		
		BEGIN TRANSACTION
			
			INSERT INTO DiagnosticoCita(IdCita, IdEnfermedades, CreadoPor)
			VALUES(@IdCita, @IdEnfermedades, @CreadoPor)		

			SET @ExisteError = 0

		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	
		ROLLBACK TRANSACTION

		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @CreadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error insertando un DiagnosticoCita. Número de Error: ' + @NumeroDeError
		
	END CATCH

CREATE PROCEDURE SP_DiagnosticoCita_Actualizar
	@IdCita int,
	@IdEnfermedades int,
	@ModificadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @ExisteDiagnosticoCita BIT
		
			SET @ExisteDiagnosticoCita = dbo.FN_DiagnosticoCita_SeleccionarPorId(@ExisteDiagnosticoCita)
		
			IF(@ExisteDiagnosticoCita = 1)
				BEGIN
					UPDATE DiagnosticoCita 
					SET
						FechaModificacion = GETDATE(),
						ModificadoPor = @ModificadoPor
					WHERE 
						@IdCita = @IdCita

					SET @ExisteError = 0
				END
			ELSE
				BEGIN
					SET @ExisteError = 1
					SET @DetalleError = 'DiagnosticoCita: '+	@IdCita	+' No Existe'
				END
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH

		ROLLBACK TRANSACTION
		
		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error actualizado el Diagnostico cita: '+	@IdCita	+ '. Número de Error: ' + @NumeroDeError		

	END CATCH

CREATE OR ALTER PROCEDURE SP_DiagnosticoCita_Desactivar
	@IdCita VARCHAR(10),
	@ModificadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR (60) OUTPUT
	AS 
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @ExisteDiagnosticoCita BIT

			SET @ExisteDiagnosticoCita = dbo.FN_DiagnosticoCita_SeleccionarPorId(@ExisteDiagnosticoCita)

			IF(@ExisteDiagnosticoCita = 1)
				BEGIN
					UPDATE DiagnosticoCita 
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
					SET @DetalleError = 'DiagnosticoCita: '+	@IdCita	+' No Existe'
				END
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		
		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @ModificadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error al eliminar el DiagnosticoCita: '+	@IdCita	+ '. Número de Error: ' + @NumeroDeError

	END CATCH


CREATE FUNCTION dbo.FN_DiagnosticoCita_SeleccionarPorId(
	@IdCita VARCHAR(10)
)
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_Cita_SeleccionarTodos AS DiagnosticoCita
		WHERE 
			IdCita = @IdCita

CREATE FUNCTION dbo.FN_DiagnosticoCita_SeleccionarTodos()
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_DiagnosticoCita_SeleccionarTodos

CREATE FUNCTION dbo.FN_DiagnosticoCita_VerificaExistenciaPorId ( 
	@IdCita VARCHAR(10))
RETURNS BIT AS
BEGIN
	DECLARE @ExisteDiagnosticoCita BIT;
	
	SET @ExisteDiagnosticoCita = (SELECT count(IdCita) FROM Doctores WHERE IdCita = @IdCita)
	 
    RETURN @ExisteDiagnosticoCita
END;

CREATE VIEW VW_DiagnosticoCita_SeleccionarTodos
AS 
	SELECT IdCita FROM Cita WHERE Activo = 1




Create Table MedicamentoCitas(
    IdCita int,
    IdMedicamento int,
    Precio decimal,
    Activo BIT NOT NULL DEFAULT 1,
	FechaCreacion DATETIME NOT NULL DEFAULT GETDATE(),
	FechaModificacion DATETIME NULL,
	CreadoPor VARCHAR(60) NULL,
	ModificadoPor VARCHAR(60) NULL,
 constraint PK_MedicamentoCitas primary key (Precio),
 CONSTRAINT FK_MedicamentoCitas_IdCita FOREIGN KEY(IdCita) REFERENCES Cita(IdCita),
 CONSTRAINT FK_MedicamentoCitas_IdMedicamento FOREIGN KEY(IdMedicamento) REFERENCES Medicamentos(IdMedicamento),
 CONSTRAINT FK_MedicamentoCitas_Precio FOREIGN KEY(Precio) REFERENCES Medicamentos(Precio),
);
GO
INSERT INTO MedicamentoCitas (IdCita, IdMedicamento, Precio) 
VALUES 
('54'	,'23',	'1200'),
('21'	,'38',	'1500'),
('36'	,'16'	,'2000'),
('24'	,'24'	,'5000')



EXEC sp_addextendedproperty
	@name = N'MS_Description',	@value = 'MedicamentoCitas que el sistema de C gestiona',
   	@level0type = N'Schema',	@level0name = 'dbo',
  	@level1type = N'Table',		@level1name = 'MedicamentoCitas'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'IdCita',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'MedicamentoCitas', 
   	@level2type = N'Column',	@level2name = 'IdCita'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'IdMedicamento',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Doctores', 
   	@level2type = N'Column',	@level2name = 'IdMedicamento'
GO
EXEC sp_addextendedproperty 	
	@name = N'MS_Description',	@value = 'Precio',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Doctores', 
   	@level2type = N'Column',	@level2name = 'Precio'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Condición en la que se encuentra el registro: 1 = Activo; 0 = Inactivo o Borrado',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Doctores', 
   	@level2type = N'Column',	@level2name = 'Activo'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Fecha de creación del registro',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Doctores', 
   	@level2type = N'Column',	@level2name = 'FechaCreacion'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Fecha de modificación del registro',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Doctores', 
   	@level2type = N'Column',	@level2name = 'FechaModificacion'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Nombre del usuario que crea el registro',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Doctores', 
   	@level2type = N'Column',	@level2name = 'CreadoPor'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Nombre del usuario que modifica el registro',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Doctores', 
   	@level2type = N'Column',	@level2name = 'ModificadoPor'
GO


	CREATE OR ALTER PROCEDURE SP_MedicamentosCitas_Insertar
	@IdCita int,
	@IdMedicamento int,
	@Precio decimal,
	@CreadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY		
		BEGIN TRANSACTION
			
			INSERT INTO MedicamentosCitas(IdCita , IdMedicamento,Precio, CreadoPor)
			VALUES(@IdCita ,@IdMedicamento,@Precio,  @CreadoPor)		

			SET @ExisteError = 0

		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	
		ROLLBACK TRANSACTION

		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @CreadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error insertando un medicamento. Número de Error: ' + @IdCita
		
	END CATCH

CREATE PROCEDURE SP_MedicamentosCitas_Actualizar
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
		
			SET @ExisteMedicamentosCitas = dbo.FN_MedicamentosCitas_SeleccionarPorId(@ExisteMedicamentosCitas)
		
			IF(@ExisteMedicamentosCitas = 1)
				BEGIN
					UPDATE MedicamentosCitas 
					SET
					    @Precio=@Precio,
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

CREATE OR ALTER PROCEDURE SP_MedicamentosCitas_Desactivar
	@IdCita  VARCHAR(10),
	@ModificadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR (60) OUTPUT
	AS 
	BEGIN TRY
		BEGIN TRANSACTION
			DECLARE @ExisteMedicamentosCitas BIT

			SET @ExisteMedicamentosCitas = dbo.FN_MedicamentosCitas_SeleccionarPorId(@NumeroMedicamentoCitas)

			IF(@ExisteMedicamentosCitas = 1)
				BEGIN
					UPDATE MedicamentosCitas
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

	CREATE OR ALTER PROCEDURE SP_MedicamentosCitas_Insertar
	@IdCita  VARCHAR(10),
	@CreadoPor VARCHAR(60),
	@ExisteError BIT OUTPUT,
	@DetalleError VARCHAR(60) OUTPUT
	AS
	BEGIN TRY		
		BEGIN TRANSACTION
			
			INSERT INTO MedicamentosCitas(IdCita ,  CreadoPor)
			VALUES(@IdCita ,  @CreadoPor)		

			SET @ExisteError = 0

		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	
		ROLLBACK TRANSACTION

		DECLARE @NumeroDeError INT 
		EXEC @NumeroDeError = SP_ErroresBD_Insertar @CreadoPor

		SET @ExisteError = 1
		SET @DetalleError = 'Error insertando MedicamentosCitas. Número de Error: ' + @NumeroDeError
		
	END CATCH


CREATE FUNCTION dbo.FN_MedicamentosCitas_SeleccionarPorId(
	@IdCita VARCHAR(10)
)
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_MedicamentosCitas_SeleccionarTodos AS MedicamentosCitas
		WHERE 
			IdCita = @IdCita 

CREATE FUNCTION dbo.FN_MedicamentosCitas_SeleccionarTodos()
RETURNS TABLE AS
	RETURN 
		SELECT * 
		FROM VW_MedicamentosCitas_SeleccionarTodos

CREATE FUNCTION dbo.FN_MedicamentosCitas_VerificaExistenciaPorId ( 
	@IdCita  VARCHAR(10))
RETURNS BIT AS
BEGIN
	DECLARE @ExisteMedicamentosCitas BIT;
	
	SET @ExisteMedicamentosCitas = (SELECT count(IdCita ) FROM MedicamentoCitas WHERE IdCita  = @IdCita)
	 
    RETURN @ExisteMedicamentosCitas
END;

CREATE VIEW VW_MedicamentosCitas_SeleccionarTodos
AS 
	SELECT IdCita  FROM MedicamentoCitas WHERE Activo = 1
