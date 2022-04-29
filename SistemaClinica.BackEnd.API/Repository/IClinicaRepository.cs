using SistemaClinica.BackEnd.API.Models;
using SistemaClinica.BackEnd.API.Repository.Actions;

namespace SistemaClinica.BackEnd.API.Repository
{
    public interface IClinicaRepository : IObtenerRepository<Clinica, int>, IInsertarRepository<Clinica>, IActualizarRepository<Clinica>, IEliminarRepository<int>
    {
    }
}
