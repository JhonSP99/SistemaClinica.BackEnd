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
   	@level2type = N'Column',	@level2name = 'FechaCreación'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Fecha de modificación del registro',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'DiagnosticoCita', 
   	@level2type = N'Column',	@level2name = 'FechaModificación'
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