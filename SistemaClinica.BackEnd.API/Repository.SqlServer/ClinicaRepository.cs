using SistemaClinica.BackEnd.API.Models;
using System.Data;
using System.Data.SqlClient;

namespace SistemaClinica.BackEnd.API.Repository.SqlServer
{
    public class ClinicaRepository : ConexionBD, IClinicaRepository
    {
        public ClinicaRepository(SqlConnection context, SqlTransaction transaction)
        {
            this._context = context;
            this._transaction = transaction;
        }
        public void Actualizar(Clinica clinica)
        {
            //Asi se hace cuando son consultas planas, que no se usa SPs ni Funciones
            //var query = "UPDATE Aula SET Horario = @Horario, CodigoCurso  = @CodigoCurso, FechaModificacion = @FechaModificacion, ModificadoPor = @ModificadoPor WHERE NumeroAula = @NumeroAula";
            //var command = CreateCommand(query);

            var query = "SP_Clinica_Actualizar";
            var command = CreateCommand(query);
            command.CommandType = System.Data.CommandType.StoredProcedure;

            command.Parameters.AddWithValue("@IdClinica", clinica.IdClinica);
            command.Parameters.AddWithValue("@Nombre", clinica.Nombre);
            command.Parameters.AddWithValue("@Lugar", clinica.Lugar);

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

        public void Insertar(Clinica clinica)
        {
            var query = "SP_Clinica_Insertar";
            var command = CreateCommand(query);
            command.CommandType = System.Data.CommandType.StoredProcedure;

            command.Parameters.AddWithValue("@IdClinica", clinica.IdClinica);
            command.Parameters.AddWithValue("@Nombre", clinica.Nombre);
            command.Parameters.AddWithValue("@Lugar", clinica.Lugar);

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

        public Clinica SeleccionarPorId(int IdClinica)
        {
            var query = "SELECT * FROM FN_Cita_SeleccionarPorId(@IdClinica)";

            var command = CreateCommand(query);

            command.Parameters.AddWithValue("@IdClinica", IdClinica);

            SqlDataReader reader = command.ExecuteReader();

            Clinica ClinicaSeleccionada = new();

            while (reader.Read())
            {
                ClinicaSeleccionada.IdClinica = Convert.ToInt32(reader["IdClinica"]);
                ClinicaSeleccionada.Nombre = Convert.ToString(reader["Nombre"]);

                ClinicaSeleccionada.Activo = Convert.ToBoolean(reader["Activo"]);
                ClinicaSeleccionada.FechaCreacion = Convert.ToDateTime(reader["FechaCreacion"]);
                ClinicaSeleccionada.FechaModificacion = (DateTime?)(reader.IsDBNull("FechaModificacion") ? null : reader["FechaModificacion"]);
                ClinicaSeleccionada.CreadoPor = Convert.ToString(reader["CreadoPor"]);
                ClinicaSeleccionada.ModificadoPor = Convert.ToString(reader["ModificadoPor"]);
            }

            reader.Close();

            return ClinicaSeleccionada;
        }

        public List<Clinica> SeleccionarTodos()
        {
            var query = "SELECT * FROM FN_Clinica_SeleccionarTodos()";
            var command = CreateCommand(query);

            SqlDataReader reader = command.ExecuteReader();

            List<Clinica> ListaTodasLasClinica = new List<Clinica>();

            while (reader.Read())
            {
                Clinica ClinicaSeleccionada = new();

                ClinicaSeleccionada.IdClinica = Convert.ToInt32(reader["IdClinica"]);
                ClinicaSeleccionada.Nombre = Convert.ToString(reader["Nombre"]);

                ClinicaSeleccionada.Activo = Convert.ToBoolean(reader["Activo"]);
                ClinicaSeleccionada.FechaCreacion = Convert.ToDateTime(reader["FechaCreacion"]);
                ClinicaSeleccionada.FechaModificacion = (DateTime?)(reader.IsDBNull("FechaModificacion") ? null : reader["FechaModificacion"]);
                ClinicaSeleccionada.CreadoPor = Convert.ToString(reader["CreadoPor"]);
                ClinicaSeleccionada.ModificadoPor = Convert.ToString(reader["ModificadoPor"]);

                ListaTodasLasClinica.Add(ClinicaSeleccionada);
            }

            reader.Close();

            return ListaTodasLasClinica;
        }
    }
}

