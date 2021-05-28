using System;
using System.Collections.Generic;

#nullable disable

namespace Wypozyczalnia.ScaffoldModel
{
    public partial class Slpowod
    {
        public Slpowod()
        {
            TusunieciaPlyts = new HashSet<TusunieciaPlyt>();
        }

        public int PowodId { get; set; }
        public string Nazwa { get; set; }

        public virtual ICollection<TusunieciaPlyt> TusunieciaPlyts { get; set; }
    }
}
