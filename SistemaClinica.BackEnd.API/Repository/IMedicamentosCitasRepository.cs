using SistemaClinica.BackEnd.API.Models;
using SistemaClinica.BackEnd.API.Repository.Actions;

namespace SistemaClinica.BackEnd.API.Repository
{
    public interface IMedicamentosCitasRepository : IObtenerRepository<MedicamentosCitas, decimal>, IInsertarRepository<MedicamentosCitas>, IActualizarRepository<MedicamentosCitas>, IEliminarRepository<decimal>
    {
    }
}
