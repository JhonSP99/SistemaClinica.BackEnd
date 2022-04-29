using SistemaClinica.BackEnd.API.Models;
using SistemaClinica.BackEnd.API.Repository.Actions;

namespace SistemaClinica.BackEnd.API.Repository
{
    public interface IDoctorRepository : IObtenerRepository<Doctor, string>, IInsertarRepository<Doctor>, IActualizarRepository<Doctor>, IEliminarRepository<string>
    {
    }
}
