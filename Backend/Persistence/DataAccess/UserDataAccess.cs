using Provolone.Contracts.DataAccess;
using Provolone.Domains.Entities;
using Provolone.Dtos;
using Provolone.Persistence.HackathonContext;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Provolone.Persistence.DataAccess
{
    public class UserDataAccess : IUserDataAccess
    {
        private readonly ProvoloneContext dbContext;

        public UserDataAccess(ProvoloneContext dbContext)
        {
            this.dbContext = dbContext;
        }

        public async Task<UserRegisterDto> AddUserAsync(UserRegisterDto userDto)
        {
            var newUser = new User()
            {
                FirstName = userDto.FirstName,
                Lastname = userDto.Lastname,
                Username = userDto.Username,
                Email = userDto.Email,
                Password = userDto.Password,
            };
            dbContext.User.Add(newUser);
            await dbContext.SaveChangesAsync();

            userDto.Id = newUser.Id;
            return userDto;
        }
    }
}
