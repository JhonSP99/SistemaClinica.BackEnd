using SistemaClinica.BackEnd.API.Models;
using SistemaClinica.BackEnd.API.Services.Interfaces;
using SistemaClinica.BackEnd.API.UnityOfWork;

namespace SistemaClinica.BackEnd.API.Services
{
    public class EstadoCitaServices : IEstadoCitaServices
    {
        private IUnitOfWork BD;
        public EstadoCitaServices(IUnitOfWork unitOfWork)
        {
            BD = unitOfWork;
        }
        public void Actualizar(EstadoCita model)
        {
            using (var bd = BD.Conectar())
            {
                bd.Repositories.EstadoCitaRepository.Actualizar(model);

                bd.SaveChanges();
            }
        }

        public void Eliminar(int id)
        {
            using (var bd = BD.Conectar())
            {
                bd.Repositories.EstadoCitaRepository.Eliminar(id);

                bd.SaveChanges();
            }
        }

        public void Insertar(EstadoCita model)
        {
            using (var bd = BD.Conectar())
            {
                bd.Repositories.EstadoCitaRepository.Insertar(model);

                bd.SaveChanges();
            }
        }

        public EstadoCita SeleccionarPorId(int id)
        {
            EstadoCita EstadoCitaSeleccionada = new();

            using (var bd = BD.Conectar())
            {
                EstadoCitaSeleccionada = bd.Repositories.EstadoCitaRepository.SeleccionarPorId(id);

                bd.SaveChanges();
            }

            return EstadoCitaSeleccionada;
        }

        public List<EstadoCita> SeleccionarTodos()
        {
            List<EstadoCita> ListaTodasLasEstadoCita;

            using (var bd = BD.Conectar())
            {
                ListaTodasLasEstadoCita = bd.Repositories.EstadoCitaRepository.SeleccionarTodos();

                bd.SaveChanges();
            }

            return ListaTodasLasEstadoCita;
        }
    }
}
