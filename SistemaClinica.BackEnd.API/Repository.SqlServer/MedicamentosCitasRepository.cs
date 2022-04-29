using SistemaClinica.BackEnd.API.Models;
using SistemaClinica.BackEnd.API.Repository.Actions;
using System.Data;
using System.Data.SqlClient;

namespace SistemaClinica.BackEnd.API.Repository.SqlServer
{
    public class MedicamentosCitasRepository : ConexionBD, IMedicamentosCitasRepository
    {
        public MedicamentosCitasRepository(SqlConnection context, SqlTransaction transaction)
        {
            this._context = context;
            this._transaction = transaction;
        }
        public void Actualizar(MedicamentosCitas medicamentosCitas)
        {
            //Asi se hace cuando son consultas planas, que no se usa SPs ni Funciones
            //var query = "UPDATE Aula SET Horario = @Horario, CodigoCurso  = @CodigoCurso, FechaModificacion = @FechaModificacion, ModificadoPor = @ModificadoPor WHERE NumeroAula = @NumeroAula";
            //var command = CreateCommand(query);

            var query = "SP_MedicamentosCitas_Actualizar";
            var command = CreateCommand(query);
            command.CommandType = System.Data.CommandType.StoredProcedure;

            command.Parameters.AddWithValue("@IdCita", medicamentosCitas.IdCita);           

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

        public void Insertar(MedicamentosCitas medicamentosCitas)
        {
            var query = "SP_MedicamentosCitas_Insertar";
            var command = CreateCommand(query);
            command.CommandType = System.Data.CommandType.StoredProcedure;

            command.Parameters.AddWithValue("@IdCita", medicamentosCitas.IdCita);
            
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

        public MedicamentosCitas SeleccionarPorId(int IdCita)
        {
            var query = "SELECT * FROM FN_MedicamentosCitas_SeleccionarPorId(@IdCita)";

            var command = CreateCommand(query);

            command.Parameters.AddWithValue("@IdCita", IdCita);

            SqlDataReader reader = command.ExecuteReader();

            MedicamentosCitas MedicamentosCitasSeleccionada = new();

            while (reader.Read())
            {
                MedicamentosCitasSeleccionada.IdCita = Convert.ToInt32(reader["IdCita"]);
                

                MedicamentosCitasSeleccionada.Activo = Convert.ToBoolean(reader["Activo"]);
                MedicamentosCitasSeleccionada.FechaCreacion = Convert.ToDateTime(reader["FechaCreacion"]);
                MedicamentosCitasSeleccionada.FechaModificacion = (DateTime?)(reader.IsDBNull("FechaModificacion") ? null : reader["FechaModificacion"]);
                MedicamentosCitasSeleccionada.CreadoPor = Convert.ToString(reader["CreadoPor"]);
                MedicamentosCitasSeleccionada.ModificadoPor = Convert.ToString(reader["ModificadoPor"]);
            }

            reader.Close();

            return MedicamentosCitasSeleccionada;
        }

        public List<MedicamentosCitas> SeleccionarTodos()
        {
            var query = "SELECT * FROM FN_MedicamentosCitas_SeleccionarTodos()";
            var command = CreateCommand(query);

            SqlDataReader reader = command.ExecuteReader();

            List<MedicamentosCitas> ListaTodasLasMedicamentosCitas = new List<MedicamentosCitas>();

            while (reader.Read())
            {
                MedicamentosCitas MedicamentosCitasSeleccionada = new();

                MedicamentosCitasSeleccionada.IdCita = Convert.ToInt32(reader["IdCita"]);

                MedicamentosCitasSeleccionada.Activo = Convert.ToBoolean(reader["Activo"]);
                MedicamentosCitasSeleccionada.FechaCreacion = Convert.ToDateTime(reader["FechaCreacion"]);
                MedicamentosCitasSeleccionada.FechaModificacion = (DateTime?)(reader.IsDBNull("FechaModificacion") ? null : reader["FechaModificacion"]);
                MedicamentosCitasSeleccionada.CreadoPor = Convert.ToString(reader["CreadoPor"]);
                MedicamentosCitasSeleccionada.ModificadoPor = Convert.ToString(reader["ModificadoPor"]);

                ListaTodasLasMedicamentosCitas.Add(MedicamentosCitasSeleccionada);
            }

            reader.Close();

            return ListaTodasLasMedicamentosCitas;
        }

        void IEliminarRepository<decimal>.Eliminar(decimal id)
        {
            throw new NotImplementedException();
        }

        MedicamentosCitas IObtenerRepository<MedicamentosCitas, decimal>.SeleccionarPorId(decimal id)
        {
            throw new NotImplementedException();
        }
    }
}


