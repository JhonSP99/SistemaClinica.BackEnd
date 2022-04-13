CREATE VIEW VW_Enfermedad_SeleccionarTodos
AS 
	SELECT IdEnfermedad FROM Enfermedades WHERE Activo = 1
GO