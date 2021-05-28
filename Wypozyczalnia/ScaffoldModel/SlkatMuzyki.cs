using System;
using System.Collections.Generic;

#nullable disable

namespace Wypozyczalnia.ScaffoldModel
{
    public partial class SlkatMuzyki
    {
        public SlkatMuzyki()
        {
            Tplyties = new HashSet<Tplyty>();
        }

        public int KategoriaId { get; set; }
        public string Nazwa { get; set; }

        public virtual ICollection<Tplyty> Tplyties { get; set; }
    }
}
