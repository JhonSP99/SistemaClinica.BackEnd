using SistemaClinica.BackEnd.API.Models;

namespace SistemaClinica.BackEnd.API.Services.Interfaces
{
    public interface IDiagnosticoCitaServices
    {

        List<DiagnosticoCita> SeleccionarTodos();
        DiagnosticoCita SeleccionarPorId(int id);
        void Insertar(DiagnosticoCita model);
        void Actualizar(DiagnosticoCita model);
        void Eliminar(int id);
    }
}
