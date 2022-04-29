using SistemaClinica.BackEnd.API.Models;
using SistemaClinica.BackEnd.API.Services.Interfaces;
using SistemaClinica.BackEnd.API.UnityOfWork;

namespace SistemaClinica.BackEnd.API.Services
{
    public class MedicamentosCitasServices : IMedicamentoCitasServices
    {
        private IUnitOfWork BD;
        public MedicamentosCitasServices(IUnitOfWork unitOfWork)
        {
            BD = unitOfWork;
        }
        public void Actualizar(MedicamentosCitas model)
        {
            using (var bd = BD.Conectar())
            {
                bd.Repositories.MedicamentosCitasRepository.Actualizar(model);

                bd.SaveChanges();
            }
        }

        public void Eliminar(int id)
        {
            using (var bd = BD.Conectar())
            {
                bd.Repositories.MedicamentosCitasRepository.Eliminar(id);

                bd.SaveChanges();
            }
        }

        public void Insertar(MedicamentosCitas model)
        {
            using (var bd = BD.Conectar())
            {
                bd.Repositories.MedicamentosCitasRepository.Insertar(model);

                bd.SaveChanges();
            }
        }

        public MedicamentosCitas SeleccionarPorId(int id)
        {
            MedicamentosCitas MedicamentosCitasSeleccionada = new();

            using (var bd = BD.Conectar())
            {
                MedicamentosCitasSeleccionada = bd.Repositories.MedicamentosCitasRepository.SeleccionarPorId(id);

                bd.SaveChanges();
            }

            return MedicamentosCitasSeleccionada;
        }

        public List<MedicamentosCitas> SeleccionarTodos()
        {
            List<MedicamentosCitas> ListaTodasLasMedicamentosCitas;

            using (var bd = BD.Conectar())
            {
                ListaTodasLasMedicamentosCitas = bd.Repositories.MedicamentosCitasRepository.SeleccionarTodos();

                bd.SaveChanges();
            }

            return ListaTodasLasMedicamentosCitas;
        }
    }
}
