using Hackathon.Contract.Authentication;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Provolone.Contracts.DataAccess;
using Provolone.Dtos;
using Swashbuckle.AspNetCore.Annotations;
using System;
using System.Collections.Generic;
using System.Net;
using System.Threading;
using System.Threading.Tasks;

namespace Provolone.Controllers.UserAuthentification
{
    [Route("api/register")]
    [AllowAnonymous]
    public class RegisterEndpointPost : Controller
    {
        private readonly IAuthenticationManager authenticationManager;

        public RegisterEndpointPost(IAuthenticationManager testTableManager)
        {
            this.authenticationManager = testTableManager;
        }

        [HttpPost]
        [SwaggerOperation(
           Summary = "Register",
           Description = "Register",
           OperationId = "Register.Register",
           Tags = new[] { "Register" })
        ]
        public async Task<IActionResult> Handle([FromBody] RegisterEndpointPostRequest request, CancellationToken cancellationToken = default)
        {
            if (request == null)
            {
                return BadRequest();
            }

            var token = await authenticationManager.AddUserAsync(request);

            if (token == null)
            {
                return Unauthorized();
            }

            return Ok(new RegisterEndpointPostResponse
            {
                Data = token
            });
        }

        public partial class RegisterEndpointPostRequest : UserRegisterDto
        {
        }

        public partial class RegisterEndpointPostResponse
        {
            public UserRegisterDto Data;
        }
    }
}
