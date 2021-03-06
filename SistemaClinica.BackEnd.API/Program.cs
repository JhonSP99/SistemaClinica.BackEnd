using SistemaClinica.BackEnd.API.Services;
using SistemaClinica.BackEnd.API.Services.Interfaces;
using SistemaClinica.BackEnd.API.UnityOfWork;
using SistemaClinica.BackEnd.API.UnityOfWork.SqlServer;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

//Aca van todos los servicios de cada Entidad
builder.Services.AddTransient<IUnitOfWork, UnitOfWorkSqlServer>();
builder.Services.AddTransient<ICitaServices, CitaServices>();
builder.Services.AddTransient<IClinicaServices, ClinicaServices>();
builder.Services.AddTransient<IConsultorioServices, ConsultorioServices>();
builder.Services.AddTransient<IDiagnosticoCitaServices, DiagnosticoCitaServices>();
builder.Services.AddTransient<IDoctorServices, DoctorServices>();
builder.Services.AddTransient<IEnfermedadServices, EnfermedadServices>();
builder.Services.AddTransient<IEstadoCitaServices, EstadoCitaServices>();
builder.Services.AddTransient<IMedicamentoCitasServices, MedicamentosCitasServices>();
builder.Services.AddTransient<IMedicamentoServices, MedicamentoServices>();
builder.Services.AddTransient<IPacienteServices, PacienteServices>();

builder.Services.AddControllers()
                //.AddJsonOptions(options =>
                //{
                //    //Permite que se mantengan las propiedades tal cual se escriben en los modelos
                //    options.JsonSerializerOptions.PropertyNamingPolicy = null;
                //})
                .ConfigureApiBehaviorOptions(options =>
                {
                    //Permite controlar el estado de los modelos cuando llegan a un controlador
                    options.SuppressModelStateInvalidFilter = true;
                });

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();