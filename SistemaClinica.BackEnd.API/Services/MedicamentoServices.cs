using SistemaClinica.BackEnd.API.Models;
using SistemaClinica.BackEnd.API.Services.Interfaces;
using SistemaClinica.BackEnd.API.UnityOfWork;

namespace SistemaClinica.BackEnd.API.Services
{
    public class MedicamentoServices : IMedicamentoServices
    {
        private IUnitOfWork BD;
        public MedicamentoServices(IUnitOfWork unitOfWork)
        {
            BD = unitOfWork;
        }
        public void Actualizar(Medicamento model)
        {
            using (var bd = BD.Conectar())
            {
                bd.Repositories.MedicamentoRepository.Actualizar(model);

                bd.SaveChanges();
            }
        }

        public void Eliminar(int id)
        {
            using (var bd = BD.Conectar())
            {
                bd.Repositories.MedicamentoRepository.Eliminar(id);

                bd.SaveChanges();
            }
        }

        public void Insertar(Medicamento model)
        {
            using (var bd = BD.Conectar())
            {
                bd.Repositories.MedicamentoRepository.Insertar(model);

                bd.SaveChanges();
            }
        }

        public Medicamento SeleccionarPorId(int id)
        {
            Medicamento MedicamentoSeleccionada = new();

            using (var bd = BD.Conectar())
            {
                MedicamentoSeleccionada = bd.Repositories.MedicamentoRepository.SeleccionarPorId(id);

                bd.SaveChanges();
            }

            return MedicamentoSeleccionada;
        }

        public List<Medicamento> SeleccionarTodos()
        {
            List<Medicamento> ListaTodasLasMedicamento;

            using (var bd = BD.Conectar())
            {
                ListaTodasLasMedicamento = bd.Repositories.MedicamentoRepository.SeleccionarTodos();

                bd.SaveChanges();
            }

            return ListaTodasLasMedicamento;
        }
    }
}
