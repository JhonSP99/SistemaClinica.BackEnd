using SistemaClinica.BackEnd.API.Models;
using System.Data;
using System.Data.SqlClient;

namespace SistemaClinica.BackEnd.API.Repository.SqlServer
{
    public class MedicamentoRepository : ConexionBD, IMedicamentoRepository
    {
        public MedicamentoRepository(SqlConnection context, SqlTransaction transaction)
        {
            this._context = context;
            this._transaction = transaction;
        }
        public void Actualizar(Medicamento medicamento)
        {
            //Asi se hace cuando son consultas planas, que no se usa SPs ni Funciones
            //var query = "UPDATE Aula SET Horario = @Horario, CodigoCurso  = @CodigoCurso, FechaModificacion = @FechaModificacion, ModificadoPor = @ModificadoPor WHERE NumeroAula = @NumeroAula";
            //var command = CreateCommand(query);

            var query = "SP_Medicamento_Actualizar";
            var command = CreateCommand(query);
            command.CommandType = System.Data.CommandType.StoredProcedure;

            command.Parameters.AddWithValue("@IdMedicamento", medicamento.IdMedicamento);
            command.Parameters.AddWithValue("@Nombre", medicamento.Nombre);
            command.Parameters.AddWithValue("@ModoAdministración", medicamento.ModoAdministración);

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

        public void Insertar(Medicamento medicamento)
        {
            var query = "SP_Medicamento_Insertar";
            var command = CreateCommand(query);
            command.CommandType = System.Data.CommandType.StoredProcedure;

            command.Parameters.AddWithValue("@IdMedicamento", medicamento.IdMedicamento);
            command.Parameters.AddWithValue("@Nombre", medicamento.Nombre);
            command.Parameters.AddWithValue("@ModoAdministración", medicamento.ModoAdministración);

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

        public Medicamento SeleccionarPorId(int IdMedicamento)
        {
            var query = "SELECT * FROM FN_Medicamento_SeleccionarPorId(@IdMedicamento)";

            var command = CreateCommand(query);

            command.Parameters.AddWithValue("@IdMedicamento", IdMedicamento);

            SqlDataReader reader = command.ExecuteReader();

            Medicamento MedicamentoSeleccionada = new();

            while (reader.Read())
            {
                MedicamentoSeleccionada.IdMedicamento = Convert.ToInt32(reader["IdMedicamento"]);
                MedicamentoSeleccionada.Nombre = Convert.ToString(reader["Nombre"]);

                MedicamentoSeleccionada.Activo = Convert.ToBoolean(reader["Activo"]);            
                MedicamentoSeleccionada.CreadoPor = Convert.ToString(reader["CreadoPor"]);
                MedicamentoSeleccionada.ModificadoPor = Convert.ToString(reader["ModificadoPor"]);
            }

            reader.Close();

            return MedicamentoSeleccionada;
        }

        public List<Medicamento> SeleccionarTodos()
        {
            var query = "SELECT * FROM FN_Medicamento_SeleccionarTodos()";
            var command = CreateCommand(query);

            SqlDataReader reader = command.ExecuteReader();

            List<Medicamento> ListaTodasLasMedicamento = new List<Medicamento>();

            while (reader.Read())
            {
                Medicamento MedicamentoSeleccionada = new();

                MedicamentoSeleccionada.IdMedicamento = Convert.ToInt32(reader["IdMedicamento"]);
                MedicamentoSeleccionada.Nombre = Convert.ToString(reader["Nombre"]);

                MedicamentoSeleccionada.Activo = Convert.ToBoolean(reader["Activo"]);
                MedicamentoSeleccionada.CreadoPor = Convert.ToString(reader["CreadoPor"]);
                MedicamentoSeleccionada.ModificadoPor = Convert.ToString(reader["ModificadoPor"]);

                ListaTodasLasMedicamento.Add(MedicamentoSeleccionada);
            }

            reader.Close();

            return ListaTodasLasMedicamento;
        }
    }
}


