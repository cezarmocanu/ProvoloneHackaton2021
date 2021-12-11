using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace InternshippClass.Models.Entities
{
    public class Learner
    {
        public Learner()
        {
            Marks = new HashSet<Mark>();
        }
        public long Id { get; set; }

        public string FirstName { get; set; }

        public string LastName { get; set; }

        public DateTime BirthDate { get; set; }

        public int Age { get; set; }

        public string Gender { get; set; }

        public string Institution { get; set; }

        public string Description { get; set; }

        public long MarkId { get; set; }

        public virtual ICollection<Mark> Marks { get; set; }
    }
}
