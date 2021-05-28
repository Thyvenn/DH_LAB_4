using System;
using System.Collections.Generic;

#nullable disable

namespace Wypozyczalnia.ScaffoldModel
{
    public partial class SlKatNosnika
    {
        public SlKatNosnika()
        {
            Tplyties = new HashSet<Tplyty>();
        }

        public int NosnikId { get; set; }
        public string Nazwa { get; set; }

        public virtual ICollection<Tplyty> Tplyties { get; set; }
    }
}
