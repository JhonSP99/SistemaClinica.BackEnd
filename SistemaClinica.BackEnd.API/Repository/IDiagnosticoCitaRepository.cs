using SistemaClinica.BackEnd.API.Models;
using SistemaClinica.BackEnd.API.Repository.Actions;

namespace SistemaClinica.BackEnd.API.Repository
{
    public interface IDiagnosticoCitaRepository : IObtenerRepository<DiagnosticoCita, int>, IInsertarRepository<DiagnosticoCita>, IActualizarRepository<DiagnosticoCita>, IEliminarRepository<int>
    {
    }
}
