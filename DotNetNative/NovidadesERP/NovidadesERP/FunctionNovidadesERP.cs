using System;
using System.IO;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Azure.WebJobs;
using Microsoft.Azure.WebJobs.Extensions.Http;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;
using System.Net.Http;
using System.Net;
using System.Text;
using System.Xml.Linq;
using System.Collections.Generic;

namespace NovidadesERP
{
    public static class FunctionNovidadesERP
    {

        private static readonly Dictionary<string, string> atualizacoes = new Dictionary<string, string>
        {
            { "Relatórios", "Adicionados multiplos filtros" },
            { "Dashboards", "Consolidação dos totalizadores filtrados" },
            { "Boletos", "Funcionalidade de pagamento por PIX" }
        };

        public static bool validaLicenca(string key)
        {
            return key.IndexOf("96cd") > 0;
        }

        [FunctionName("NovidadesERP")]
        public static async Task<IActionResult> Run(
            [HttpTrigger(AuthorizationLevel.Function, "post", Route = null)] HttpRequest req,
            ILogger log)
        {
            log.LogInformation("Request - HTTP");
          
            string requestBody = await new StreamReader(req.Body).ReadToEndAsync();
            dynamic data = JsonConvert.DeserializeObject(requestBody);
            string appKey = req.Headers["app-key"];
            appKey = appKey ?? data?.appKey;

            string responseMessage = string.IsNullOrEmpty(appKey)
               ? "Sistema/Licença não localizados"
               : "1 nova atualização disponível";

            var objResp = new { 
                 sistema = "Controle de Updates by Azure", 
                licencaAtiva = validaLicenca(appKey), 
                status = responseMessage, 
                atualizacoes = atualizacoes
            };
            return new JsonResult(objResp);
        }
    }
}
