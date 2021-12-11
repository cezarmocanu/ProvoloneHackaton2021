using Hackathon.Contract.Authentication;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Provolone.Dtos;
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
        public async Task<IActionResult> Handle([FromBody] RegisterEndpointPostRequest request, CancellationToken cancellationToken = default)
        {
            if (request == null)
            {
                return BadRequest();
            }

            var isAdded = await authenticationManager.AddUserAsync(request);

            if (isAdded == false)
            {
                return BadRequest();
            }

            return Ok(new RegisterEndpointPostResponse
            {
                IsAdded = isAdded,
            });
        }

        public partial class RegisterEndpointPostRequest : UserRegisterDto
        {
        }

        public partial class RegisterEndpointPostResponse
        {
            public bool IsAdded { get; set; }
        }
    }
}
