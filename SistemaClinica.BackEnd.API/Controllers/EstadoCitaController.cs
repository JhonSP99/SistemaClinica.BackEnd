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
    public class EstadoCitaController : ControllerBase
    {
        private readonly IEstadoCitaServices ServicioDeEstadoCita;
        public EstadoCitaController(EstadoCitaServices EstadoCitaService)
        {
            ServicioDeEstadoCita = EstadoCitaService;
        }
        // GET: api/<CitaController>
        [HttpGet]
        public List<EstadoCitaDtos> Get()
        {
            List<EstadoCita> ListaTodasLasEstadoCita = ServicioDeEstadoCita.SeleccionarTodos();

            List<EstadoCitaDtos> ListaTodasLasEstadoCitaDto = new();

            foreach (var EstadoCitaSeleccionada in ListaTodasLasEstadoCita)
            {
                EstadoCitaDtos EstadoCitaDtos = new();

                EstadoCitaDtos.idEstado = EstadoCitaSeleccionada.idEstado;
                EstadoCitaDtos.Estado = EstadoCitaSeleccionada.Estado;

                ListaTodasLasEstadoCitaDto.Add(EstadoCitaDtos);
            }

            return ListaTodasLasEstadoCitaDto;
        }

        // GET api/<CitaController>/5
        [HttpGet("{id}")]
        public IActionResult Get(int id)
        {
            EstadoCita EstadoCitaSeleccionada = new();

            EstadoCitaSeleccionada = ServicioDeEstadoCita.SeleccionarPorId(id);

            if (EstadoCitaSeleccionada.idEstado == 0)
            {
                return NotFound("Estado no encontrada");
            }

            EstadoCitaDtos EstadoCitaDtos = new();

            EstadoCitaDtos.idEstado = EstadoCitaSeleccionada.idEstado;
            EstadoCitaDtos.Estado = EstadoCitaSeleccionada.Estado;

            return Ok(EstadoCitaDtos);
        }

        // POST api/<CitaController>
        [HttpPost]
        public IActionResult Post([FromBody] EstadoCitaDtos EstadoCitaDtos)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    EstadoCita EstadoCitaPorInsertar = new();

                    EstadoCitaPorInsertar.idEstado = EstadoCitaDtos.idEstado;
                    EstadoCitaPorInsertar.Estado = EstadoCitaDtos.Estado;
                    EstadoCitaPorInsertar.CreadoPor = "jhonsp";

                    ServicioDeEstadoCita.Insertar(EstadoCitaPorInsertar);

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
        public IActionResult Put(int id, [FromBody] EstadoCitaDtos EstadoCitaDtos)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    EstadoCita EstadoCitaPorActualizar = new();

                    EstadoCitaPorActualizar.idEstado = EstadoCitaDtos.idEstado;
                    EstadoCitaPorActualizar.Estado = EstadoCitaDtos.Estado;
                    EstadoCitaPorActualizar.CreadoPor = "jhonsp";

                    ServicioDeEstadoCita.Actualizar(EstadoCitaPorActualizar);

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
