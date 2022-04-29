using SistemaClinica.BackEnd.API.Models;
using SistemaClinica.BackEnd.API.Services.Interfaces;
using SistemaClinica.BackEnd.API.UnityOfWork;

namespace SistemaClinica.BackEnd.API.Services
{
    public class ClinicaServices : IClinicaServices
    { 
   private IUnitOfWork BD;
    public ClinicaServices(IUnitOfWork unitOfWork)
    {
        BD = unitOfWork;
    }
    public void Actualizar(Clinica model)
    {
        using (var bd = BD.Conectar())
        {
            bd.Repositories.ClinicaRepository.Actualizar(model);

            bd.SaveChanges();
        }
    }

    public void Eliminar(int id)
    {
        using (var bd = BD.Conectar())
        {
            bd.Repositories.ClinicaRepository.Eliminar(id);

            bd.SaveChanges();
        }
    }

    public void Insertar(Clinica model)
    {
        using (var bd = BD.Conectar())
        {
            bd.Repositories.ClinicaRepository.Insertar(model);

            bd.SaveChanges();
        }
    }

    public Clinica SeleccionarPorId(int id)
    {
            Clinica ClinicaSeleccionada = new();

        using (var bd = BD.Conectar())
        {
                ClinicaSeleccionada = bd.Repositories.ClinicaRepository.SeleccionarPorId(id);

            bd.SaveChanges();
        }

        return ClinicaSeleccionada;
    }

    public List<Clinica> SeleccionarTodos()
    {
        List<Clinica> ListaTodasLasClinica;

        using (var bd = BD.Conectar())
        {
                ListaTodasLasClinica = bd.Repositories.ClinicaRepository.SeleccionarTodos();

            bd.SaveChanges();
        }

        return ListaTodasLasClinica;
    }
}
}
