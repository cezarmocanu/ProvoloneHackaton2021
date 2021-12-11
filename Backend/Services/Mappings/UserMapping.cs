using InternshippClass.Models.Dtos;
using Provolone.Domains.Entities;
using Provolone.Dtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;

namespace InternshippClass.Services.Mappings
{
    public static class UserMapping
    {
        public static UserDetailsDto MapList(User user)
        {
            return new UserDetailsDto
            {
                Email = user.Email,
                FirstName = user.FirstName,
                Lastname = user.Lastname,
                Username = user.Username,
                Role = user.Role.Name,
                //Permissions = user.Role.Permissions.Select(p => p.Name),
            };
        }
    }
}