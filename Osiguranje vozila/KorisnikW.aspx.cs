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

public partial class KorisnikW : System.Web.UI.Page
{
    //kljuc sesije
    const string KorisnikSessionKey = "Korisnik";
    SqlConnection konekcija = new SqlConnection(WebConfigurationManager.ConnectionStrings["mojaKonekcija"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack != true)
        {
            lblIme.Visible = false;
            lblPrezime.Visible = false;
            lbljmbg.Visible = false;
            lblPol.Visible = false;
            txtIme.Visible = false;
            txtPrezime.Visible = false;
            txtJMBG.Visible = false;
            txtPol.Visible = false;
            lblNazivPreduzeca.Visible = false;
            lblPIB.Visible = false;
            lblSediste.Visible = false;
            txtNaziv.Visible = false;
            txtPib.Visible = false;
            txtSediste.Visible = false;
        }
    }
    protected void Wizard1_FinishButtonClick(object sender, WizardNavigationEventArgs e)
    {
        RequiredFieldValidator1.Visible = false;
        RequiredFieldValidator2.Visible = false;
        RequiredFieldValidator3.Visible = false;
        RequiredFieldValidator4.Visible = false;
        RequiredFieldValidator5.Visible = false;
        RequiredFieldValidator6.Visible = false;
        RequiredFieldValidator7.Visible = false;
        RequiredFieldValidator8.Visible = false;
        RequiredFieldValidator9.Visible = false;
        RequiredFieldValidator10.Visible = false;

        int dodato = 0;
        try
        {
            konekcija.Open();
            string naredba = "Insert into Klijent (id_klijenta, Ime, Prezime, JMBG, pol, PIB, Adresa, Telefon, Sediste, Naziv_preduzeca) Values (@id_klijenta, @Ime, @Prezime, @JMBG, @pol, @PIB, @Adresa, @Telefon, @Sediste, @Naziv_preduzeca)";
            SqlCommand komanda = new SqlCommand(naredba, konekcija);
            //u novi se ubacuju podaci iz sesije
            Korisnik novi = (Korisnik)Session[KorisnikSessionKey];

            komanda.Parameters.AddWithValue("@id_klijenta", novi.id_klijenta);
            komanda.Parameters.AddWithValue("@Adresa", novi.Adresa);
            komanda.Parameters.AddWithValue("@Telefon", novi.Telefon);

            if (String.IsNullOrEmpty(txtJMBG.Text))
            {
                komanda.Parameters.AddWithValue("@JMBG", DBNull.Value);
            }
            else
            {
                komanda.Parameters.AddWithValue("@JMBG", txtJMBG.Text);
            }
            if (String.IsNullOrEmpty(txtIme.Text))
            {
                komanda.Parameters.AddWithValue("@Ime", DBNull.Value);
            }
            else
            {
                komanda.Parameters.AddWithValue("@Ime", txtIme.Text);
            }
            if (String.IsNullOrEmpty(txtPrezime.Text))
            {
                komanda.Parameters.AddWithValue("@Prezime", DBNull.Value);
            }
            else
            {
                komanda.Parameters.AddWithValue("@Prezime", txtPrezime.Text);
            }
            if (String.IsNullOrEmpty(txtPol.Text))
            {
                komanda.Parameters.AddWithValue("@pol", DBNull.Value);
            }
            else
            {
                komanda.Parameters.AddWithValue("@pol", txtPol.Text);
            }
            if (String.IsNullOrEmpty(txtPib.Text))
            {
                komanda.Parameters.AddWithValue("@PIB", DBNull.Value);
            }
            else
            {
                komanda.Parameters.AddWithValue("@PIB", txtPib.Text);
            }
            if (String.IsNullOrEmpty(txtSediste.Text))
            {
                komanda.Parameters.AddWithValue("@Sediste", DBNull.Value);
            }
            else
            {
                komanda.Parameters.AddWithValue("@Sediste", txtSediste.Text);
            }
            if (String.IsNullOrEmpty(txtNaziv.Text))
            {
                komanda.Parameters.AddWithValue("@Naziv_preduzeca", DBNull.Value);
            }
            else
            {
                komanda.Parameters.AddWithValue("@Naziv_preduzeca", txtNaziv.Text);
            }
            dodato = komanda.ExecuteNonQuery();
            lblKraj.Text = dodato.ToString() + " korisnik je dodat u bazu";
        }
        catch (Exception ex)
        {
            lblKraj.Text = ex.Message;
        }
        finally
        {
            konekcija.Close();
        }

    }
    protected void Wizard1_NextButtonClick(object sender, WizardNavigationEventArgs e)
    {
        if (txtIDKorisnika.Text == "" || txtAdresa.Text == "" || txtTelefon.Text == "")
        {
            e.Cancel = true; //ovo se navodi kako bi se program ovde zadrzao
        }
        Korisnik novi = new Korisnik();
        novi.id_klijenta = int.Parse(txtIDKorisnika.Text);
        novi.Adresa = txtAdresa.Text;
        novi.Telefon = txtTelefon.Text;

        Session[KorisnikSessionKey] = novi;
        //ubacivanje podataka u sesiju

    }
    protected void Wizard1_PreviousButtonClick(object sender, WizardNavigationEventArgs e)
    {
        Korisnik novi = (Korisnik)Session[KorisnikSessionKey];
        txtIDKorisnika.Text = Convert.ToString(novi.id_klijenta);
        txtAdresa.Text = novi.Adresa;
        txtTelefon.Text = novi.Telefon;
        //vraca podatke iz sesije
    }
    protected void rbFizicko_CheckedChanged(object sender, EventArgs e)
    {
        lblIme.Visible = true;
        lblPrezime.Visible = true;
        lbljmbg.Visible = true;
        lblPol.Visible = true;
        txtIme.Visible = true;
        txtPrezime.Visible = true;
        txtJMBG.Visible = true;
        txtPol.Visible = true;
        rbPravno.Visible = false;
    }
    protected void rbPravno_CheckedChanged(object sender, EventArgs e)
    {
        lblNazivPreduzeca.Visible = true;
        lblPIB.Visible = true;
        lblSediste.Visible = true;
        txtNaziv.Visible = true;
        txtPib.Visible = true;
        txtSediste.Visible = true;
        rbFizicko.Visible = false;
    }
    protected void btnIzmena_Click(object sender, EventArgs e)
    {
        //preusmeravanje na drugu stranicu
        Response.Redirect("Klijent.aspx");
    }
}
