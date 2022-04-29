using SistemaClinica.BackEnd.API.Models;

namespace SistemaClinica.BackEnd.API.Services.Interfaces
{
    public interface ICitaServices
    {
        List<Cita> SeleccionarTodos();
        Cita SeleccionarPorId(int id);
        void Insertar(Cita model);
        void Actualizar(Cita model);
        void Eliminar(int id);
    }
}
