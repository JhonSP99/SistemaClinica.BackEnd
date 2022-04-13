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