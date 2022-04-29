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
    public class CitaController : ControllerBase
    {
        private readonly ICitaServices ServicioDeCita;
        public CitaController(CitaServices CitaService)
        {
            ServicioDeCita = CitaService;
        }
        // GET: api/<CitaController>
        [HttpGet]
        public List<CitaDtos> Get()
        {
            List<Cita> ListaTodasLasCita = ServicioDeCita.SeleccionarTodos();

            List<CitaDtos> ListaTodasLasCitaDto = new();

            foreach (var CitaSeleccionada in ListaTodasLasCita)
            {
                CitaDtos CitaDtos = new();

                CitaDtos.IdCita = CitaSeleccionada.IdCita;
                CitaDtos.IdEnfermedad = CitaSeleccionada.IdPaciente;
                CitaDtos.IdDoctor = CitaSeleccionada.IdDoctor;

                ListaTodasLasCitaDto.Add(CitaDtos);
            }

            return ListaTodasLasCitaDto;
        }

        // GET api/<CitaController>/5
        [HttpGet("{id}")]
        public IActionResult Get(int id)
        {
            Cita CitaSeleccionada = new();

            CitaSeleccionada = ServicioDeCita.SeleccionarPorId(id);

            if (CitaSeleccionada.IdCita == 0)
            {
                return NotFound("Cita no encontrada");
            }

            CitaDtos CitaDtos = new();

            CitaDtos.IdCita = CitaSeleccionada.IdCita;
            CitaDtos.IdEnfermedad = CitaSeleccionada.IdPaciente;
            CitaDtos.IdDoctor = CitaSeleccionada.IdDoctor;

            return Ok(CitaDtos);
        }

        // POST api/<CitaController>
        [HttpPost]
        public IActionResult Post([FromBody] CitaDtos CitaDtos)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    Cita CitaPorInsertar = new();

                    CitaPorInsertar.IdCita = CitaDtos.IdCita;
                    CitaPorInsertar.IdPaciente = CitaDtos.IdEnfermedad;
                    CitaPorInsertar.CreadoPor = "jhonsp";

                    ServicioDeCita.Insertar(CitaPorInsertar);

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
        public IActionResult Put(int id, [FromBody] CitaDtos CitaDtos)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    Cita CitaPorActualizar = new();

                    CitaPorActualizar.IdCita = CitaDtos.IdCita;
                    CitaPorActualizar.IdPaciente = CitaDtos.IdEnfermedad;
                    CitaPorActualizar.CreadoPor = "jhonsp";

                    ServicioDeCita.Actualizar(CitaPorActualizar);

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