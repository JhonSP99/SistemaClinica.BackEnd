using SistemaClinica.BackEnd.API.Models;
using SistemaClinica.BackEnd.API.Repository.Actions;
using System.Data;
using System.Data.SqlClient;

namespace SistemaClinica.BackEnd.API.Repository.SqlServer
{
    public class DoctorRepository : ConexionBD, IDoctorRepository
    {
        public DoctorRepository(SqlConnection context, SqlTransaction transaction)
        {
            this._context = context;
            this._transaction = transaction;
        }
        public void Actualizar(Doctor doctor)
        {
            //Asi se hace cuando son consultas planas, que no se usa SPs ni Funciones
            //var query = "UPDATE Aula SET Horario = @Horario, CodigoCurso  = @CodigoCurso, FechaModificacion = @FechaModificacion, ModificadoPor = @ModificadoPor WHERE NumeroAula = @NumeroAula";
            //var command = CreateCommand(query);

            var query = "SP_Doctor_Actualizar";
            var command = CreateCommand(query);
            command.CommandType = System.Data.CommandType.StoredProcedure;

            command.Parameters.AddWithValue("@IdDoctor", doctor.IdDoctor);
            command.Parameters.AddWithValue("@Nombre", doctor.Nombre);
            command.Parameters.AddWithValue("@Apellidos", doctor.Apellidos);
       
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

        public void Insertar(Doctor doctor)
        {
            var query = "SP_Doctor_Insertar";
            var command = CreateCommand(query);
            command.CommandType = System.Data.CommandType.StoredProcedure;

            command.Parameters.AddWithValue("@IdDoctor", doctor.IdDoctor);
            command.Parameters.AddWithValue("@Nombre", doctor.Nombre);
            command.Parameters.AddWithValue("@Apellidos", doctor.Apellidos);

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

        public Doctor SeleccionarPorId(int IdDoctor)
        {
            var query = "SELECT * FROM FN_Doctor_SeleccionarPorId(@IdDoctor)";

            var command = CreateCommand(query);

            command.Parameters.AddWithValue("@IdDoctor", IdDoctor);

            SqlDataReader reader = command.ExecuteReader();

            Doctor DoctorSeleccionada = new();

            while (reader.Read())
            {
                DoctorSeleccionada.IdDoctor = Convert.ToString(reader["IdDoctor"]);
                DoctorSeleccionada.Nombre = Convert.ToString(reader["Nombre"]);

                DoctorSeleccionada.Activo = Convert.ToBoolean(reader["Activo"]);
                DoctorSeleccionada.FechaCreacion = Convert.ToDateTime(reader["FechaCreacion"]);
                DoctorSeleccionada.FechaModificacion = (DateTime?)(reader.IsDBNull("FechaModificacion") ? null : reader["FechaModificacion"]);
                DoctorSeleccionada.CreadoPor = Convert.ToString(reader["CreadoPor"]);
                DoctorSeleccionada.ModificadoPor = Convert.ToString(reader["ModificadoPor"]);
            }

            reader.Close();

            return DoctorSeleccionada;
        }

        public List<Doctor> SeleccionarTodos()
        {
            var query = "SELECT * FROM FN_Doctor_SeleccionarTodos()";
            var command = CreateCommand(query);

            SqlDataReader reader = command.ExecuteReader();

            List<Doctor> ListaTodasLasDoctor = new List<Doctor>();

            while (reader.Read())
            {
                Doctor DoctorSeleccionada = new();

                DoctorSeleccionada.IdDoctor = Convert.ToString(reader["IdDoctor"]);
                DoctorSeleccionada.Nombre = Convert.ToString(reader["Nombre"]);

                DoctorSeleccionada.Activo = Convert.ToBoolean(reader["Activo"]);
                DoctorSeleccionada.FechaCreacion = Convert.ToDateTime(reader["FechaCreacion"]);
                DoctorSeleccionada.FechaModificacion = (DateTime?)(reader.IsDBNull("FechaModificacion") ? null : reader["FechaModificacion"]);
                DoctorSeleccionada.CreadoPor = Convert.ToString(reader["CreadoPor"]);
                DoctorSeleccionada.ModificadoPor = Convert.ToString(reader["ModificadoPor"]);

                ListaTodasLasDoctor.Add(DoctorSeleccionada);
            }

            reader.Close();

            return ListaTodasLasDoctor;
        }

        void IEliminarRepository<string>.Eliminar(string id)
        {
            throw new NotImplementedException();
        }

        Doctor IObtenerRepository<Doctor, string>.SeleccionarPorId(string id)
        {
            throw new NotImplementedException();
        }
    }
}


