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