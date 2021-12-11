using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace InternshippClass.Models.Entities
{
    public class Mark
    {
        public long Id { get; set; }

        public int Value { get; set; }

        public DateTime Date { get; set; }

        public virtual Learner Learner { get; set; }

        public virtual Discipline Discipline { get; set; }
    }
}
