using SistemaClinica.BackEnd.API.Repository;

namespace SistemaClinica.BackEnd.API.UnityOfWork
{
    public interface IUnitOfWorkRepository
    {
        //Acá van todos los repositorios del sistema
        ICitaRepository CitaRepository { get; }
        IClinicaRepository ClinicaRepository { get; }
        IConsultorioRepository ConsultorioRepository { get; }
        IDiagnosticoCitaRepository DiagnosticoCitaRepository { get; }
        IDoctorRepository DoctorRepository { get; }
        IEnfermedadRepository EnfermedadRepository { get; }
    
        IEstadoCitaRepository EstadoCitaRepository { get; }
        IMedicamentosCitasRepository MedicamentosCitasRepository { get; }
        IMedicamentoRepository MedicamentoRepository { get; }
        IPacienteRepository PacienteRepository { get; }


    }
}
