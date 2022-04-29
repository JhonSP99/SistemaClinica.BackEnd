using SistemaClinica.BackEnd.API.Models;
using SistemaClinica.BackEnd.API.Repository.Actions;

namespace SistemaClinica.BackEnd.API.Repository
{
    public interface IMedicamentoRepository : IObtenerRepository<Medicamento, int>, IInsertarRepository<Medicamento>, IActualizarRepository<Medicamento>, IEliminarRepository<int>
    {
    }
}
