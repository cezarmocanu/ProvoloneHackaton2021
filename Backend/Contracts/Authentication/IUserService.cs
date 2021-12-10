using Provolone.Dtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Hackathon.Contract
{
    public interface IUserService
    {
        bool IsValidUserInformation(string user, string password);
        UserAccessDto GetUserDetails();
    }
}
