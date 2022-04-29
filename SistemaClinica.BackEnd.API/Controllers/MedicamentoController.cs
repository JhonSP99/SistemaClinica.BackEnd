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
    public class MedicamentoController : ControllerBase
    {
        private readonly IMedicamentoServices ServicioDeMedicamento;
        public MedicamentoController(MedicamentoServices MedicamentoService)
        {
            ServicioDeMedicamento = MedicamentoService;
        }
        // GET: api/<CitaController>
        [HttpGet]
        public List<MedicamentoDtos> Get()
        {
            List<Medicamento> ListaTodasLasMedicamento = ServicioDeMedicamento.SeleccionarTodos();

            List<MedicamentoDtos> ListaTodasLasMedicamentoDto = new();

            foreach (var MedicamentoSeleccionada in ListaTodasLasMedicamento)
            {
                MedicamentoDtos MedicamentoDtos = new();

                MedicamentoDtos.IdMedicamento = MedicamentoSeleccionada.IdMedicamento;
                MedicamentoDtos.Nombre = MedicamentoSeleccionada.Nombre;
                MedicamentoDtos.ModoAdministración = MedicamentoSeleccionada.ModoAdministración;

                ListaTodasLasMedicamentoDto.Add(MedicamentoDtos);
            }

            return ListaTodasLasMedicamentoDto;
        }

        // GET api/<CitaController>/5
        [HttpGet("{id}")]
        public IActionResult Get(int id)
        {
            Medicamento MedicamentoSeleccionada = new();

            MedicamentoSeleccionada = ServicioDeMedicamento.SeleccionarPorId(id);

            if (MedicamentoSeleccionada.IdMedicamento == 0)
            {
                return NotFound("Medicamento no encontrada");
            }

            MedicamentoDtos MedicamentoDtos = new();

            MedicamentoDtos.IdMedicamento = MedicamentoSeleccionada.IdMedicamento;
            MedicamentoDtos.Nombre = MedicamentoSeleccionada.Nombre;
            MedicamentoDtos.ModoAdministración = MedicamentoSeleccionada.ModoAdministración;

            return Ok(MedicamentoDtos);
        }

        // POST api/<CitaController>
        [HttpPost]
        public IActionResult Post([FromBody] MedicamentoDtos MedicamentoDtos)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    Medicamento MedicamentoPorInsertar = new();

                    MedicamentoPorInsertar.IdMedicamento = MedicamentoDtos.IdMedicamento;
                    MedicamentoPorInsertar.Nombre = MedicamentoDtos.Nombre;
                    MedicamentoPorInsertar.CreadoPor = "jhonsp";

                    ServicioDeMedicamento.Insertar(MedicamentoPorInsertar);

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
        public IActionResult Put(int id, [FromBody] MedicamentoDtos MedicamentoDtos)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    Medicamento MedicamentoPorActualizar = new();

                    MedicamentoPorActualizar.IdMedicamento = MedicamentoDtos.IdMedicamento;
                    MedicamentoPorActualizar.Nombre = MedicamentoDtos.Nombre;
                    MedicamentoPorActualizar.CreadoPor = "jhonsp";

                    ServicioDeMedicamento.Actualizar(MedicamentoPorActualizar);

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
