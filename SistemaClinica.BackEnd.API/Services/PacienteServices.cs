using SistemaClinica.BackEnd.API.Models;
using SistemaClinica.BackEnd.API.Services.Interfaces;
using SistemaClinica.BackEnd.API.UnityOfWork;

namespace SistemaClinica.BackEnd.API.Services
{
    public class PacienteServices : IPacienteServices
    {
        private IUnitOfWork BD;
        public PacienteServices(IUnitOfWork unitOfWork)
        {
            BD = unitOfWork;
        }
        public void Actualizar(Paciente model)
        {
            using (var bd = BD.Conectar())
            {
                bd.Repositories.PacienteRepository.Actualizar(model);

                bd.SaveChanges();
            }
        }

        public void Eliminar(string id)
        {
            using (var bd = BD.Conectar())
            {
                bd.Repositories.PacienteRepository.Eliminar(id);

                bd.SaveChanges();
            }
        }

        public void Eliminar(int id)
        {
            throw new NotImplementedException();
        }

        public void Insertar(Paciente model)
        {
            using (var bd = BD.Conectar())
            {
                bd.Repositories.PacienteRepository.Insertar(model);

                bd.SaveChanges();
            }
        }

        public Paciente SeleccionarPorId(string id)
        {
            Paciente PacienteSeleccionada = new();

            using (var bd = BD.Conectar())
            {
                PacienteSeleccionada = bd.Repositories.PacienteRepository.SeleccionarPorId(id);

                bd.SaveChanges();
            }

            return PacienteSeleccionada;
        }

        public Paciente SeleccionarPorId(int id)
        {
            throw new NotImplementedException();
        }

        public List<Paciente> SeleccionarTodos()
        {
            List<Paciente> ListaTodasLasPaciente;

            using (var bd = BD.Conectar())
            {
                ListaTodasLasPaciente = bd.Repositories.PacienteRepository.SeleccionarTodos();

                bd.SaveChanges();
            }

            return ListaTodasLasPaciente;
        }
    }
}
