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
EXEC sp_addextendedproperty
	@name = N'MS_Description',	@value = 'clinicas que se gestionan  ',
   	@level0type = N'Schema',	@level0name = 'dbo',
  	@level1type = N'Table',		@level1name = 'Clinica'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Id de la Clinica',
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
GO
