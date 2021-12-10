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
    [Route("api/{username}/{password}/login")]
    [AllowAnonymous]
    public class AuthenticationEndpointGet : Controller
    {
        private readonly IAuthenticationManager authenticationManager;

        public AuthenticationEndpointGet(IAuthenticationManager testTableManager)
        {
            this.authenticationManager = testTableManager;
        }
        [HttpGet("")]
        [SwaggerOperation(
           Summary = "Lists Test",
           Description = "Lists Test",
           OperationId = "Test.ListTest",
           Tags = new[] { "Test" })
        ]
        public AuthenticationEndpointGetResponse Handle(AuthenticationEndpointGetRquest request, CancellationToken cancellationToken = default)
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
        [FromRoute(Name = "username")]
        public string Username { get; set; }

        [FromRoute(Name = "password")]
        public string Password { get; set; }
    }

    public partial class AuthenticationEndpointGetResponse
    {
        public string Token { get; set; }
    }
}
