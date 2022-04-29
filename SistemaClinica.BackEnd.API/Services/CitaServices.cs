using SistemaClinica.BackEnd.API.Models;
using SistemaClinica.BackEnd.API.Services.Interfaces;
using SistemaClinica.BackEnd.API.UnityOfWork;

namespace SistemaClinica.BackEnd.API.Services
{
    public class CitaServices : ICitaServices
    {
        private IUnitOfWork BD;
        public CitaServices(IUnitOfWork unitOfWork)
        {
            BD = unitOfWork;
        }
        public void Actualizar(Cita model)
        {
            using (var bd = BD.Conectar())
            {
                bd.Repositories.CitaRepository.Actualizar(model);

                bd.SaveChanges();
            }
        }

        public void Eliminar(int id)
        {
            using (var bd = BD.Conectar())
            {
                bd.Repositories.CitaRepository.Eliminar(id);

                bd.SaveChanges();
            }
        }

        public void Insertar(Cita model)
        {
            using (var bd = BD.Conectar())
            {
                bd.Repositories.CitaRepository.Insertar(model);

                bd.SaveChanges();
            }
        }

        public Cita SeleccionarPorId(int id)
        {
            Cita CitaSeleccionada = new();

            using (var bd = BD.Conectar())
            {
                CitaSeleccionada = bd.Repositories.CitaRepository.SeleccionarPorId(id);

                bd.SaveChanges();
            }

            return CitaSeleccionada;
        }

        public List<Cita> SeleccionarTodos()
        {
            List<Cita> ListaTodasLasCita;

            using (var bd = BD.Conectar())
            {
                ListaTodasLasCita = bd.Repositories.CitaRepository.SeleccionarTodos();

                bd.SaveChanges();
            }

            return ListaTodasLasCita;
        }
    }
}
