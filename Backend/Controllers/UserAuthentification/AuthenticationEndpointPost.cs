using Hackathon.Contract.Authentication;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Net;
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
        public async Task<IActionResult> Handle([FromBody] AuthenticationEndpointGetRequest request, CancellationToken cancellationToken = default)
        {
            if (request == null)
            {
                return BadRequest();
            }

            var token = await authenticationManager.GetToken(request.Username, request.Password);

            if(token == null)
            {
                return Unauthorized();
            }

            return Ok(new AuthenticationEndpointGetResponse
            {
                Token = token
            });
        }
    }

    public partial class AuthenticationEndpointGetRequest
    {
        public string Username { get; set; }

        public string Password { get; set; }
    }

    public partial class AuthenticationEndpointGetResponse
    {
        public string Token { get; set; }
    }
}
