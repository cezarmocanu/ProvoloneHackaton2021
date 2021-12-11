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
            Fields = new HashSet<Field>();
        }

        public long Id { get; set; }

        public string Name { get; set; }

        public long DisciplineId { get; set; }

        public virtual ICollection<Field> Fields { get; set; }
    }
}
