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
 CONSTRAINT FK_MedicamentoCitas_IdMedicamento FOREIGN KEY(IdMedicamento) REFERENCES Medicamentos(IdMedicamento)
);
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
   	@level1type = N'Table',		@level1name = 'MedicamentoCitas', 
   	@level2type = N'Column',	@level2name = 'IdMedicamento'
GO
EXEC sp_addextendedproperty 	
	@name = N'MS_Description',	@value = 'Precio',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'MedicamentoCitas', 
   	@level2type = N'Column',	@level2name = 'Precio'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Condición en la que se encuentra el registro: 1 = Activo; 0 = Inactivo o Borrado',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'MedicamentoCitas', 
   	@level2type = N'Column',	@level2name = 'Activo'
GO

EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Nombre del usuario que crea el registro',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'MedicamentoCitas', 
   	@level2type = N'Column',	@level2name = 'CreadoPor'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Nombre del usuario que modifica el registro',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'MedicamentoCitas', 
   	@level2type = N'Column',	@level2name = 'ModificadoPor'
GO
EXEC sp_addextendedproperty
	@name = N'MS_Description',	@value = 'MedicamentoCitas que el sistema de C gestiona',
   	@level0type = N'Schema',	@level0name = 'dbo',
  	@level1type = N'Table',		@level1name = 'MedicamentoCitas'