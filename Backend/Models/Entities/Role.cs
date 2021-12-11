﻿using Provolone.Domains.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace InternshippClass.Models.Entities
{
    public class Role
    {
        public long Id { get; set; }

        public string Name { get; set; }

        public virtual User Users { get; set; }
    }
}
