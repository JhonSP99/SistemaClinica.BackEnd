using SistemaClinica.BackEnd.API.Models;
using SistemaClinica.BackEnd.API.Services.Interfaces;
using SistemaClinica.BackEnd.API.UnityOfWork;

namespace SistemaClinica.BackEnd.API.Services
{
    public class ConsultorioServices : IConsultorioServices
    {
        private IUnitOfWork BD;
        public ConsultorioServices(IUnitOfWork unitOfWork)
        {
            BD = unitOfWork;
        }
        public void Actualizar(Consultorio model)
        {
            using (var bd = BD.Conectar())
            {
                bd.Repositories.ConsultorioRepository.Actualizar(model);

                bd.SaveChanges();
            }
        }

        public void Eliminar(int id)
        {
            using (var bd = BD.Conectar())
            {
                bd.Repositories.ConsultorioRepository.Eliminar(id);

                bd.SaveChanges();
            }
        }

        public void Insertar(Consultorio model)
        {
            using (var bd = BD.Conectar())
            {
                bd.Repositories.ConsultorioRepository.Insertar(model);

                bd.SaveChanges();
            }
        }

        public Consultorio SeleccionarPorId(int id)
        {
            Consultorio ConsultorioSeleccionada = new();

            using (var bd = BD.Conectar())
            {
                ConsultorioSeleccionada = bd.Repositories.ConsultorioRepository.SeleccionarPorId(id);

                bd.SaveChanges();
            }

            return ConsultorioSeleccionada;
        }

        public List<Consultorio> SeleccionarTodos()
        {
            List<Consultorio> ListaTodasLasConsultorio;

            using (var bd = BD.Conectar())
            {
                ListaTodasLasConsultorio = bd.Repositories.ConsultorioRepository.SeleccionarTodos();

                bd.SaveChanges();
            }

            return ListaTodasLasConsultorio;
        }
    }
}