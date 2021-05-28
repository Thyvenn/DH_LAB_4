﻿using System;
using System.Collections.Generic;

#nullable disable

namespace Wypozyczalnia.ScaffoldModel
{
    public partial class Twypozyczenium
    {
        public int WypozyczenieId { get; set; }
        public int KlientId { get; set; }
        public int PlytyId { get; set; }
        public DateTime DataWydania { get; set; }
        public DateTime? DataZwrotu { get; set; }

        public virtual Tklienci Klient { get; set; }
        public virtual Tplyty Plyty { get; set; }
    }
}
