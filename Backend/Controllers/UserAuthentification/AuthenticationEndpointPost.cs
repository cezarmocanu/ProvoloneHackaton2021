using Hackathon.Contract.Authentication;
using InternshippClass.Models.Dtos;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Provolone.Contracts.DataAccess;
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
        private readonly IAuthenticationManager AuthenticationManager;
        private readonly IUserDataAccess UserDataAccess;

        public AuthenticationEndpointPost(IAuthenticationManager testTableManager, IUserDataAccess userDataAccess)
        {
            this.AuthenticationManager = testTableManager;
            this.UserDataAccess = userDataAccess;
        }

        [HttpPost]
        public async Task<IActionResult> Handle([FromBody] AuthenticationEndpointGetRequest request, CancellationToken cancellationToken = default)
        {
            if (request == null)
            {
                return BadRequest();
            }

            var token = await AuthenticationManager.GetToken(request.Username, request.Password);

            if(token == null)
            {
                return Unauthorized();
            }

            return Ok(new AuthenticationEndpointGetResponse
            {
                Token = token,
                UserDetails = await UserDataAccess.GetUserDetails(request.Username),
            }) ;
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

        public UserDetailsDto UserDetails { get; set; }
    }
}
