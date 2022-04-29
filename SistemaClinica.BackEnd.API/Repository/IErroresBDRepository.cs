using SistemaClinica.BackEnd.API.Models;
using SistemaClinica.BackEnd.API.Repository.Actions;

namespace SistemaClinica.BackEnd.API.Repository
{
    public interface IErroresBDRepository : IObtenerRepository<ErroresBD, int>, IInsertarRepository<ErroresBD>, IActualizarRepository<ErroresBD>, IEliminarRepository<int>
    {
    }
}
