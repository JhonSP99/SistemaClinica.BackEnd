

using SistemaClinica.BackEnd.API.Repository;
using SistemaClinica.BackEnd.API.Repository.SqlServer;
using System.Data.SqlClient;

namespace SistemaClinica.BackEnd.API.UnityOfWork.SqlServer
{
    public class UnitOfWorkSqlServerRepository : IUnitOfWorkRepository
    {
        //Acá van todos los otros repositorios
        public ICitaRepository CitaRepository { get; }
        public IClinicaRepository ClinicaRepository { get; }
        public IConsultorioRepository ConsultorioRepository { get; }
        public IDiagnosticoCitaRepository DiagnosticoCitaRepository { get; }
        public IDoctorRepository DoctorRepository { get; }
        public IEnfermedadRepository EnfermedadRepository { get; }
        public IEstadoCitaRepository EstadoCitaRepository { get; }
    
        public IMedicamentoRepository MedicamentoRepository { get; }
        public IMedicamentosCitasRepository MedicamentosCitasRepository { get; }
        public IPacienteRepository PacienteRepository { get; }

        public UnitOfWorkSqlServerRepository(SqlConnection context, SqlTransaction transaction)
        {
            //Acá van todos los otros repositorios

            CitaRepository = new CitaRepository(context, transaction);

            ClinicaRepository = new ClinicaRepository(context, transaction);

            ConsultorioRepository = new ConsultorioRepository(context, transaction);

            DiagnosticoCitaRepository = new DiagnosticoCitaRepository(context, transaction);
           
            DoctorRepository = new DoctorRepository(context, transaction);

            EnfermedadRepository = new EnfermedadRepository(context, transaction);

            EstadoCitaRepository = new EstadoCitaRepository(context, transaction); 

            MedicamentoRepository = new MedicamentoRepository(context, transaction);

            MedicamentosCitasRepository = new MedicamentosCitasRepository(context, transaction);

            PacienteRepository = new PacienteRepository(context, transaction);
        }

    }
}
