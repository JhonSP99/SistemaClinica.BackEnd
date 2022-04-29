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
    public class EnfermedadController : ControllerBase
    {
        private readonly IEnfermedadServices ServicioDeEnfermedad;
        public EnfermedadController(EnfermedadServices EnfermedadService)
        {
            ServicioDeEnfermedad = EnfermedadService;
        }
        // GET: api/<CitaController>
        [HttpGet]
        public List<EnfermedadDtos> Get()
        {
            List<Enfermedad> ListaTodasLasEnfermedad = ServicioDeEnfermedad.SeleccionarTodos();

            List<EnfermedadDtos> ListaTodasLasEnfermedadDto = new();

            foreach (var EnfermedadSeleccionada in ListaTodasLasEnfermedad)
            {
                EnfermedadDtos EnfermedadDtos = new();

                EnfermedadDtos.IdEnfermedad = EnfermedadSeleccionada.IdEnfermedad;
                EnfermedadDtos.Nombre = EnfermedadSeleccionada.Nombre;

                ListaTodasLasEnfermedadDto.Add(EnfermedadDtos);
            }

            return ListaTodasLasEnfermedadDto;
        }

        // GET api/<CitaController>/5
        [HttpGet("{id}")]
        public IActionResult Get(int id)
        {
            Enfermedad EnfermedadSeleccionada = new();

            EnfermedadSeleccionada = ServicioDeEnfermedad.SeleccionarPorId(id);

            if (EnfermedadSeleccionada.IdCita == 0)
            {
                return NotFound("Enfermedad no encontrada");
            }

            EnfermedadDtos EnfermedadDtos = new();

            EnfermedadDtos.IdEnfermedad = EnfermedadSeleccionada.IdEnfermedad;
            EnfermedadDtos.Nombre = EnfermedadSeleccionada.Nombre;

            return Ok(EnfermedadDtos);
        }

        // POST api/<CitaController>
        [HttpPost]
        public IActionResult Post([FromBody] EnfermedadDtos EnfermedadDtos)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    Enfermedad EnfermedadPorInsertar = new();

                    EnfermedadPorInsertar.IdEnfermedad = EnfermedadDtos.IdEnfermedad;
                    EnfermedadPorInsertar.Nombre = EnfermedadDtos.Nombre;
                    EnfermedadPorInsertar.CreadoPor = "jhonsp";

                    ServicioDeEnfermedad.Insertar(EnfermedadPorInsertar);

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
        public IActionResult Put(int id, [FromBody] EnfermedadDtos EnfermedadDtos)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    Enfermedad EnfermedadPorActualizar = new();

                    EnfermedadPorActualizar.IdEnfermedad = EnfermedadDtos.IdEnfermedad;
                    EnfermedadPorActualizar.Nombre = EnfermedadDtos.Nombre;
                    EnfermedadPorActualizar.CreadoPor = "jhonsp";

                    ServicioDeEnfermedad.Actualizar(EnfermedadPorActualizar);

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
