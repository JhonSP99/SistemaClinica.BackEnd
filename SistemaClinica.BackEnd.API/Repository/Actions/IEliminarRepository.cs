namespace SistemaClinica.BackEnd.API.Repository.Actions
{
    public interface IEliminarRepository<T>
    {
        void Eliminar(T id);
    }
}
