using Microsoft.AspNetCore.Mvc;
using SistemaClinica.BackEnd.API.Dtos;
using SistemaClinica.BackEnd.API.Models;
using SistemaClinica.BackEnd.API.Services;
using SistemaClinica.BackEnd.API.Services.Interfaces;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace SistemaClinica.BackEnd.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PacienteController : ControllerBase
    {
        private readonly IPacienteServices ServicioDePaciente;
        public PacienteController(PacienteServices PacienteService)
        {
            ServicioDePaciente = PacienteService;
        }
        // GET: api/<CitaController>
        [HttpGet]
        public List<PacienteDtos> Get()
        {
            List<Paciente> ListaTodasLasPaciente = ServicioDePaciente.SeleccionarTodos();

            List<PacienteDtos> ListaTodasLasPacienteDto = new();

            foreach (var PacienteSeleccionada in ListaTodasLasPaciente)
            {
                PacienteDtos PacienteDtos = new();

                PacienteDtos.Idpaciente = PacienteSeleccionada.Idpaciente;
                PacienteDtos.Nombre = PacienteSeleccionada.Nombre;
                PacienteDtos.Apellidos = PacienteSeleccionada.Apellidos;

                ListaTodasLasPacienteDto.Add(PacienteDtos);
            }

            return ListaTodasLasPacienteDto;
        }

        // GET api/<CitaController>/5
        [HttpGet("{id}")]
        public IActionResult Get(int id)
        {
            Paciente PacienteSeleccionada = new();

            PacienteSeleccionada = ServicioDePaciente.SeleccionarPorId(id);

            if (PacienteSeleccionada.IdCita == 0)
            {
                return NotFound("Paciente no encontrada");
            }

            PacienteDtos PacienteDtos = new();

            PacienteDtos.Idpaciente = PacienteSeleccionada.Idpaciente;
            PacienteDtos.Nombre = PacienteSeleccionada.Nombre;
            PacienteDtos.Apellidos = PacienteSeleccionada.Apellidos;

            return Ok(PacienteDtos);
        }

        // POST api/<CitaController>
        [HttpPost]
        public IActionResult Post([FromBody] PacienteDtos PacienteDtos)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    Paciente PacientePorInsertar = new();

                    PacientePorInsertar.Idpaciente = PacienteDtos.Idpaciente;
                    PacientePorInsertar.Nombre = PacienteDtos.Nombre;
                    PacientePorInsertar.CreadoPor = "jhonsp";

                    ServicioDePaciente.Insertar(PacientePorInsertar);

                    return Ok();
                }
                else
                {
                    string ErroreEnElModelo = ObtenerErroresDeModeloInvalido();

                    return BadRequest(ErroreEnElModelo);
                }
            }
            catch (Exception Ex)
            {
                return BadRequest(Ex.Message);
            }
        }

        // PUT api/<CitaController>/5
        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] PacienteDtos PacienteDtos)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    Paciente PacientePorActualizar = new();

                    PacientePorActualizar.Idpaciente = PacienteDtos.Idpaciente;
                    PacientePorActualizar.Nombre = PacienteDtos.Nombre;
                    PacientePorActualizar.CreadoPor = "jhonsp";

                    ServicioDePaciente.Actualizar(PacientePorActualizar);

                    return Ok();
                }
                else
                {
                    string ErroreEnElModelo = ObtenerErroresDeModeloInvalido();

                    return BadRequest(ErroreEnElModelo);
                }
            }
            catch (Exception Ex)
            {
                return BadRequest(Ex.Message);
            }
        }

        // DELETE api/<CitaController>/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }

        private string ObtenerErroresDeModeloInvalido()
        {

            var ListaDeErroresEnModelo = ModelState.Keys.Where(i => ModelState[i].Errors.Count > 0)
                                                     .Select(k => ModelState[k].Errors.First().ErrorMessage);

            string ListaDeErroresEnModeloConcatenados = string.Join("\n", ListaDeErroresEnModelo);

            return ListaDeErroresEnModeloConcatenados;
        }
    }
}
