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
   	@level2type = N'Column',	@level2name = 'FechaCreación'
GO
EXEC sp_addextendedproperty 
	@name = N'MS_Description',	@value = 'Fecha de modificación del registro',
   	@level0type = N'Schema',	@level0name = 'dbo',
   	@level1type = N'Table',		@level1name = 'Cita', 
   	@level2type = N'Column',	@level2name = 'FechaModificación'
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