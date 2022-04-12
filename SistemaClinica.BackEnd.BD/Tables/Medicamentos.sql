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
   	@level2type = N'Column',	@level2name = 'IdMedicamento'
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
   	@level2type = N'Column',	@level2name = 'ModoAdministración'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Función',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Medicamentos', 
   	@level2type = N'Column',	@level2name = 'Función'
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