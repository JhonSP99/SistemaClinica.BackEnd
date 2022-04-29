using SistemaClinica.BackEnd.API.Models;
using SistemaClinica.BackEnd.API.Repository.Actions;

namespace SistemaClinica.BackEnd.API.Repository
{
    public interface IEstadoCitaRepository : IObtenerRepository<EstadoCita, int>, IInsertarRepository<EstadoCita>, IActualizarRepository<EstadoCita>, IEliminarRepository<int>
    {
    }
}
