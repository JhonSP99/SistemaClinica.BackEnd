using SistemaClinica.BackEnd.API.Models;
using SistemaClinica.BackEnd.API.Repository.Actions;

namespace SistemaClinica.BackEnd.API.Repository
{
    public interface IPacienteRepository : IObtenerRepository<Paciente, string>, IInsertarRepository<Paciente>, IActualizarRepository<Paciente>, IEliminarRepository<string>
    {
    }
}
