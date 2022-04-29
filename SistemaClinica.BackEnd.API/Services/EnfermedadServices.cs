using SistemaClinica.BackEnd.API.Models;
using SistemaClinica.BackEnd.API.Services.Interfaces;
using SistemaClinica.BackEnd.API.UnityOfWork;

namespace SistemaClinica.BackEnd.API.Services
{
    public class EnfermedadServices : IEnfermedadServices
    {
        private IUnitOfWork BD;
        public EnfermedadServices(IUnitOfWork unitOfWork)
        {
            BD = unitOfWork;
        }
        public void Actualizar(Enfermedad model)
        {
            using (var bd = BD.Conectar())
            {
                bd.Repositories.EnfermedadRepository.Actualizar(model);

                bd.SaveChanges();
            }
        }

        public void Eliminar(string id)
        {
            using (var bd = BD.Conectar())
            {
                bd.Repositories.EnfermedadRepository.Eliminar(id);

                bd.SaveChanges();
            }
        }

        public void Eliminar(int id)
        {
            throw new NotImplementedException();
        }

        public void Insertar(Enfermedad model)
        {
            using (var bd = BD.Conectar())
            {
                bd.Repositories.EnfermedadRepository.Insertar(model);

                bd.SaveChanges();
            }
        }

        public Enfermedad SeleccionarPorId(string id)
        {
            Enfermedad EnfermedadSeleccionada = new();

            using (var bd = BD.Conectar())
            {
                EnfermedadSeleccionada = bd.Repositories.EnfermedadRepository.SeleccionarPorId(id);

                bd.SaveChanges();
            }

            return EnfermedadSeleccionada;
        }

        public Enfermedad SeleccionarPorId(int id)
        {
            throw new NotImplementedException();
        }

        public List<Enfermedad> SeleccionarTodos()
        {
            List<Enfermedad> ListaTodasLasEnfermedad;

            using (var bd = BD.Conectar())
            {
                ListaTodasLasEnfermedad = bd.Repositories.EnfermedadRepository.SeleccionarTodos();

                bd.SaveChanges();
            }

            return ListaTodasLasEnfermedad;
        }
    }
}
