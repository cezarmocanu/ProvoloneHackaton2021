using Hackathon.Contract.Authentication;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Swashbuckle.AspNetCore.Annotations;
using System;
using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;

namespace Hackathon.WebApi.Controllers
{
    [Route("api/login")]
    [AllowAnonymous]
    public class AuthenticationEndpointPost : Controller
    {
        private readonly IAuthenticationManager authenticationManager;

        public AuthenticationEndpointPost(IAuthenticationManager testTableManager)
        {
            this.authenticationManager = testTableManager;
        }
        [HttpPost]
        [SwaggerOperation(
           Summary = "Login",
           Description = "Login using username and password",
           OperationId = "Login.Login",
           Tags = new[] { "Login" })
        ]
        public AuthenticationEndpointGetResponse Handle([FromBody] AuthenticationEndpointGetRquest request, CancellationToken cancellationToken = default)
        {
            if (request == null)
            {
                throw new NotImplementedException();
            }
            return new AuthenticationEndpointGetResponse
            {
                Token = authenticationManager.GetToken(request.Username, request.Password),
            };
        }
    }

    public partial class AuthenticationEndpointGetRquest
    {
        public string Username { get; set; }

        public string Password { get; set; }
    }

    public partial class AuthenticationEndpointGetResponse
    {
        public string Token { get; set; }
    }
}
