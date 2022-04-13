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
EXEC sp_addextendedproperty
	@name = N'MS_Description',	@value = 'consultorio  del sistema ',
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