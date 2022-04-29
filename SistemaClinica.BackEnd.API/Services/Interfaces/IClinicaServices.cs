using SistemaClinica.BackEnd.API.Models;

namespace SistemaClinica.BackEnd.API.Services.Interfaces
{
    public interface IClinicaServices
    {

        List<Clinica> SeleccionarTodos();
        Clinica SeleccionarPorId(int id);
        void Insertar(Clinica model);
        void Actualizar(Clinica model);
        void Eliminar(int id);
    }
}
