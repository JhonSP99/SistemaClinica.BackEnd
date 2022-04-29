using SistemaClinica.BackEnd.API.Models;
using SistemaClinica.BackEnd.API.Repository.Actions;

namespace SistemaClinica.BackEnd.API.Repository
{
    public interface ICitaRepository : IObtenerRepository<Cita, int>, IInsertarRepository<Cita>, IActualizarRepository<Cita>, IEliminarRepository<int>
    {
    }
}
