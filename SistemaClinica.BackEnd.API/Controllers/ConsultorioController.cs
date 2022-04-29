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
    public class ConsultorioController : ControllerBase
    {
        private readonly IConsultorioServices ServicioDeConsultorio;
        public ConsultorioController(ConsultorioServices ConsultorioService)
        {
            ServicioDeConsultorio = ConsultorioService;
        }
        // GET: api/<ConsultorioController>
        [HttpGet]
        public List<ConsultorioDtos> Get()
        {
            List<Consultorio> ListaTodasLasConsultorio = ServicioDeConsultorio.SeleccionarTodos();

            List<ConsultorioDtos> ListaTodasLasCitaDto = new();

            foreach (var ConsultorioSeleccionada in ListaTodasLasConsultorio)
            {
                ConsultorioDtos ConsultorioDtos = new();

                ConsultorioDtos.IdConsultorio = ConsultorioSeleccionada.IdConsultorio;
                ConsultorioDtos.IdClinica = ConsultorioSeleccionada.IdClinica;
                ConsultorioDtos.Nombreconsultorio = ConsultorioSeleccionada.Nombreconsultorio;

                ListaTodasLasCitaDto.Add(ConsultorioDtos);
            }

            return ListaTodasLasCitaDto;
        }

        // GET api/<ConsultorioController>/5
        [HttpGet("{id}")]
        public IActionResult Get(int id)
        {
            Consultorio ConsultorioSeleccionada = new();

            ConsultorioSeleccionada = ServicioDeConsultorio.SeleccionarPorId(id);

            if (ConsultorioSeleccionada.IdConsultorio == 0)
            {
                return NotFound("Consultorio no encontrada");
            }

            ConsultorioDtos ConsultorioDtos = new();

            ConsultorioDtos.IdConsultorio = ConsultorioSeleccionada.IdConsultorio;
            ConsultorioDtos.IdClinica = ConsultorioSeleccionada.IdClinica;
            ConsultorioDtos.Nombreconsultorio = ConsultorioSeleccionada.Nombreconsultorio;

            return Ok(ConsultorioDtos);
        }

        // POST api/<ConsultorioController>
        [HttpPost]
        public IActionResult Post([FromBody] ConsultorioDtos ConsultorioDtos)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    Consultorio ConsultorioPorInsertar = new();

                    ConsultorioPorInsertar.IdConsultorio = ConsultorioDtos.IdConsultorio;
                    ConsultorioPorInsertar.IdClinica = ConsultorioDtos.IdClinica;
                    ConsultorioPorInsertar.CreadoPor = "jhonsp";

                    ServicioDeConsultorio.Insertar(ConsultorioPorInsertar);

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

        // PUT api/<ConsultorioController>/5
        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] ConsultorioDtos ConsultorioDtos)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    Consultorio ConsultorioPorActualizar = new();

                    ConsultorioPorActualizar.IdConsultorio = ConsultorioDtos.IdConsultorio;
                    ConsultorioPorActualizar.IdClinica = ConsultorioDtos.IdClinica;
                    ConsultorioPorActualizar.CreadoPor = "jhonsp";

                    ServicioDeConsultorio.Actualizar(ConsultorioPorActualizar);

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

        // DELETE api/<ConsultorioController>/5
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
