using SistemaClinica.BackEnd.API.Models;

namespace SistemaClinica.BackEnd.API.Services.Interfaces
{
    public interface IPacienteServices
    {

        List<Paciente> SeleccionarTodos();
        Paciente SeleccionarPorId(int id);
        void Insertar(Paciente model);
        void Actualizar(Paciente model);
        void Eliminar(int id);
    }
}
