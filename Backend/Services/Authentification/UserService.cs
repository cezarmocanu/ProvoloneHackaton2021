using Hackathon.Contract;
using Provolone.Contracts.DataAccess;
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
        private readonly IUserDataAccess UserDataAcces;

        public UserService(IUserDataAccess userDataAccess)
        {
            this.UserDataAcces = userDataAccess;
        }

        public UserAccessDto GetUserDetails()
        {
            //TODO: get real user details
            return new UserAccessDto { Username = "Jay", Password = "123456" };
        }

        public async Task<bool> IsValidUserInformationAsync(string user, string password)
        {
            // TODO: get from db
            if (await UserDataAcces.UserExistsAsync(user,password)) return true;
            else return false;
        }
    }
}
