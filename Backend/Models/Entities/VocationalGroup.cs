using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace InternshippClass.Models.Entities
{
    public class VocationalGroup
    {
        public VocationalGroup()
        {
            Learners = new HashSet<Learner>();
            Disciplines = new HashSet<Discipline>();
        }

        public long Id { get; set; }

        public string Name { get; set; }

        public long UserId { get; set; }

        public long DisciplineId { get; set; }

        public virtual ICollection<Discipline> Disciplines { get; set; }

        public long LearnerId { get; set; }

        public virtual ICollection<Learner> Learners { get; set; }
    }
}
