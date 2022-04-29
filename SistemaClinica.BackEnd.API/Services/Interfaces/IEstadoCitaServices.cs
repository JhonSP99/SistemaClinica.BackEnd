using SistemaClinica.BackEnd.API.Models;

namespace SistemaClinica.BackEnd.API.Services.Interfaces
{
    public interface IEstadoCitaServices
    {

        List<EstadoCita> SeleccionarTodos();
        EstadoCita SeleccionarPorId(int id);
        void Insertar(EstadoCita model);
        void Actualizar(EstadoCita model);
        void Eliminar(int id);
    }
}
