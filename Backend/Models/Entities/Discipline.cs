using Provolone.Domains.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace InternshippClass.Models.Entities
{
    public class Discipline
    {
        public Discipline()
        {
            Users = new HashSet<User>();
            Marks = new HashSet<Mark>();
            GroupToDisciplines = new HashSet<GroupToDiscipline>();
        }

        public long Id { get; set; }

        public string Name { get; set; }

        public virtual ICollection<User> Users { get; set; }

        public virtual ICollection<Mark> Marks { get; set; }

        public virtual ICollection<GroupToDiscipline> GroupToDisciplines { get; set; }

        public virtual Field Field { get; set; }
    }
}
