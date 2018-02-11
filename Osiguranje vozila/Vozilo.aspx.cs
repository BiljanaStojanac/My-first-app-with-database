using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Collections.Generic;

public partial class Vozilo : System.Web.UI.Page
{
    SqlConnection konekcija = new SqlConnection(WebConfigurationManager.ConnectionStrings["mojaKonekcija"].ConnectionString);


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {

            System.Collections.ArrayList VrstaVozila = vratiVrstuVozila();
            lstVrstaVozila.DataSource = VrstaVozila;
            this.DataBind();

            PopuniKlijenta();

            Dictionary<int, string> modalitet = new Dictionary<int, string>();
            modalitet.Add(1, "10");
            modalitet.Add(2, "20");
            modalitet.Add(3, "30");
            rblModalitet.DataSource = modalitet;
            rblModalitet.DataTextField = "Value";
            rblModalitet.DataValueField = "Key";
            rblModalitet.DataBind();


        }
    }
    protected void chbKasko_CheckedChanged(object sender, EventArgs e)
    {
        lblModalitet.Visible = true;
        rblModalitet.Visible = true;
    }

    private void PopuniKlijenta()
    {
        SqlCommand komanda = new SqlCommand();
        komanda.Connection = konekcija;
        komanda.CommandText = "SELECT id_klijenta, Ime, Prezime, Naziv_preduzeca FROM Klijent";

        ddlKorisnik.Items.Clear();

        try
        {
            konekcija.Open();
            SqlDataReader CitacKorisnik;
            CitacKorisnik = komanda.ExecuteReader();
            while (CitacKorisnik.Read())
            {
                ListItem StavkaKorisnik = new ListItem();
                StavkaKorisnik.Text = CitacKorisnik["Ime"] + " " + CitacKorisnik["Prezime"] + " " + CitacKorisnik["Naziv_preduzeca"];
                StavkaKorisnik.Value = CitacKorisnik["id_klijenta"].ToString();
                ddlKorisnik.Items.Add(StavkaKorisnik);
            }
            CitacKorisnik.Close();
        }

        catch (Exception exc)
        {
            lblGreska.Text = exc.Message;
        }

        finally
        {
            konekcija.Close();
        }
    }

    protected void VoziloW_PreviousButtonClick(object sender, WizardNavigationEventArgs e)
    {

    }

    protected void VoziloW_NextButtonClick(object sender, WizardNavigationEventArgs e)
    {
        if (txtBrojSasije.Text == "" || txtRegistracija.Text == "" || txtModel.Text == "" || txtSnagaMot.Text == "" || txtBoja.Text == "" || txtGodiste.Text == "" || txtVrstaGoriva.Text == "")
        {
            e.Cancel = true; //ovo se navodi kako bi se program ovde zadrzao
        }

    }

    protected void VoziloW_FinishButtonClick(object sender, WizardNavigationEventArgs e)
    {
        if (DateTime.Parse(txtDatSklPol.Text) < DateTime.Parse(txtDatIstPol.Text))

        {
            //Label1.Text = "Datum sklapanja polise ne moze da bude veci od datuma isteka polise!";
            ValidationSummary1.Visible = true;
            konekcija.Open();
            string naredbaVozilo = "INSERT INTO vozilo (broj_sasije, registarski_broj, vrsta_vozila, Model, snaga_motora, boja, vrsta_goriva, godina_proizvodnje)VALUES(@broj_sasije, @registarski_broj, @vrsta_vozila, @Model, @snaga_motora, @boja, @vrsta_goriva, @godina_proizvodnje)";

            SqlCommand kom = new SqlCommand(naredbaVozilo, konekcija);

            kom.Parameters.AddWithValue("@broj_sasije", txtBrojSasije.Text);
            kom.Parameters.AddWithValue("@registarski_broj", txtRegistracija.Text);
            kom.Parameters.AddWithValue("@vrsta_vozila", lstVrstaVozila.SelectedItem.Text);
            kom.Parameters.AddWithValue("@Model", txtModel.Text);
            kom.Parameters.AddWithValue("@snaga_motora", int.Parse(txtSnagaMot.Text));
            kom.Parameters.AddWithValue("@boja", txtBoja.Text);
            kom.Parameters.AddWithValue("@vrsta_goriva", txtVrstaGoriva.Text);
            kom.Parameters.AddWithValue("@godina_proizvodnje", int.Parse(txtGodiste.Text));

            string naredbaPolisa = "INSERT INTO polisa_osiguranja (ID_polise, broj_sasije, datum_sklapanja, datum_isteka, modalitet, premija, id_klijenta) VALUES (@ID_polise, @broj_sasije, @datum_sklapanja, @datum_isteka, @modalitet, @premija, @id_klijenta)";
            SqlCommand kom2 = new SqlCommand(naredbaPolisa, konekcija);


            kom2.Parameters.AddWithValue("@ID_polise", int.Parse(txtPolisa.Text));
            kom2.Parameters.AddWithValue("@broj_sasije", txtBrojSasije.Text);
            kom2.Parameters.AddWithValue("@datum_sklapanja", DateTime.Parse(txtDatSklPol.Text));
            kom2.Parameters.AddWithValue("@datum_isteka", DateTime.Parse(txtDatIstPol.Text));


            if (chbKasko.Checked)
            {

                kom2.Parameters.AddWithValue("@modalitet", rblModalitet.SelectedItem.Text);
            }
            else
            {
                kom2.Parameters.AddWithValue("@modalitet", 0);
            }

            kom2.Parameters.AddWithValue("@premija", txtPremija.Text);
            kom2.Parameters.AddWithValue("@id_klijenta", ddlKorisnik.SelectedItem.Value);


            int dodatoVozilo = 0;
            int dodataPolisa = 0;
            try
            {


                dodatoVozilo = kom.ExecuteNonQuery();
                dodataPolisa = kom2.ExecuteNonQuery();

                lblGreska.Text += "Broj dodatih vozila je: " + dodatoVozilo.ToString() + "<br/>";
                lblGreska.Text += "Broj dodatih polisa je: " + dodataPolisa.ToString();

            }



            catch (Exception ex)
            {
                lblGreska.Text = ex.Message;
            }

            finally
            {
                konekcija.Close();
            }
        }
    }
    public System.Collections.ArrayList vratiVrstuVozila()
    {
        System.Collections.ArrayList VrstaVozila = new System.Collections.ArrayList();


        VrstaVozila.Add("Kamion");
        VrstaVozila.Add("Motor");
        VrstaVozila.Add("Automobil");
        VrstaVozila.Add("Autobus");
        return VrstaVozila;
    }
    protected void CalendarSkapPol_SelectionChanged(object sender, EventArgs e)
    {
        txtDatSklPol.Text = CalendarSkapPol.SelectedDate.ToShortDateString();
    }
    protected void CalendarIstekPol_SelectionChanged(object sender, EventArgs e)
    {
        txtDatIstPol.Text = CalendarIstekPol.SelectedDate.ToShortDateString();
    }
}
