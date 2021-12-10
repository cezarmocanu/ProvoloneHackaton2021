using Hackathon.Contract.Authentication;
using Microsoft.AspNetCore.Mvc;
using Provolone.Contracts.DataAccess;
using Provolone.Dtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Hackathon.Manager
{
    public class AuthenticationManager : IAuthenticationManager
    {
        private readonly IAuthenticationToken AuthenticationToken;
        private readonly IUserDataAccess UserDataAccess;

        public AuthenticationManager(IAuthenticationToken authenticationToken, IUserDataAccess userDataAccess)
        {
            this.AuthenticationToken = authenticationToken;
            this.UserDataAccess = userDataAccess;
        }

        public string GetToken(string user, string password)
        {
            return AuthenticationToken.GenerateJwtToken(user, password);
        }

        public async Task<UserRegisterDto> AddUserAsync(UserRegisterDto user)
        {
            return await UserDataAccess.AddUserAsync(user);
        }
    }
}
