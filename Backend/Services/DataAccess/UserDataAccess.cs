using InternshippClass.Data;
using InternshippClass.Models.Dtos;
using InternshippClass.Services.Mappings;
using Microsoft.EntityFrameworkCore;
using Provolone.Contracts.DataAccess;
using Provolone.Domains.Entities;
using Provolone.Dtos;
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

        public async Task<bool> AddUserAsync(UserRegisterDto userDto)
        {
            if(dbContext.Users.Any(u => u.Email == userDto.Email || u.Username == userDto.Username))
            {
                return false;
            }

            var newUser = new User()
            {
                FirstName = userDto.FirstName,
                Lastname = userDto.Lastname,
                Username = userDto.Username,
                Email = userDto.Email,
                Password = userDto.Password,
            };

            dbContext.Users.Add(newUser);
            return await dbContext.SaveChangesAsync() > 0;
        }

        public async Task<bool> UserExistsAsync(string username, string password)
        {
            if(await dbContext.Users.AnyAsync(u => u.Username == username && u.Password == password))
            {
                return true;
            }

            return false;
        }

        public async Task<UserDetailsDto> GetUserDetails(string username)
        {
            var user = await dbContext.Users
                .Include(u => u.Role)
                .SingleAsync(u => u.Username.Equals(username));

            return UserMapping.MapList(user);
        }
    }
}
