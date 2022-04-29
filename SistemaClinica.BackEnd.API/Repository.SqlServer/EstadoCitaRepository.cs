using SistemaClinica.BackEnd.API.Models;
using System.Data;
using System.Data.SqlClient;

namespace SistemaClinica.BackEnd.API.Repository.SqlServer
{
    public class EstadoCitaRepository : ConexionBD, IEstadoCitaRepository
    {
        public EstadoCitaRepository(SqlConnection context, SqlTransaction transaction)
        {
            this._context = context;
            this._transaction = transaction;
        }
        public void Actualizar(EstadoCita estadoCita)
        {
            //Asi se hace cuando son consultas planas, que no se usa SPs ni Funciones
            //var query = "UPDATE Aula SET Horario = @Horario, CodigoCurso  = @CodigoCurso, FechaModificacion = @FechaModificacion, ModificadoPor = @ModificadoPor WHERE NumeroAula = @NumeroAula";
            //var command = CreateCommand(query);

            var query = "SP_EstadoCita_Actualizar";
            var command = CreateCommand(query);
            command.CommandType = System.Data.CommandType.StoredProcedure;

            command.Parameters.AddWithValue("@idEstado", estadoCita.idEstado);
            command.Parameters.AddWithValue("@Estado", estadoCita.Estado);
            

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

        public void Insertar(EstadoCita estadoCita)
        {
            var query = "SP_EstadoCita_Insertar";
            var command = CreateCommand(query);
            command.CommandType = System.Data.CommandType.StoredProcedure;

            command.Parameters.AddWithValue("@idEstado", estadoCita.idEstado);
            command.Parameters.AddWithValue("@Estado", estadoCita.Estado);

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

        public EstadoCita SeleccionarPorId(int idEstado)
        {
            var query = "SELECT * FROM FN_EstadoCita_SeleccionarPorId(@IdConsultorio)";

            var command = CreateCommand(query);

            command.Parameters.AddWithValue("@idEstado", idEstado);

            SqlDataReader reader = command.ExecuteReader();

            EstadoCita EstadoCitaSeleccionada = new();

            while (reader.Read())
            {
                EstadoCitaSeleccionada.idEstado = Convert.ToInt32(reader["idEstado"]);
                EstadoCitaSeleccionada.Estado = Convert.ToString(reader["Estado"]);

                EstadoCitaSeleccionada.Activo = Convert.ToBoolean(reader["Activo"]);
                EstadoCitaSeleccionada.FechaCreacion = Convert.ToDateTime(reader["FechaCreacion"]);
                EstadoCitaSeleccionada.FechaModificacion = (DateTime?)(reader.IsDBNull("FechaModificacion") ? null : reader["FechaModificacion"]);
                EstadoCitaSeleccionada.CreadoPor = Convert.ToString(reader["CreadoPor"]);
                EstadoCitaSeleccionada.ModificadoPor = Convert.ToString(reader["ModificadoPor"]);
            }

            reader.Close();

            return EstadoCitaSeleccionada;
        }

        public List<EstadoCita> SeleccionarTodos()
        {
            var query = "SELECT * FROM FN_EstadoCita_SeleccionarTodos()";
            var command = CreateCommand(query);

            SqlDataReader reader = command.ExecuteReader();

            List<EstadoCita> ListaTodasLasEstadoCita = new List<EstadoCita>();

            while (reader.Read())
            {
                EstadoCita EstadoCitaSeleccionada = new();

                EstadoCitaSeleccionada.idEstado = Convert.ToInt32(reader["idEstado"]);
                EstadoCitaSeleccionada.Estado = Convert.ToString(reader["Estado"]);

                EstadoCitaSeleccionada.Activo = Convert.ToBoolean(reader["Activo"]);
                EstadoCitaSeleccionada.FechaCreacion = Convert.ToDateTime(reader["FechaCreacion"]);
                EstadoCitaSeleccionada.FechaModificacion = (DateTime?)(reader.IsDBNull("FechaModificacion") ? null : reader["FechaModificacion"]);
                EstadoCitaSeleccionada.CreadoPor = Convert.ToString(reader["CreadoPor"]);
                EstadoCitaSeleccionada.ModificadoPor = Convert.ToString(reader["ModificadoPor"]);

                ListaTodasLasEstadoCita.Add(EstadoCitaSeleccionada);
            }

            reader.Close();

            return ListaTodasLasEstadoCita;
        }
    }
}


