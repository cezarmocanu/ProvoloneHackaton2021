using Hackathon.Contract.Authentication;
using Provolone.Contracts.DataAccess;
using Provolone.Dtos;
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

        public async Task<string> GetToken(string user, string password)
        {
            return await AuthenticationToken.GenerateJwtTokenAsync(user, password);
        }

        public async Task<bool> AddUserAsync(UserRegisterDto user)
        {
            return await UserDataAccess.AddUserAsync(user);
        }
    }
}
