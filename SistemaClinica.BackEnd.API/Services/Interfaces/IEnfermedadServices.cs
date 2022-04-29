using SistemaClinica.BackEnd.API.Models;

namespace SistemaClinica.BackEnd.API.Services.Interfaces
{
    public interface IEnfermedadServices
    {

        List<Enfermedad> SeleccionarTodos();
        Enfermedad SeleccionarPorId(int id);
        void Insertar(Enfermedad model);
        void Actualizar(Enfermedad model);
        void Eliminar(int id);
    }
}
