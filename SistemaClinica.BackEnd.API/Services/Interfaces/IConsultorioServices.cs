using SistemaClinica.BackEnd.API.Models;

namespace SistemaClinica.BackEnd.API.Services.Interfaces
{
    public interface IConsultorioServices
    {

        List<Consultorio> SeleccionarTodos();
        Consultorio SeleccionarPorId(int id);
        void Insertar(Consultorio model);
        void Actualizar(Consultorio model);
        void Eliminar(int id);
    }
}
