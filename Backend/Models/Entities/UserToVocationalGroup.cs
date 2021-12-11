using Provolone.Domains.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace InternshippClass.Models.Entities
{
    public class UserToVocationalGroup
    {
        public long Id { get; set; }

     /*   public long UserId { get; set; }

        public long VocationalGroupId { get; set; }*/

        public virtual User User { get; set; }

        public virtual VocationalGroup VocationalGroup { get; set; }
    }
}
