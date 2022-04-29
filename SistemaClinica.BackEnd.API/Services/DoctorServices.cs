using SistemaClinica.BackEnd.API.Models;
using SistemaClinica.BackEnd.API.Services.Interfaces;
using SistemaClinica.BackEnd.API.UnityOfWork;

namespace SistemaClinica.BackEnd.API.Services
{
    public class DoctorServices : IDoctorServices
    {
        private IUnitOfWork BD;
        public DoctorServices(IUnitOfWork unitOfWork)
        {
            BD = unitOfWork;
        }
        public void Actualizar(Doctor model)
        {
            using (var bd = BD.Conectar())
            {
                bd.Repositories.DoctorRepository.Actualizar(model);

                bd.SaveChanges();
            }
        }

        public void Eliminar(string id)
        {
            using (var bd = BD.Conectar())
            {
                bd.Repositories.DoctorRepository.Eliminar(id);

                bd.SaveChanges();
            }
        }

        public void Eliminar(int id)
        {
            throw new NotImplementedException();
        }

        public void Insertar(Doctor model)
        {
            using (var bd = BD.Conectar())
            {
                bd.Repositories.DoctorRepository.Insertar(model);

                bd.SaveChanges();
            }
        }

        public Doctor SeleccionarPorId(string id)
        {
            Doctor DoctorSeleccionada = new();

            using (var bd = BD.Conectar())
            {
                DoctorSeleccionada = bd.Repositories.DoctorRepository.SeleccionarPorId(id);

                bd.SaveChanges();
            }

            return DoctorSeleccionada;
        }

        public Doctor SeleccionarPorId(int id)
        {
            throw new NotImplementedException();
        }

        public List<Doctor> SeleccionarTodos()
        {
            List<Doctor> ListaTodasLasDoctor;

            using (var bd = BD.Conectar())
            {
                ListaTodasLasDoctor = bd.Repositories.DoctorRepository.SeleccionarTodos();

                bd.SaveChanges();
            }

            return ListaTodasLasDoctor;
        }
    }
}
