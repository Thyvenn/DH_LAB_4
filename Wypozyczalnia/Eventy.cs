using System;
using System.Windows.Forms;


namespace Wypozyczalnia
{
    public partial class RentialClients : Form
    {

        //_____________________________________________
        // Przyciski, texboxy itp. (Strona z Eventami wygenerowanymi)
        //---------------------------------------------

        //Button łączenia z Bazą
        private void BaseConnect_Click(object sender, EventArgs e)
        {
            ConnectingToDB();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            //łaczy
            ConnectingToDB();

            //insertuje
            InsertTextboxes();

            //refreszuje grida po insercie 
            RefreshGrid();

            //czyści
            WipeTexboxes();
        }

        //anulowanie wpisywania
        private void Cancel_Click(object sender, EventArgs e)
        {
            WipeTexboxes();
        }

        private void Delete_btn_Click(object sender, EventArgs e)
        {
            DeleteConfirmation();
        }

        // Tutaj Button z usuwaniem się pojawia kiedy zaznaczymy rekordy
        private void dataGridView1_SelectionChanged(object sender, EventArgs e)
        {
            UpdateDeleteButton();
        }


        //checkbox
        private void checkBox1_CheckedChanged(object sender, EventArgs e)
        {
            RefreshGrid();
        }


         /*
            Formularz dodawania Klienta, pola wymagane 
            (potrzebne do częściowej walidacji, aby nie wporowadzić przez przypadek nowego klienta. 
             Do momentu "odwiedzenia" wymaganych pól dodawanie jest szare)
         */

        // Imie
        private void textBox1_Enter(object sender, EventArgs e)
        {
            goodToGo[0] = true;
            CheckGoodToGo();
        }

        // Nazwisko  
        private void textBox2_Enter(object sender, EventArgs e)
        {
            goodToGo[1] = true;
            CheckGoodToGo();
        }

        // Adres (4 nastepne)  
        private void textBox3_Enter(object sender, EventArgs e)
        {
            goodToGo[2] = true;
            CheckGoodToGo();
        }

        private void textBox4_Enter(object sender, EventArgs e)
        {
            goodToGo[3] = true;
            CheckGoodToGo();
        }

        private void textBox5_Enter(object sender, EventArgs e)
        {
            goodToGo[4] = true;
            CheckGoodToGo();
        }

        private void textBox6_Enter(object sender, EventArgs e)
        {
            goodToGo[5] = true;
            CheckGoodToGo();
        }
        //----------------------------------
        //__________________________________



    }
}
