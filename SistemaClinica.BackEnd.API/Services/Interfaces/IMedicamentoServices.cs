using SistemaClinica.BackEnd.API.Models;

namespace SistemaClinica.BackEnd.API.Services.Interfaces
{
    public interface IMedicamentoServices
    {

        List<Medicamento> SeleccionarTodos();
        Medicamento SeleccionarPorId(int id);
        void Insertar(Medicamento model);
        void Actualizar(Medicamento model);
        void Eliminar(int id);
    }
}
