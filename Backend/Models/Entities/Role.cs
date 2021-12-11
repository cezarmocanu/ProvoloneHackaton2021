using Provolone.Domains.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace InternshippClass.Models.Entities
{
    public class Role
    {
        public Role()
        {
            PermissionsToRoles = new HashSet<PermissionsToRoles>();
        }

        public long Id { get; set; }

        public string Name { get; set; }

        public virtual User User { get; set; }

        public virtual ICollection<PermissionsToRoles> PermissionsToRoles { get; set; }
    }
}
