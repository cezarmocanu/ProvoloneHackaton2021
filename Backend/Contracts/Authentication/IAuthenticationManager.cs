using Microsoft.AspNetCore.Mvc;
using Provolone.Dtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Hackathon.Contract.Authentication
{
    public interface IAuthenticationManager
    {
        string GetToken(string user, string password);

        Task<UserRegisterDto> AddUserAsync(UserRegisterDto user);
    }
}
