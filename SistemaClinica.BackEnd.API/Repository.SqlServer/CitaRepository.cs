using SistemaClinica.BackEnd.API.Models;
using System.Data;
using System.Data.SqlClient;

namespace SistemaClinica.BackEnd.API.Repository.SqlServer
{
    public class CitaRepository : ConexionBD, ICitaRepository
    {
        public CitaRepository(SqlConnection context, SqlTransaction transaction)
        {
            this._context = context;
            this._transaction = transaction;
        }
        public void Actualizar(Cita cita)
        {
            //Asi se hace cuando son consultas planas, que no se usa SPs ni Funciones
            //var query = "UPDATE Aula SET Horario = @Horario, CodigoCurso  = @CodigoCurso, FechaModificacion = @FechaModificacion, ModificadoPor = @ModificadoPor WHERE NumeroAula = @NumeroAula";
            //var command = CreateCommand(query);

            var query = "SP_Cita_Actualizar";
            var command = CreateCommand(query);
            command.CommandType = System.Data.CommandType.StoredProcedure;

            command.Parameters.AddWithValue("@IdCita", cita.IdCita);
            command.Parameters.AddWithValue("@FechaHora", cita.FechaHora);
            command.Parameters.AddWithValue("@IdPaciente", cita.IdPaciente);

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

        public void Insertar(Cita cita)
        {
            var query = "SP_Cita_Insertar";
            var command = CreateCommand(query);
            command.CommandType = System.Data.CommandType.StoredProcedure;

            command.Parameters.AddWithValue("@IdCita", cita.IdCita);
            command.Parameters.AddWithValue("@FechaHora", cita.FechaHora);
            command.Parameters.AddWithValue("@IdPaciente", cita.IdPaciente);

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

        public Cita SeleccionarPorId(int IdCita)
        {
            var query = "SELECT * FROM FN_Cita_SeleccionarPorId(@IdCita)";

            var command = CreateCommand(query);

            command.Parameters.AddWithValue("@IdCita", IdCita);

            SqlDataReader reader = command.ExecuteReader();

            Cita CitaSeleccionada = new();

            while (reader.Read())
            {
                CitaSeleccionada.IdCita = Convert.ToInt32(reader["IdCita"]);
                CitaSeleccionada.IdPaciente = Convert.ToString(reader["IdPaciente"]);

                CitaSeleccionada.Activo = Convert.ToBoolean(reader["Activo"]);
                CitaSeleccionada.FechaCreacion = Convert.ToDateTime(reader["FechaCreacion"]);
                CitaSeleccionada.FechaModificacion = (DateTime?)(reader.IsDBNull("FechaModificacion") ? null : reader["FechaModificacion"]);
                CitaSeleccionada.CreadoPor = Convert.ToString(reader["CreadoPor"]);
                CitaSeleccionada.ModificadoPor = Convert.ToString(reader["ModificadoPor"]);
            }

            reader.Close();

            return CitaSeleccionada;
        }

        public List<Cita> SeleccionarTodos()
        {
            var query = "SELECT * FROM FN_Cita_SeleccionarTodos()";
            var command = CreateCommand(query);

            SqlDataReader reader = command.ExecuteReader();

            List<Cita> ListaTodasLasCita = new List<Cita>();

            while (reader.Read())
            {
                Cita CitaSeleccionada = new();

                CitaSeleccionada.IdCita = Convert.ToInt32(reader["IdCita"]);
                CitaSeleccionada.IdPaciente = Convert.ToString(reader["IdPaciente"]);

                CitaSeleccionada.Activo = Convert.ToBoolean(reader["Activo"]);
                CitaSeleccionada.FechaCreacion = Convert.ToDateTime(reader["FechaCreacion"]);
                CitaSeleccionada.FechaModificacion = (DateTime?)(reader.IsDBNull("FechaModificacion") ? null : reader["FechaModificacion"]);
                CitaSeleccionada.CreadoPor = Convert.ToString(reader["CreadoPor"]);
                CitaSeleccionada.ModificadoPor = Convert.ToString(reader["ModificadoPor"]);

                ListaTodasLasCita.Add(CitaSeleccionada);
            }

            reader.Close();

            return ListaTodasLasCita;
        }
    }
}
