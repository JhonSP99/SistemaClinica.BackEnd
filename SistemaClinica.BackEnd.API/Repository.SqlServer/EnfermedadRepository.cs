using SistemaClinica.BackEnd.API.Models;
using System.Data;
using System.Data.SqlClient;

namespace SistemaClinica.BackEnd.API.Repository.SqlServer
{
    public class EnfermedadRepository : ConexionBD, IEnfermedadRepository
    {
        public EnfermedadRepository(SqlConnection context, SqlTransaction transaction)
        {
            this._context = context;
            this._transaction = transaction;
        }
        public void Actualizar(Enfermedad enfermedad)
        {
            //Asi se hace cuando son consultas planas, que no se usa SPs ni Funciones
            //var query = "UPDATE Aula SET Horario = @Horario, CodigoCurso  = @CodigoCurso, FechaModificacion = @FechaModificacion, ModificadoPor = @ModificadoPor WHERE NumeroAula = @NumeroAula";
            //var command = CreateCommand(query);

            var query = "SP_Enfermedad_Actualizar";
            var command = CreateCommand(query);
            command.CommandType = System.Data.CommandType.StoredProcedure;

            command.Parameters.AddWithValue("@IdEnfermedad", enfermedad.IdEnfermedad);
            command.Parameters.AddWithValue("@Nombre", enfermedad.Nombre);

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

        public void Insertar(Enfermedad enfermedad)
        {
            var query = "SP_Enfermedad_Insertar";
            var command = CreateCommand(query);
            command.CommandType = System.Data.CommandType.StoredProcedure;

            command.Parameters.AddWithValue("@IdEnfermedad", enfermedad.IdEnfermedad);
            command.Parameters.AddWithValue("@Nombre", enfermedad.Nombre);

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

        public Enfermedad SeleccionarPorId(string IdEnfermedad)
        {
            var query = "SELECT * FROM FN_Enfermedad_SeleccionarPorId(@IdConsultorio)";

            var command = CreateCommand(query);

            command.Parameters.AddWithValue("@IdEnfermedad", IdEnfermedad);

            SqlDataReader reader = command.ExecuteReader();

            Enfermedad EnfermedadSeleccionada = new();

            while (reader.Read())
            {
                EnfermedadSeleccionada.IdEnfermedad = Convert.ToString(reader["IdEnfermedad"]);
                EnfermedadSeleccionada.Nombre = Convert.ToString(reader["Nombre"]);

                EnfermedadSeleccionada.Activo = Convert.ToBoolean(reader["Activo"]);
                EnfermedadSeleccionada.FechaCreacion = Convert.ToDateTime(reader["FechaCreacion"]);
                EnfermedadSeleccionada.FechaModificacion = (DateTime?)(reader.IsDBNull("FechaModificacion") ? null : reader["FechaModificacion"]);
                EnfermedadSeleccionada.CreadoPor = Convert.ToString(reader["CreadoPor"]);
                EnfermedadSeleccionada.ModificadoPor = Convert.ToString(reader["ModificadoPor"]);
            }

            reader.Close();

            return EnfermedadSeleccionada;
        }

        public List<Enfermedad> SeleccionarTodos()
        {
            var query = "SELECT * FROM FN_Enfermedad_SeleccionarTodos()";
            var command = CreateCommand(query);

            SqlDataReader reader = command.ExecuteReader();

            List<Enfermedad> ListaTodasLasEnfermedad = new List<Enfermedad>();

            while (reader.Read())
            {
                Enfermedad EnfermedadSeleccionada = new();

                EnfermedadSeleccionada.IdEnfermedad = Convert.ToString(reader["IdEnfermedad"]);
                EnfermedadSeleccionada.Nombre = Convert.ToString(reader["Nombre"]);

                EnfermedadSeleccionada.Activo = Convert.ToBoolean(reader["Activo"]);
                EnfermedadSeleccionada.FechaCreacion = Convert.ToDateTime(reader["FechaCreacion"]);
                EnfermedadSeleccionada.FechaModificacion = (DateTime?)(reader.IsDBNull("FechaModificacion") ? null : reader["FechaModificacion"]);
                EnfermedadSeleccionada.CreadoPor = Convert.ToString(reader["CreadoPor"]);
                EnfermedadSeleccionada.ModificadoPor = Convert.ToString(reader["ModificadoPor"]);

                ListaTodasLasEnfermedad.Add(EnfermedadSeleccionada);
            }

            reader.Close();

            return ListaTodasLasEnfermedad;
        }
    }
}


