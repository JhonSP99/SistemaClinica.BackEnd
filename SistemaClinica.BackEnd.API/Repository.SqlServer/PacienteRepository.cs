using SistemaClinica.BackEnd.API.Models;
using System.Data;
using System.Data.SqlClient;

namespace SistemaClinica.BackEnd.API.Repository.SqlServer
{
    public class PacienteRepository : ConexionBD, IPacienteRepository
    {
        public PacienteRepository(SqlConnection context, SqlTransaction transaction)
        {
            this._context = context;
            this._transaction = transaction;
        }
        public void Actualizar(Paciente paciente)
        {
            //Asi se hace cuando son consultas planas, que no se usa SPs ni Funciones
            //var query = "UPDATE Aula SET Horario = @Horario, CodigoCurso  = @CodigoCurso, FechaModificacion = @FechaModificacion, ModificadoPor = @ModificadoPor WHERE NumeroAula = @NumeroAula";
            //var command = CreateCommand(query);

            var query = "SP_Paciente_Actualizar";
            var command = CreateCommand(query);
            command.CommandType = System.Data.CommandType.StoredProcedure;

            command.Parameters.AddWithValue("@Idpaciente", paciente.Idpaciente);
            command.Parameters.AddWithValue("@Nombre", paciente.Nombre);
            command.Parameters.AddWithValue("@Apellidos", paciente.Apellidos);

            command.Parameters.Add("@DetalleError", SqlDbType.VarChar, 60).Direction = ParameterDirection.Output;
            command.Parameters.Add("@ExisteError", SqlDbType.Bit).Direction = ParameterDirection.Output;

            command.ExecuteNonQuery();

            bool ExisteError = Convert.ToBoolean(command.Parameters["@ExisteError"].Value);
            string? DetalleError = Convert.ToString(command.Parameters["@DetalleError"].Value);

            if (ExisteError)
            {
                throw new Exception(DetalleError);
            }
        }

        public void Eliminar(string id)
        {
            throw new NotImplementedException();
        }

        public void Insertar(Paciente paciente)
        {
            var query = "SP_Paciente_Insertar";
            var command = CreateCommand(query);
            command.CommandType = System.Data.CommandType.StoredProcedure;

            command.Parameters.AddWithValue("@Idpaciente", paciente.Idpaciente);
            command.Parameters.AddWithValue("@Nombre", paciente.Nombre);
            command.Parameters.AddWithValue("@Apellidos", paciente.Apellidos);

            command.Parameters.Add("@DetalleError", SqlDbType.VarChar, 60).Direction = ParameterDirection.Output;
            command.Parameters.Add("@ExisteError", SqlDbType.Bit).Direction = ParameterDirection.Output;

            command.ExecuteNonQuery();

            bool ExisteError = Convert.ToBoolean(command.Parameters["@ExisteError"].Value);
            string? DetalleError = Convert.ToString(command.Parameters["@DetalleError"].Value);

            if (ExisteError)
            {
                throw new Exception(DetalleError);
            }
        }

        public Paciente SeleccionarPorId(string Idpaciente)
        {
            var query = "SELECT * FROM FN_Paciente_SeleccionarPorId(@Idpaciente)";

            var command = CreateCommand(query);

            command.Parameters.AddWithValue("@Idpaciente", Idpaciente);

            SqlDataReader reader = command.ExecuteReader();

            Paciente PacienteSeleccionada = new();

            while (reader.Read())
            {
                PacienteSeleccionada.Idpaciente = Convert.ToString(reader["Idpaciente"]);
                PacienteSeleccionada.Nombre = Convert.ToString(reader["Nombre"]);

                PacienteSeleccionada.Activo = Convert.ToBoolean(reader["Activo"]);
                PacienteSeleccionada.FechaCreacion = Convert.ToDateTime(reader["FechaCreacion"]);
                PacienteSeleccionada.FechaModificacion = (DateTime?)(reader.IsDBNull("FechaModificacion") ? null : reader["FechaModificacion"]);
                PacienteSeleccionada.CreadoPor = Convert.ToString(reader["CreadoPor"]);
                PacienteSeleccionada.ModificadoPor = Convert.ToString(reader["ModificadoPor"]);
            }

            reader.Close();

            return PacienteSeleccionada;
        }

        public List<Paciente> SeleccionarTodos()
        {
            var query = "SELECT * FROM FN_Paciente_SeleccionarTodos()";
            var command = CreateCommand(query);

            SqlDataReader reader = command.ExecuteReader();

            List<Paciente> ListaTodasLasPaciente = new List<Paciente>();

            while (reader.Read())
            {
                Paciente PacienteSeleccionada = new();

                PacienteSeleccionada.Idpaciente = Convert.ToString(reader["Idpaciente"]);
                PacienteSeleccionada.Nombre = Convert.ToString(reader["Nombre"]);

                PacienteSeleccionada.Activo = Convert.ToBoolean(reader["Activo"]);
                PacienteSeleccionada.FechaCreacion = Convert.ToDateTime(reader["FechaCreacion"]);
                PacienteSeleccionada.FechaModificacion = (DateTime?)(reader.IsDBNull("FechaModificacion") ? null : reader["FechaModificacion"]);
                PacienteSeleccionada.CreadoPor = Convert.ToString(reader["CreadoPor"]);
                PacienteSeleccionada.ModificadoPor = Convert.ToString(reader["ModificadoPor"]);

                ListaTodasLasPaciente.Add(PacienteSeleccionada);
            }

            reader.Close();

            return ListaTodasLasPaciente;
        }
    }
}


