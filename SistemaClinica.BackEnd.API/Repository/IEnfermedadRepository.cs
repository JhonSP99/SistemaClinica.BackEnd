using SistemaClinica.BackEnd.API.Models;
using SistemaClinica.BackEnd.API.Repository.Actions;

namespace SistemaClinica.BackEnd.API.Repository
{
    public interface IEnfermedadRepository : IObtenerRepository<Enfermedad, string>, IInsertarRepository<Enfermedad>, IActualizarRepository<Enfermedad>, IEliminarRepository<string>
    {
    }
}
