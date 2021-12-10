using Provolone.Dtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Provolone.Contracts.DataAccess
{
    public interface IUserDataAccess
    {
        Task<UserRegisterDto> AddUserAsync(UserRegisterDto userDto);
    }
}
