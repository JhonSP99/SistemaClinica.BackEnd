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
    public class MedicamentoCitasController : ControllerBase
    {
        private readonly IMedicamentoCitasServices ServicioDeMedicamentoCitas;
        public MedicamentoCitasController(MedicamentosCitasServices MedicamentoCitasService)
        {
            ServicioDeMedicamentoCitas = MedicamentoCitasService;
        }
        // GET: api/<CitaController>
        [HttpGet]
        public List<MedicamentoCitasDtos> Get()
        {
            List<MedicamentosCitas> ListaTodasLasMedicamentoCitas = ServicioDeMedicamentoCitas.SeleccionarTodos();

            List<MedicamentoCitasDtos> ListaTodasLasMedicamentoCitasDto = new();

            foreach (var MedicamentoCitasSeleccionada in ListaTodasLasMedicamentoCitas)
            {
                MedicamentoCitasDtos MedicamentoCitasDtos = new();

                MedicamentoCitasDtos.IdCita = MedicamentoCitasSeleccionada.IdCita;
                MedicamentoCitasDtos.IdMedicamento = MedicamentoCitasSeleccionada.IdMedicamento;
               

                ListaTodasLasMedicamentoCitasDto.Add(MedicamentoCitasDtos);
            }

            return ListaTodasLasMedicamentoCitasDto;
        }

        // GET api/<CitaController>/5
        [HttpGet("{id}")]
        public IActionResult Get(int id)
        {
            MedicamentosCitas MedicamentosCitasSeleccionada = new();

            MedicamentosCitasSeleccionada = ServicioDeMedicamentoCitas.SeleccionarPorId(id);

            if (MedicamentosCitasSeleccionada.IdCita == 0)
            {
                return NotFound("MedicamentosCitas no encontrada");
            }

            MedicamentoCitasDtos MedicamentoCitasDtos = new();

            MedicamentoCitasDtos.IdCita = MedicamentosCitasSeleccionada.IdCita;
            MedicamentoCitasDtos.IdMedicamento = MedicamentosCitasSeleccionada.IdMedicamento;

            return Ok(MedicamentoCitasDtos);
        }

        // POST api/<CitaController>
        [HttpPost]
        public IActionResult Post([FromBody] MedicamentoCitasDtos MedicamentoCitasDtos)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    MedicamentosCitas MedicamentosCitasPorInsertar = new();

                    MedicamentosCitasPorInsertar.IdCita = MedicamentoCitasDtos.IdCita;
                    MedicamentosCitasPorInsertar.IdMedicamento = MedicamentoCitasDtos.IdMedicamento;
                    MedicamentosCitasPorInsertar.CreadoPor = "jhonsp";

                    ServicioDeMedicamentoCitas.Insertar(MedicamentosCitasPorInsertar);

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
        public IActionResult Put(int id, [FromBody] MedicamentoCitasDtos MedicamentoCitasDtos)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    MedicamentosCitas MedicamentosCitasPorActualizar = new();

                    MedicamentosCitasPorActualizar.IdCita = MedicamentoCitasDtos.IdCita;
                    MedicamentosCitasPorActualizar.IdMedicamento = MedicamentoCitasDtos.IdMedicamento;
                    MedicamentosCitasPorActualizar.CreadoPor = "jhonsp";

                    ServicioDeMedicamentoCitas.Actualizar(MedicamentosCitasPorActualizar);

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
