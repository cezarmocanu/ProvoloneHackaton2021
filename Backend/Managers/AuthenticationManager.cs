using Hackathon.Contract.Authentication;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Hackathon.Manager
{
    public class AuthenticationManager : IAuthenticationManager
    {
        private readonly IAuthenticationToken authenticationToken;

        public AuthenticationManager(IAuthenticationToken authenticationToken)
        {
            this.authenticationToken = authenticationToken;
        }
        public string GetToken(string user, string password)
        {
            return authenticationToken.GenerateJwtToken(user, password);
        }
    }
}
