using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace InternshippClass.Models.Entities
{
    public class GroupToDiscipline
    {
        public long Id { get; set; }

        public long VocationalGroupId { get; set; }

        public long DisciplineId { get; set; }

        public virtual VocationalGroup VocationalGroup { get; set; }

        public virtual Discipline Discipline { get; set; }
    }
}
