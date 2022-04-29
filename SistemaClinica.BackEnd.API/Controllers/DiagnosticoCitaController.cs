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
    public class DiagnosticoCitaController : ControllerBase
    {
        private readonly IDiagnosticoCitaServices ServicioDeDiagnosticoCita;
        public DiagnosticoCitaController(DiagnosticoCitaServices DiagnosticoCitaService)
        {
            ServicioDeDiagnosticoCita = DiagnosticoCitaService;
        }
        // GET: api/<DiagnosticoCitaController>
        [HttpGet]
        public List<DiagnosticoCitaDtos> Get()
        {
            List<DiagnosticoCita> ListaTodasLasDiagnosticoCita = ServicioDeDiagnosticoCita.SeleccionarTodos();

            List<DiagnosticoCitaDtos> ListaTodasLasDiagnosticoCitaDto = new();

            foreach (var DiagnosticoCitaSeleccionada in ListaTodasLasDiagnosticoCita)
            {
                DiagnosticoCitaDtos DiagnosticoCitaDtos = new();

                DiagnosticoCitaDtos.IdCita = DiagnosticoCitaSeleccionada.IdCita;
                DiagnosticoCitaDtos.IdEnfermedad = DiagnosticoCitaSeleccionada.IdEnfermedad;
                DiagnosticoCitaDtos.Detalle = DiagnosticoCitaSeleccionada.Detalle;

                ListaTodasLasDiagnosticoCitaDto.Add(DiagnosticoCitaDtos);
            }

            return ListaTodasLasDiagnosticoCitaDto;
        }

        // GET api/<DiagnosticoCitaController>/5
        [HttpGet("{id}")]
        public IActionResult Get(int id)
        {
            DiagnosticoCita DiagnosticoCitaSeleccionada = new();

            DiagnosticoCitaSeleccionada = ServicioDeDiagnosticoCita.SeleccionarPorId(id);

            if (DiagnosticoCitaSeleccionada.IdCita == 0)
            {
                return NotFound("DiagnosticoCita no encontrada");
            }

            DiagnosticoCitaDtos DiagnosticoCitaDtos = new();

            DiagnosticoCitaDtos.IdCita = DiagnosticoCitaSeleccionada.IdCita;
            DiagnosticoCitaDtos.IdEnfermedad = DiagnosticoCitaSeleccionada.IdEnfermedad;
            DiagnosticoCitaDtos.Detalle = DiagnosticoCitaSeleccionada.Detalle;

            return Ok(DiagnosticoCitaDtos);
        }

        // POST api/<DiagnosticoCitaController>
        [HttpPost]
        public IActionResult Post([FromBody] DiagnosticoCitaDtos DiagnosticoCitaDtos)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    DiagnosticoCita DiagnosticoCitaPorInsertar = new();

                    DiagnosticoCitaPorInsertar.IdCita = DiagnosticoCitaDtos.IdCita;
                    DiagnosticoCitaPorInsertar.IdEnfermedad = DiagnosticoCitaDtos.IdEnfermedad;
                    DiagnosticoCitaPorInsertar.CreadoPor = "jhonsp";

                    ServicioDeDiagnosticoCita.Insertar(DiagnosticoCitaPorInsertar);

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

        // PUT api/<DiagnosticoCitaController>/5
        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] DiagnosticoCitaDtos DiagnosticoCitaDtos)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    DiagnosticoCita DiagnosticoCitaPorActualizar = new();

                    DiagnosticoCitaPorActualizar.IdCita = DiagnosticoCitaDtos.IdCita;
                    DiagnosticoCitaPorActualizar.IdEnfermedad = DiagnosticoCitaDtos.IdEnfermedad;
                    DiagnosticoCitaPorActualizar.CreadoPor = "jhonsp";

                    ServicioDeDiagnosticoCita.Actualizar(DiagnosticoCitaPorActualizar);

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

        // DELETE api/<DiagnosticoCitaController>/5
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
