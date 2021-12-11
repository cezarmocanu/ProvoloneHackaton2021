using InternshippClass.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Provolone.Domains.Entities
{
    public class User
    {
        public User()
        {
            UsersToVocationalGroups = new HashSet<UserToVocationalGroup>();
        }

        public int Id { get; set; }

        public string Email { get; set; }

        public string Password { get; set; }

        public string FirstName { get; set; }

        public string Lastname { get; set; }

        public string Username { get; set; }

        public long? RoleId { get; set; }

        public virtual Role? Role { get; set; }

        public virtual Discipline Discipline { get; set; }

        public virtual ICollection<UserToVocationalGroup> UsersToVocationalGroups { get; set; }
    }
}
