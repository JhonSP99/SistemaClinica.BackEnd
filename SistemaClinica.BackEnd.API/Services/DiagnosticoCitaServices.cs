using SistemaClinica.BackEnd.API.Models;
using SistemaClinica.BackEnd.API.Services.Interfaces;
using SistemaClinica.BackEnd.API.UnityOfWork;

namespace SistemaClinica.BackEnd.API.Services
{
    public class DiagnosticoCitaServices : IDiagnosticoCitaServices
    {
        private IUnitOfWork BD;
        public DiagnosticoCitaServices(IUnitOfWork unitOfWork)
        {
            BD = unitOfWork;
        }
        public void Actualizar(DiagnosticoCita model)
        {
            using (var bd = BD.Conectar())
            {
                bd.Repositories.DiagnosticoCitaRepository.Actualizar(model);

                bd.SaveChanges();
            }
        }

        public void Eliminar(int id)
        {
            using (var bd = BD.Conectar())
            {
                bd.Repositories.DiagnosticoCitaRepository.Eliminar(id);

                bd.SaveChanges();
            }
        }

        public void Insertar(DiagnosticoCita model)
        {
            using (var bd = BD.Conectar())
            {
                bd.Repositories.DiagnosticoCitaRepository.Insertar(model);

                bd.SaveChanges();
            }
        }

        public DiagnosticoCita SeleccionarPorId(int id)
        {
            DiagnosticoCita DiagnosticoCitaSeleccionada = new();

            using (var bd = BD.Conectar())
            {
                DiagnosticoCitaSeleccionada = bd.Repositories.DiagnosticoCitaRepository.SeleccionarPorId(id);

                bd.SaveChanges();
            }

            return DiagnosticoCitaSeleccionada;
        }

        public List<DiagnosticoCita> SeleccionarTodos()
        {
            List<DiagnosticoCita> ListaTodasLasDiagnosticoCita;

            using (var bd = BD.Conectar())
            {
                ListaTodasLasDiagnosticoCita = bd.Repositories.DiagnosticoCitaRepository.SeleccionarTodos();

                bd.SaveChanges();
            }

            return ListaTodasLasDiagnosticoCita;
        }
    }
}
