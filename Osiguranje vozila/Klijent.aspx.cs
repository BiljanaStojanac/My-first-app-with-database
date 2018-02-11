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


public partial class Klijent : System.Web.UI.Page
{
   
    SqlConnection konekcija = new SqlConnection(WebConfigurationManager.ConnectionStrings["mojaKonekcija"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack != true)
        {
            PopuniListu();
            Popunjavanje();
            lblIme.Visible = false;
            lblPrezime.Visible = false;
            lbljmbg.Visible = false;
            lblPol.Visible = false;
            lblAdresa.Visible = false;
            lblTelefon.Visible = false;
            lblOdaberi.Visible = false;
            ddlImePrezime.Visible = false;
            txtIme.Visible = false;
            txtPrezime.Visible = false;
            txtJMBG.Visible = false;
            txtPol.Visible = false;
            txtAdresa.Visible = false;
            txtTelefon.Visible = false;
            lblObaberiPreduzece.Visible = false;
            lblNazivPreduzeca.Visible = false;
            lblPIB.Visible = false;
            lblAdresaPravnog.Visible = false;
            lblSediste.Visible = false;
            ddlOdaberiPreduzece.Visible = false;
            txtNaziv.Visible = false;
            txtPib.Visible = false;
            txtAdresaPravnog.Visible = false;
            txtSediste.Visible = false;
            btnUnesi.Visible = false;
            btnIzmeni.Visible = false;
            btnObrisi.Visible = false;
            btnNovi.Visible = false;
            lblTelefonPravno.Visible = false;
            txtTelefonPravno.Visible = false;
            lblIDKlijentaF.Visible = false;
            lblIDKlijentaP.Visible = false;
            txtIDKlijentaF.Visible = false;
            txtIDKlijentaP.Visible = false;
        }
    }

