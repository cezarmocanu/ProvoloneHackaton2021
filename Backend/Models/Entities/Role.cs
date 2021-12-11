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
            Permissions = new HashSet<Permission>();
        }

        public long Id { get; set; }

        public string Name { get; set; }

        public long PermissionId { get; set; }

        public virtual ICollection<Permission> Permissions { get; set; }
    }
}
