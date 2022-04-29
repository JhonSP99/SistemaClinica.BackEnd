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
    public class DoctorController : ControllerBase
    {
        private readonly IDoctorServices ServicioDeDoctor;

        public object ServicioDeCita { get; private set; }

        public DoctorController(DoctorServices DoctorService)
        {
            ServicioDeDoctor = DoctorService;
        }
        // GET: api/<DoctorController>
        [HttpGet]
        public List<DoctorDtos> Get()
        {
            List<Doctor> ListaTodasLasDoctor = ServicioDeDoctor.SeleccionarTodos();

            List<DoctorDtos> ListaTodasLasDoctorDto = new();

            foreach (var DoctorSeleccionada in ListaTodasLasDoctor)
            {
                DoctorDtos DoctorDtos = new();

                DoctorDtos.IdDoctor = DoctorSeleccionada.IdDoctor;
                DoctorDtos.Nombre = DoctorSeleccionada.Nombre;
                DoctorDtos.Apellidos = DoctorSeleccionada.Apellidos;

                ListaTodasLasDoctorDto.Add(DoctorDtos);
            }

            return ListaTodasLasDoctorDto;
        }

        // GET api/<DoctorController>/5
        [HttpGet("{id}")]
        public IActionResult Get(int id)
        {
            Doctor DoctorSeleccionada = new();

            DoctorSeleccionada = ServicioDeDoctor.SeleccionarPorId(id);

            if (DoctorSeleccionada.IdCita == 0)
            {
                return NotFound("Doctor no encontrada");
            }

            DoctorDtos DoctorDtos = new();

            DoctorDtos.IdDoctor = DoctorSeleccionada.IdDoctor;
            DoctorDtos.Nombre = DoctorSeleccionada.Nombre;
            DoctorDtos.Apellidos = DoctorSeleccionada.Apellidos;

            return Ok(DoctorDtos);
        }

        // POST api/<DoctorController>
        [HttpPost]
        public IActionResult Post([FromBody] DoctorDtos DoctorDtos)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    Doctor DoctorPorInsertar = new();

                    DoctorPorInsertar.IdDoctor = DoctorDtos.IdDoctor;
                    DoctorPorInsertar.Nombre = DoctorDtos.Nombre;
                    DoctorPorInsertar.CreadoPor = "jhonsp";

                    ServicioDeDoctor.Insertar(DoctorPorInsertar);

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

        // PUT api/<DoctorController>/5
        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] DoctorDtos DoctorDtos)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    Doctor DoctorPorActualizar = new();

                    DoctorPorActualizar.IdDoctor = DoctorDtos.IdDoctor;
                    DoctorPorActualizar.Nombre = DoctorDtos.Nombre;
                    DoctorPorActualizar.CreadoPor = "jhonsp";

                    ServicioDeDoctor.Actualizar(DoctorPorActualizar);

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

        // DELETE api/<DoctorController>/5
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
