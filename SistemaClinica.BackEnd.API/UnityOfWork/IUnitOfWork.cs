namespace SistemaClinica.BackEnd.API.UnityOfWork
{
    public interface IUnitOfWork
    {
        IUnitOfWorkAdapter Conectar();
    }
}
