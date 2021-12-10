using Hackathon.Contract;
using Provolone.Dtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Heckathon.Authentication
{
    public class UserService : IUserService
    {
        public UserAccessDto GetUserDetails()
        {
            //TODO: get real user details
            return new UserAccessDto { Username = "Jay", Password = "123456" };
        }

        public bool IsValidUserInformation(string user, string password)
        {
            // TODO: get from db
            if (user.Equals("Jay") && password.Equals("123456")) return true;
            else return false;
        }
    }
}