    private void PopuniListu()
    {
        //{if (rbFizicko.Checked)
        SqlCommand komanda = new SqlCommand();
        komanda.Connection = konekcija;
        komanda.CommandText = "SELECT Ime,Prezime,id_klijenta FROM Klijent Where Ime is not null";

        ddlImePrezime.Items.Clear();
        konekcija.Open();

        try
        {
            SqlDataReader citac;
            citac = komanda.ExecuteReader();
            while (citac.Read())
            {
                ListItem stavka = new ListItem();
                stavka.Text = citac["Ime"] + " " + citac["Prezime"];
                stavka.Value = citac["id_klijenta"].ToString();
                ddlImePrezime.Items.Add(stavka);


            }
            citac.Close();

        }
        catch
        {

        }

        finally
        {
            konekcija.Close();

        }

    }
    protected void ddlImePrezime_SelectedIndexChanged(object sender, EventArgs e)
    {
        string selectNaredba;
        selectNaredba = " SELECT * FROM Klijent WHERE id_klijenta= '"
            + ddlImePrezime.SelectedItem.Value + "'";

        SqlCommand komanda = new SqlCommand(selectNaredba, konekcija);
        SqlDataReader citanje;

        try
        {
            konekcija.Open();
            citanje = komanda.ExecuteReader();
            citanje.Read();

            txtIDKlijentaF.Text = citanje["id_klijenta"].ToString();
            txtIme.Text = citanje["Ime"].ToString();
            txtPrezime.Text = citanje["Prezime"].ToString();
            txtJMBG.Text = citanje["JMBG"].ToString();
            txtPol.Text = citanje["pol"].ToString();
            txtAdresa.Text = citanje["Adresa"].ToString();
            txtTelefon.Text = citanje["Telefon"].ToString();

            citanje.Close();
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
    private void Popunjavanje()
    {

        SqlCommand komanda = new SqlCommand();
        komanda.Connection = konekcija;
        komanda.CommandText = "SELECT Naziv_preduzeca,id_klijenta FROM Klijent Where Naziv_preduzeca is not null";

        ddlOdaberiPreduzece.Items.Clear();
        try
        {
            konekcija.Open();
            SqlDataReader citac1;
            citac1 = komanda.ExecuteReader();
            while (citac1.Read())
            {
                ListItem stavka1 = new ListItem();
                stavka1.Text = citac1["Naziv_preduzeca"] + " ";
                stavka1.Value = citac1["id_klijenta"].ToString();
                ddlOdaberiPreduzece.Items.Add(stavka1);


            }
            citac1.Close();

        }
        catch
        {

        }

        finally
        {
            konekcija.Close();

        }

    }



    protected void ddlOdaberiPreduzece_SelectedIndexChanged(object sender, EventArgs e)
    {
        {
            string selectNaredba1;
            selectNaredba1 = " SELECT * FROM Klijent WHERE id_klijenta= '"
                + ddlOdaberiPreduzece.SelectedItem.Value + "'";

            SqlCommand komanda = new SqlCommand(selectNaredba1, konekcija);
            SqlDataReader citanje;
            //lblKraj.Visible = false;
            try
            {
                konekcija.Open();
                citanje = komanda.ExecuteReader();
                citanje.Read();

                txtIDKlijentaP.Text = citanje["id_klijenta"].ToString();
                txtNaziv.Text = citanje["Naziv_preduzeca"].ToString();
                txtPib.Text = citanje["PIB"].ToString();
                txtAdresaPravnog.Text = citanje["Adresa"].ToString();
                txtSediste.Text = citanje["Sediste"].ToString();
                txtTelefonPravno.Text = citanje["Telefon"].ToString();

                citanje.Close();
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
    }
    protected void btnNovi_Click(object sender, EventArgs e)
    {
        if (rbFizicko.Checked)
        {
            //lblOdaberi.Visible = false;
            //ddlImePrezime.Visible = false;
            RequiredFieldValidator1.Visible = true;
            RequiredFieldValidator2.Visible = true;
            RequiredFieldValidator3.Visible = true;
            RequiredFieldValidator4.Visible = true;
            RequiredFieldValidator5.Visible = true;
            RequiredFieldValidator6.Visible = true;
            RegularExpressionValidator3.Visible = true;
        }
        else
        {
            // ddlOdaberiPreduzece.Visible = false;
            // lblObaberiPreduzece.Visible = false;
            RequiredFieldValidator10.Visible = true;
            RequiredFieldValidator11.Visible = true;
            RequiredFieldValidator12.Visible = false;
            RequiredFieldValidator13.Visible = true;
            RequiredFieldValidator8.Visible = true;
            RequiredFieldValidator9.Visible = true;
        }




        btnNovi.Visible = true;
        if (rbFizicko.Checked)
            txtTelefon.Text = "";
        txtIme.Text = "";
        txtPrezime.Text = "";
        txtJMBG.Text = "";
        txtAdresa.Text = "";
        txtPol.Text = "";
        txtIDKlijentaF.Text = "";
        lblKraj1.Visible = false;
        lblKraj2.Visible = true;
        lblKraj2.Text = "Za dodavanje novog klijenta kliknite na dugme Dodaj";
        btnUnesi.Visible = true;

        if (rbPravno.Checked)
            txtNaziv.Text = "";
        txtPib.Text = "";
        txtAdresaPravnog.Text = "";
        txtSediste.Text = "";
        txtTelefonPravno.Text = "";
        txtIDKlijentaP.Text = "";
        lblKraj1.Text = "Za dodavanje novog klijenta kliknite na dugme Dodaj";
        btnUnesi.Visible = true;
        lblKraj1.Visible = true;
        lblKraj2.Visible = false;

    }
    protected void rbFizicko_CheckedChanged(object sender, EventArgs e)
    {

        lblKraj1.Visible = false;
        lblKraj2.Visible = false;

        lblIDKlijentaF.Visible = true;
        txtIDKlijentaF.Visible = true;
        lblIme.Visible = true;
        lblPrezime.Visible = true;
        lbljmbg.Visible = true;
        lblPol.Visible = true;
        lblAdresa.Visible = true;
        lblTelefon.Visible = true;
        lblOdaberi.Visible = true;
        ddlImePrezime.Visible = true;
        txtIme.Visible = true;
        txtPrezime.Visible = true;
        txtJMBG.Visible = true;
        txtPol.Visible = true;
        txtAdresa.Visible = true;
        txtTelefon.Visible = true;
        btnUnesi.Visible = false;
        btnIzmeni.Visible = true;
        btnObrisi.Visible = true;
        btnNovi.Visible = true;
        rbPravno.Visible = false;

    }
    protected void rbPravno_CheckedChanged(object sender, EventArgs e)
    {
        lblKraj1.Visible = false;
        lblKraj2.Visible = false;

        lblIDKlijentaP.Visible = true;
        txtIDKlijentaP.Visible = true;
        lblObaberiPreduzece.Visible = true;
        lblNazivPreduzeca.Visible = true;
        lblPIB.Visible = true;
        lblAdresaPravnog.Visible = true;
        lblSediste.Visible = true;
        ddlOdaberiPreduzece.Visible = true;
        txtNaziv.Visible = true;
        txtPib.Visible = true;
        txtAdresaPravnog.Visible = true;
        txtSediste.Visible = true;
        btnUnesi.Visible = false;
        btnIzmeni.Visible = true;
        btnObrisi.Visible = true;
        btnNovi.Visible = true;
        rbFizicko.Visible = false;
        lblTelefonPravno.Visible = true;
        txtTelefonPravno.Visible = true;
    }
    protected void btnObrisi_Click(object sender, EventArgs e)
    {
        if (rbFizicko.Checked)
        {
            lblKraj1.Visible = false;
            lblKraj2.Visible = false;

            string naredba = "Delete from Klijent Where id_klijenta = @id_klijenta";
            SqlCommand komanda = new SqlCommand(naredba, konekcija);

            komanda.Parameters.AddWithValue("@id_klijenta", ddlImePrezime.SelectedItem.Value);

            int obrisano = 0;
            try
            {
                konekcija.Open();
                obrisano = komanda.ExecuteNonQuery();
                lblKraj.Text = obrisano.ToString() + " kliijent u bazi je obrisan";
            }
            catch (Exception ex)
            {
                lblKraj.Text = ex.Message;
            }
            finally
            {
                konekcija.Close();
            }
            if (obrisano > 0)
            {
                PopuniListu();
                txtIDKlijentaF.Text = "";
                txtIme.Text = "";
                txtPrezime.Text = "";
                txtJMBG.Text = "";
                txtPol.Text = "";
                txtAdresa.Text = "";
                txtTelefon.Text = "";

            }
        }
        if (rbPravno.Checked)
        {
            string naredba = "Delete from Klijent Where id_klijenta = @id_klijenta";
            SqlCommand komanda = new SqlCommand(naredba, konekcija);

            komanda.Parameters.AddWithValue("@id_klijenta", ddlOdaberiPreduzece.SelectedItem.Value);

            int obrisano = 0;
            try
            {
                konekcija.Open();
                obrisano = komanda.ExecuteNonQuery();
                lblKraj.Text = obrisano.ToString() + " klijent u bazi je obrisan" + "</br>";
            }
            catch (Exception ex)
            {
                lblKraj.Text = ex.Message;
            }
            finally
            {
                konekcija.Close();
            }
            if (obrisano > 0)
            {
                Popunjavanje();
                txtIDKlijentaP.Text = "";
                txtPib.Text = "";
                txtNaziv.Text = "";
                txtAdresaPravnog.Text = "";
                txtTelefonPravno.Text = "";
                txtSediste.Text = "";
            }
        }


    }
    protected void btnUnesi_Click(object sender, EventArgs e)
    {
        if (rbPravno.Checked)
        {
            lblKraj1.Visible = false;
            lblKraj2.Visible = false;

            string naredba = "Insert into Klijent (id_klijenta, PIB, Adresa, Telefon, Sediste, Naziv_preduzeca) Values (@id_klijenta, @PIB, @Adresa, @Telefon, @Sediste, @Naziv_preduzeca) ";
            SqlCommand komanda = new SqlCommand(naredba, konekcija);

            komanda.Parameters.AddWithValue("@id_klijenta", int.Parse(txtIDKlijentaP.Text));
            komanda.Parameters.AddWithValue("@PIB", txtPib.Text);
            komanda.Parameters.AddWithValue("@Adresa", txtAdresaPravnog.Text);
            komanda.Parameters.AddWithValue("@Telefon", txtTelefonPravno.Text);
            komanda.Parameters.AddWithValue("@Sediste", txtSediste.Text);
            komanda.Parameters.AddWithValue("@Naziv_preduzeca", txtNaziv.Text);

            int dodato = 0;
            try
            {
                konekcija.Open();
                dodato = komanda.ExecuteNonQuery();
                lblKraj.Text = dodato.ToString() + " klijent u bazi je dodat";
            }
            catch (Exception ex)
            {
                lblKraj.Text = ex.Message;
            }
            finally
            {
                konekcija.Close();
            }
            if (dodato > 0)
            {
                Popunjavanje();
            }
        }
        if (rbFizicko.Checked)
        {
            lblKraj1.Visible = false;
            lblKraj2.Visible = false;

            string naredba = "Insert into Klijent (id_klijenta, Ime, Prezime, JMBG, pol, Adresa, Telefon) Values (@id_klijenta, @Ime, @Prezime, @JMBG, @pol, @Adresa, @Telefon) ";
            SqlCommand komanda = new SqlCommand(naredba, konekcija);

            komanda.Parameters.AddWithValue("@id_klijenta", int.Parse(txtIDKlijentaF.Text));
            komanda.Parameters.AddWithValue("@Ime", txtIme.Text);
            komanda.Parameters.AddWithValue("@Prezime", txtPrezime.Text);
            komanda.Parameters.AddWithValue("@JMBG", txtJMBG.Text);
            komanda.Parameters.AddWithValue("@pol", txtPol.Text);
            komanda.Parameters.AddWithValue("@Adresa", txtAdresa.Text);
            komanda.Parameters.AddWithValue("@Telefon", txtTelefon.Text);

            int dodato = 0;
            try
            {
                konekcija.Open();
                dodato = komanda.ExecuteNonQuery();
                lblKraj.Text = dodato.ToString() + " klijent u bazi je dodat.";
            }
            catch (Exception ex)
            {
                lblKraj.Text = ex.Message;
            }
            finally
            {
                konekcija.Close();
            }
            if (dodato > 0)
            {
                PopuniListu();
            }
        }
    }

    protected void btnIzmeni_Click(object sender, EventArgs e)
    {
        if (rbFizicko.Checked)
        {
            lblKraj1.Visible = false;
            lblKraj2.Visible = false;
            string naredba = "update Klijent set id_klijenta = @id_klijenta,Ime = @ime, Prezime = @prezime, pol = @pol,JMBG = @jmbg,Adresa = @adresa,Telefon = @telefon where id_klijenta = @id_klijenta";
            SqlCommand cmd = new SqlCommand(naredba, konekcija);
            cmd.Parameters.AddWithValue("@id_klijenta", int.Parse(txtIDKlijentaF.Text));
            cmd.Parameters.AddWithValue("@ime", txtIme.Text);
            cmd.Parameters.AddWithValue("@jmbg", txtJMBG.Text);
            cmd.Parameters.AddWithValue("@prezime", txtPrezime.Text);
            cmd.Parameters.AddWithValue("@pol", txtPol.Text);
            cmd.Parameters.AddWithValue("@adresa", txtAdresa.Text);
            cmd.Parameters.AddWithValue("@Telefon", txtTelefon.Text);
            int izmenjeno = 0;
            try
            {
                konekcija.Open();
                //ExecuteNonQuery vraca broj torki koje su popunjene iz baze
                izmenjeno = cmd.ExecuteNonQuery();
                lblKraj.Text = izmenjeno.ToString() + " klijent u bazi je izmenjen.";
            }
            catch (Exception exc)
            {
                lblKraj.Text = exc.Message;
            }
            finally
            {
                konekcija.Close();
            }
            if (izmenjeno > 0)
                PopuniListu();
        }
        if (rbPravno.Checked)
        {
            lblKraj1.Visible = false;
            lblKraj2.Visible = false;

            string naredba = "update Klijent set id_klijenta = @id_klijenta,Naziv_preduzeca = @Naziv_preduzeca,Sediste = @Sediste, PIB= @pib,Adresa = @Adresa,Telefon = @Telefon where id_klijenta = @id_klijenta";
            SqlCommand cmd = new SqlCommand(naredba, konekcija);
            cmd.Parameters.AddWithValue("@id_klijenta", int.Parse(txtIDKlijentaP.Text));
            cmd.Parameters.AddWithValue("@Naziv_preduzeca", txtNaziv.Text);
            cmd.Parameters.AddWithValue("@pib", txtPib.Text);
            cmd.Parameters.AddWithValue("@Adresa", txtAdresaPravnog.Text);
            cmd.Parameters.AddWithValue("@Telefon", txtTelefonPravno.Text);
            cmd.Parameters.AddWithValue("@Sediste", txtSediste.Text);
            int izmenjeno = 0;
            try
            {
                konekcija.Open();
                //ExecuteNonQuery vraca broj torki koje su popunjene iz baze
                izmenjeno = cmd.ExecuteNonQuery();
                lblKraj.Text = izmenjeno.ToString() + " klijent u bazi je izmenjen.";
            }
            catch (Exception exc)
            {
                lblKraj.Text = exc.Message;
            }
            finally
            {
                konekcija.Close();
            }
            if (izmenjeno > 0)
                Popunjavanje();
        }
    }
}

