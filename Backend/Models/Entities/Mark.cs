using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace InternshippClass.Models.Entities
{
    public class Mark
    {
        public Mark()
        {
            Learners = new HashSet<Learner>();
            Disciplines = new HashSet<Discipline>();
        }

        public long Id { get; set; }

        public int Value { get; set; }

        public DateTime Date { get; set; }

        public long LearnerId { get; set; }

        public virtual ICollection<Learner> Learners { get; set; }

        public long DisciplineId { get; set; }

        public virtual ICollection<Discipline> Disciplines { get; set; }
    }
}
