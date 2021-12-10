using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Provolone.Dtos
{
    public class UserRegisterDto
    {
        public int Id { get; set; }

        public string Email { get; set; }

        public string Password { get; set; }

        public string FirstName { get; set; }

        public string Lastname { get; set; }

        public string Username { get; set; }
    }
}
