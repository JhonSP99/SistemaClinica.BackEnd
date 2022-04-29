using SistemaClinica.BackEnd.API.Models;

namespace SistemaClinica.BackEnd.API.Services.Interfaces
{
    public interface IMedicamentoCitasServices
    {

        List<MedicamentosCitas> SeleccionarTodos();
        MedicamentosCitas SeleccionarPorId(int id);
        void Insertar(MedicamentosCitas model);
        void Actualizar(MedicamentosCitas model);
        void Eliminar(int id);
    }
}
