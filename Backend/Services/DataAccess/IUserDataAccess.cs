using InternshippClass.Models.Dtos;
using Provolone.Dtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Provolone.Contracts.DataAccess
{
    public interface IUserDataAccess
    {
        Task<bool> AddUserAsync(UserRegisterDto userDto);

        Task<bool> UserExistsAsync(string username, string password);

        Task<UserDetailsDto> GetUserDetails(string username);
    }
}
