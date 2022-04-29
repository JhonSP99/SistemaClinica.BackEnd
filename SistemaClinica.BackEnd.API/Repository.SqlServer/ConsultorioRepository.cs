using SistemaClinica.BackEnd.API.Models;
using System.Data;
using System.Data.SqlClient;

namespace SistemaClinica.BackEnd.API.Repository.SqlServer
{
    public class ConsultorioRepository : ConexionBD, IConsultorioRepository
    {
        public ConsultorioRepository(SqlConnection context, SqlTransaction transaction)
        {
            this._context = context;
            this._transaction = transaction;
        }
        public void Actualizar(Consultorio consultorio)
        {
            //Asi se hace cuando son consultas planas, que no se usa SPs ni Funciones
            //var query = "UPDATE Aula SET Horario = @Horario, CodigoCurso  = @CodigoCurso, FechaModificacion = @FechaModificacion, ModificadoPor = @ModificadoPor WHERE NumeroAula = @NumeroAula";
            //var command = CreateCommand(query);

            var query = "SP_Consultorio_Actualizar";
            var command = CreateCommand(query);
            command.CommandType = System.Data.CommandType.StoredProcedure;

            command.Parameters.AddWithValue("@IdConsultorio", consultorio.IdConsultorio);
            command.Parameters.AddWithValue("@Nombreconsultorio", consultorio.Nombreconsultorio);
            command.Parameters.AddWithValue("@Direccion", consultorio.Direccion);

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

        public void Insertar(Consultorio consultorio)
        {
            var query = "SP_Consultorio_Insertar";
            var command = CreateCommand(query);
            command.CommandType = System.Data.CommandType.StoredProcedure;

            command.Parameters.AddWithValue("@IdConsultorio", consultorio.IdConsultorio);
            command.Parameters.AddWithValue("@Nombreconsultorio", consultorio.Nombreconsultorio);
            command.Parameters.AddWithValue("@Direccion", consultorio.Direccion);

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

        public Consultorio SeleccionarPorId(int IdConsultorio)
        {
            var query = "SELECT * FROM FN_Consultorio_SeleccionarPorId(@IdConsultorio)";

            var command = CreateCommand(query);

            command.Parameters.AddWithValue("@IdConsultorio", IdConsultorio);

            SqlDataReader reader = command.ExecuteReader();

            Consultorio ConsultorioSeleccionada = new();

            while (reader.Read())
            {
                ConsultorioSeleccionada.IdConsultorio = Convert.ToInt32(reader["IdConsultorio"]);
                ConsultorioSeleccionada.Nombreconsultorio = Convert.ToString(reader["Nombreconsultorio"]);

                ConsultorioSeleccionada.Activo = Convert.ToBoolean(reader["Activo"]);
                ConsultorioSeleccionada.FechaCreacion = Convert.ToDateTime(reader["FechaCreacion"]);
                ConsultorioSeleccionada.FechaModificacion = (DateTime?)(reader.IsDBNull("FechaModificacion") ? null : reader["FechaModificacion"]);
                ConsultorioSeleccionada.CreadoPor = Convert.ToString(reader["CreadoPor"]);
                ConsultorioSeleccionada.ModificadoPor = Convert.ToString(reader["ModificadoPor"]);
            }

            reader.Close();

            return ConsultorioSeleccionada;
        }

        public List<Consultorio> SeleccionarTodos()
        {
            var query = "SELECT * FROM FN_Consultorio_SeleccionarTodos()";
            var command = CreateCommand(query);

            SqlDataReader reader = command.ExecuteReader();

            List<Consultorio> ListaTodasLasConsultorio = new List<Consultorio>();

            while (reader.Read())
            {
                Consultorio ConsultorioSeleccionada = new();

                ConsultorioSeleccionada.IdConsultorio = Convert.ToInt32(reader["IdConsultorio"]);
                ConsultorioSeleccionada.Nombreconsultorio = Convert.ToString(reader["Nombreconsultorio"]);

                ConsultorioSeleccionada.Activo = Convert.ToBoolean(reader["Activo"]);
                ConsultorioSeleccionada.FechaCreacion = Convert.ToDateTime(reader["FechaCreacion"]);
                ConsultorioSeleccionada.FechaModificacion = (DateTime?)(reader.IsDBNull("FechaModificacion") ? null : reader["FechaModificacion"]);
                ConsultorioSeleccionada.CreadoPor = Convert.ToString(reader["CreadoPor"]);
                ConsultorioSeleccionada.ModificadoPor = Convert.ToString(reader["ModificadoPor"]);

                ListaTodasLasConsultorio.Add(ConsultorioSeleccionada);
            }

            reader.Close();

            return ListaTodasLasConsultorio;
        }
    }
}

