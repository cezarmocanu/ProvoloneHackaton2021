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
            GroupToDisciplines = new HashSet<GroupToDiscipline>();
            UsersToVocationalGroups = new HashSet<UserToVocationalGroup>();
        }

        public long Id { get; set; }

        public string Name { get; set; }

        public long UserId { get; set; }

        public virtual ICollection<Learner> Learners { get; set; }

        public virtual ICollection<GroupToDiscipline> GroupToDisciplines { get; set; }
        public virtual ICollection<UserToVocationalGroup> UsersToVocationalGroups { get; set; }
    }
}
