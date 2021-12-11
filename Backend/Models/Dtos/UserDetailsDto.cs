using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace InternshippClass.Models.Dtos
{
    public class UserDetailsDto
    {
        public int Id { get; set; }

        public string Email { get; set; }

        public string FirstName { get; set; }

        public string Lastname { get; set; }

        public string Username { get; set; }

        public string Role { get; set; }

        public IEnumerable<string> Permissions { get; set; }
    }
}
