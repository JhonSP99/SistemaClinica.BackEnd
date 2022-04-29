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
    public class ClinicaController : ControllerBase
    {
        private readonly IClinicaServices ServicioDeClinica;
        public ClinicaController(ClinicaServices ClinicaService)
        {
            ServicioDeClinica = ClinicaService;
        }
        // GET: api/<ClinicaController>
        [HttpGet]
        public List<ClinicaDtos> Get()
        {
            List<Clinica> ListaTodasLasClinica = ServicioDeClinica.SeleccionarTodos();

            List<ClinicaDtos> ListaTodasLasClinicaDtos = new();

            foreach (var ClinicaSeleccionada in ListaTodasLasClinica)
            {
                ClinicaDtos ClinicaDtos = new();

                ClinicaDtos.IdClinica = ClinicaSeleccionada.IdClinica;
                ClinicaDtos.Nombre = ClinicaSeleccionada.Nombre;
                ClinicaDtos.Lugar = ClinicaSeleccionada.Lugar;

                ListaTodasLasClinicaDtos.Add(ClinicaDtos);
            }

            return ListaTodasLasClinicaDtos;
        }

        // GET api/<ClinicaController>/5
        [HttpGet("{id}")]
        public IActionResult Get(int id)
        {
            Clinica ClinicaSeleccionada = new();

            ClinicaSeleccionada = ServicioDeClinica.SeleccionarPorId(id);

            if (ClinicaSeleccionada.IdClinica == 0)
            {
                return NotFound("Clinica no encontrada");
            }

            ClinicaDtos ClinicaDtos = new();

            ClinicaDtos.IdClinica = ClinicaSeleccionada.IdClinica;
            ClinicaDtos.Nombre = ClinicaSeleccionada.Nombre;
            ClinicaDtos.Lugar = ClinicaSeleccionada.Lugar;

            return Ok(ClinicaDtos);
        }

        // POST api/<ClinicaController>
        [HttpPost]
        public IActionResult Post([FromBody] ClinicaDtos ClinicaDtos)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    Clinica ClinicaPorInsertar = new();

                    ClinicaPorInsertar.IdClinica = ClinicaDtos.IdClinica;
                    ClinicaPorInsertar.Nombre = ClinicaDtos.Nombre;
                    ClinicaPorInsertar.CreadoPor = "jhonsp";

                    ServicioDeClinica.Insertar(ClinicaPorInsertar);

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

        // PUT api/<ClinicaController>/5
        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] ClinicaDtos ClinicaDtos)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    Clinica ClinicaPorActualizar = new();

                    ClinicaPorActualizar.IdClinica = ClinicaDtos.IdClinica;
                    ClinicaPorActualizar.Nombre = ClinicaDtos.Nombre;
                    ClinicaPorActualizar.CreadoPor = "jhonsp";

                    ServicioDeClinica.Actualizar(ClinicaPorActualizar);

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

        // DELETE api/<ClinicaController>/5
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
