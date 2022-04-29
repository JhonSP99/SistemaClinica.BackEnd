using SistemaClinica.BackEnd.API.Models;

namespace SistemaClinica.BackEnd.API.Services.Interfaces
{
    public interface IDoctorServices
    {

        List<Doctor> SeleccionarTodos();
        Doctor SeleccionarPorId(int id);
        void Insertar(Doctor model);
        void Actualizar(Doctor model);
        void Eliminar(int id);
    }
}
