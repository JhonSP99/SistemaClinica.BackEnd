using SistemaClinica.BackEnd.API.Models;
using System.Data;
using System.Data.SqlClient;

namespace SistemaClinica.BackEnd.API.Repository.SqlServer
{
    public class DiagnosticoCitaRepository : ConexionBD, IDiagnosticoCitaRepository
    {
        public DiagnosticoCitaRepository(SqlConnection context, SqlTransaction transaction)
        {
            this._context = context;
            this._transaction = transaction;
        }
        public void Actualizar(DiagnosticoCita diagnosticoCita)
        {
            //Asi se hace cuando son consultas planas, que no se usa SPs ni Funciones
            //var query = "UPDATE Aula SET Horario = @Horario, CodigoCurso  = @CodigoCurso, FechaModificacion = @FechaModificacion, ModificadoPor = @ModificadoPor WHERE NumeroAula = @NumeroAula";
            //var command = CreateCommand(query);

            var query = "SP_DiagnosticoCita_Actualizar";
            var command = CreateCommand(query);
            command.CommandType = System.Data.CommandType.StoredProcedure;

            command.Parameters.AddWithValue("@IdCita", diagnosticoCita.IdCita);
            command.Parameters.AddWithValue("@Detalle", diagnosticoCita.Detalle);        

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

        public void Eliminar(int id)
        {
            throw new NotImplementedException();
        }

        public void Insertar(DiagnosticoCita diagnosticoCita)
        {
            var query = "SP_DiagnosticoCita_Insertar";
            var command = CreateCommand(query);
            command.CommandType = System.Data.CommandType.StoredProcedure;

            command.Parameters.AddWithValue("@IdCita", diagnosticoCita.IdCita);
            command.Parameters.AddWithValue("@Detalle", diagnosticoCita.Detalle);

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

        public DiagnosticoCita SeleccionarPorId(int IdCita)
        {
            var query = "SELECT * FROM FN_DiagnosticoCita_SeleccionarPorId(@IdCita)";

            var command = CreateCommand(query);

            command.Parameters.AddWithValue("@IdCita", IdCita);

            SqlDataReader reader = command.ExecuteReader();

            DiagnosticoCita DiagnosticoCitaSeleccionada = new();

            while (reader.Read())
            {
                DiagnosticoCitaSeleccionada.IdCita = Convert.ToInt32(reader["IdCita"]);
                DiagnosticoCitaSeleccionada.Detalle = Convert.ToString(reader["Detalle"]);

                DiagnosticoCitaSeleccionada.Activo = Convert.ToBoolean(reader["Activo"]);
                DiagnosticoCitaSeleccionada.FechaCreacion = Convert.ToDateTime(reader["FechaCreacion"]);
                DiagnosticoCitaSeleccionada.FechaModificacion = (DateTime?)(reader.IsDBNull("FechaModificacion") ? null : reader["FechaModificacion"]);
                DiagnosticoCitaSeleccionada.CreadoPor = Convert.ToString(reader["CreadoPor"]);
                DiagnosticoCitaSeleccionada.ModificadoPor = Convert.ToString(reader["ModificadoPor"]);
            }

            reader.Close();

            return DiagnosticoCitaSeleccionada;
        }

        public List<DiagnosticoCita> SeleccionarTodos()
        {
            var query = "SELECT * FROM FN_DiagnosticoCita_SeleccionarTodos()";
            var command = CreateCommand(query);

            SqlDataReader reader = command.ExecuteReader();

            List<DiagnosticoCita> ListaTodasLasDiagnosticoCita = new List<DiagnosticoCita>();

            while (reader.Read())
            {
                DiagnosticoCita DiagnosticoCitaSeleccionada = new();

                DiagnosticoCitaSeleccionada.IdCita = Convert.ToInt32(reader["IdCita"]);
                DiagnosticoCitaSeleccionada.Detalle = Convert.ToString(reader["Detalle"]);

                DiagnosticoCitaSeleccionada.Activo = Convert.ToBoolean(reader["Activo"]);
                DiagnosticoCitaSeleccionada.FechaCreacion = Convert.ToDateTime(reader["FechaCreacion"]);
                DiagnosticoCitaSeleccionada.FechaModificacion = (DateTime?)(reader.IsDBNull("FechaModificacion") ? null : reader["FechaModificacion"]);
                DiagnosticoCitaSeleccionada.CreadoPor = Convert.ToString(reader["CreadoPor"]);
                DiagnosticoCitaSeleccionada.ModificadoPor = Convert.ToString(reader["ModificadoPor"]);

                ListaTodasLasDiagnosticoCita.Add(DiagnosticoCitaSeleccionada);
            }

            reader.Close();

            return ListaTodasLasDiagnosticoCita;
        }
    }
}


