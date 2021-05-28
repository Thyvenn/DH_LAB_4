using System;
using System.Drawing;
using System.Linq;
using System.Windows.Forms;
using Wypozyczalnia.ScaffoldModel;

namespace Wypozyczalnia
{
    public partial class RentialClients : Form
    {
        public RentialClients()
        {
            InitializeComponent();
        }

        //_____________________________________________
        // Własne funkcje i zmienne (w drugim partialu są eventy)
        //---------------------------------------------


        // Łaczenie z bazą 
        BlockbusterContext glob_db;

        private void ConnectingToDB()
        {
            glob_db = new BlockbusterContext();

            if (glob_db.Database.CanConnect() == true)
            {
                //label ze statusem połaczenia
                isOnline.Text = "Połaczenie z Bazą: Online";
                isOnline.ForeColor = Color.DarkGreen;
                BaseConnect.Enabled = false;

                RefreshGrid();

            }
            else
            {
                isOnline.Text = "Połaczenie z Bazą: Wystąpił Problem";
            }
        }

        // Funkcja do odświerzania zawartości w gridzie
        private void RefreshGrid()
        {
            dataGridView1.DataSource = glob_db.Tkliencis.ToList();

           
            this.dataGridView1.Columns["KlientID"].Visible = false;
            this.dataGridView1.Columns["Status"].Visible = false;
            this.dataGridView1.Columns["Twypozyczenia"].Visible = false;

            //foreach po wszystkich wierszach
            foreach (DataGridViewRow row in dataGridView1.Rows)
            {
                //jeżeli status == 0 to ukrywam wiersz pod warunkiem że checkbox jest odznaczony
                if ((int)row.Cells["Status"].Value == 0 && (checkBox1.Checked == false) )
                {
                  row.Visible = false;
                }
            }
            glob_db.SaveChanges();
        }

        // Usuwanie danych
             /*
                 (dane klientów nie są usuwane ale przy pomocy statusu ukrywane,
                  docelowo usuwany klient będzie anonimizowany zgodnie z RODO
             */
        private void DeleteSelected()
        {

            // int przechowujący ilośc wybranych wierszy
            int selectedRowCount = dataGridView1.Rows.GetRowCount(DataGridViewElementStates.Selected);
           
                for (int i = 0; i < selectedRowCount; i++)
                {
                    // Wyciaganie obiektu klienta z datagrid-a
                    Tklienci klientRow = (Tklienci)this.dataGridView1.SelectedRows[i].DataBoundItem;
                    klientRow.Status = 0;
                    klientRow.DataUsuniecia = DateTime.Now;
                }
                glob_db.SaveChanges();
        }

        void DeleteConfirmation()
        {
            // MessegeBox do potwierdzenia usuniecia 
            DialogResult dialogResult = MessageBox.Show("Czy na pewno chcesz usunąć wybrane rekordy? ", "Usuwanie", MessageBoxButtons.YesNo);
            if (dialogResult == DialogResult.Yes)
            {
                // "usuwanie"
                DeleteSelected();

                // refreszuje grida po insercie 
                RefreshGrid();

            }
        }

        void UpdateDeleteButton()
        {
            int selectedRowCount = dataGridView1.Rows.GetRowCount(DataGridViewElementStates.Selected);
            if (selectedRowCount > 0) Delete_btn.Enabled = true;
            else  Delete_btn.Enabled = false;
        }


        // Czytanie danych z texboxów i insertowanie do Bazy
        private void InsertTextboxes()
        {
            string ins_Name = textBox1.Text;
            string ins_LastName = textBox2.Text;
            string ins_AdressStreet = textBox3.Text;
            string ins_AdressNr = textBox4.Text;
            string ins_AdressPostal = textBox5.Text;
            string ins_AdressCity = textBox6.Text;
            string ins_Telephone = textBox7.Text;
            string ins_Email = textBox8.Text;
            DateTime ins_dataDodania = DateTime.Now;
            int ins_Status = 1;

            glob_db.Tkliencis.Add(new Tklienci { Imie = ins_Name, Nazwisko = ins_LastName, AdrUlica = ins_AdressStreet, AdrNr = ins_AdressNr, AdrKod = ins_AdressPostal, AdrMsc = ins_AdressCity, Telefon = ins_Telephone, Email = ins_Email, DataDodania = ins_dataDodania, Status = ins_Status });
            glob_db.SaveChanges();

            MessageBox.Show("Dodano Klienta", "Sukces");
        }


        // Tablica booleanow potrzebna do walidacji: "Czy każdy not null-owy textbox został odwiedzony",
        // w partialu z eventami przy "odwiedzeniu pola" zamienia jest wartość w tablicy

        bool[] goodToGo = new bool[6];

        // Czyszczenie textboxów
        void WipeTexboxes()
        {
            textBox1.Clear();
            textBox2.Clear();
            textBox3.Clear();
            textBox4.Clear();
            textBox5.Clear();
            textBox6.Clear();
            textBox7.Clear();
            textBox8.Clear();

            // Zerowanie tablicy
            for (int i = 0; i < 6; i++) goodToGo[i] = false;
            Add.Enabled = false;
        }

        void CheckGoodToGo()
        {
         
            // Kiedy cała tablica bedzie ustawiona na 1, to odblokuje się opcja dodawania rekordu
            if (goodToGo.Contains(false) == false)
            {
              Add.Enabled = true;
            }   
            
        }

     


    }


}

