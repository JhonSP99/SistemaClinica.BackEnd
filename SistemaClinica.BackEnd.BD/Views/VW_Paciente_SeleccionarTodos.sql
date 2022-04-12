CREATE VIEW VW_Paciente_SeleccionarTodos
AS 
	SELECT Idpaciente, Horario FROM Paciente WHERE Activo = 1