using System;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using Hackathon.Contract;
using Hackathon.Contract.Authentication;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;

namespace Heckathon.Authentication
{
    public class AuthenticationToken : IAuthenticationToken
    {
        private readonly IConfiguration Configuration;
        private readonly IUserService UserService;

        public AuthenticationToken(IConfiguration configuration, IUserService userService)
        {
            Configuration = configuration;
            UserService = userService;
        }

        public async Task<string> GenerateJwtTokenAsync(string userName, string password)
        {
            if (await UserService.IsValidUserInformationAsync(userName, password))
            {
                var tokenHandler = new JwtSecurityTokenHandler();
                var key = Encoding.ASCII.GetBytes(Configuration["Jwt:key"]);


                var tokenDescriptor = new SecurityTokenDescriptor
                {
                    Subject = new ClaimsIdentity(new[] { new Claim("id", userName) }),
                    Expires = DateTime.UtcNow.AddHours(1),
                    Issuer = Configuration["Jwt:Issuer"],
                    Audience = Configuration["Jwt:Audience"],
                    SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(key), SecurityAlgorithms.HmacSha256Signature)
                };


                var token = tokenHandler.CreateToken(tokenDescriptor);


                return tokenHandler.WriteToken(token);
            }
            return null;
        }
    }
}
