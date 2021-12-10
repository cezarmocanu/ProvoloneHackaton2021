using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Hackathon.Contract.Authentication
{
    public interface IAuthenticationToken
    {
        string GenerateJwtToken(string userName, string password);
    }
}
