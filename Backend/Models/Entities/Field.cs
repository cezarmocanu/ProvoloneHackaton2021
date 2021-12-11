using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace InternshippClass.Models.Entities
{
    public class Field
    {
        public Field()
        {
            Disciplines = new HashSet<Discipline>();
        }

        public long Id { get; set; }

        public string Name { get; set; }

        public virtual ICollection<Discipline> Disciplines { get; set; }
    }
}
