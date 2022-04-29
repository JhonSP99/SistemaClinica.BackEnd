using SistemaClinica.BackEnd.API.Models;
using SistemaClinica.BackEnd.API.Repository.Actions;

namespace SistemaClinica.BackEnd.API.Repository
{
    public interface IConsultorioRepository : IObtenerRepository<Consultorio, int>, IInsertarRepository<Consultorio>, IActualizarRepository<Consultorio>, IEliminarRepository<int>
    {
    }
}
