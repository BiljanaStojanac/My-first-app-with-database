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

public partial class Cenovnik : System.Web.UI.Page
{
    SqlConnection konekcija = new SqlConnection(WebConfigurationManager.ConnectionStrings["mojaKonekcija"].ConnectionString);
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            PopuniListuModel();

        }
    }
    private void PopuniListuModel()
    {
        SqlCommand komanda = new SqlCommand();
        komanda.Connection = konekcija;
        komanda.CommandText = "SELECT model,ID_cenovnika FROM Cenovnik";

        ddlModel.Items.Clear();
        try
        {
            konekcija.Open();
            SqlDataReader citac2;
            citac2 = komanda.ExecuteReader();
            while (citac2.Read())
            {
                ListItem stavka2 = new ListItem();
                stavka2.Text = citac2["model"].ToString();
                //stavka2.Value = citac2["ID_cenovnika"].ToString();
                ddlModel.Items.Add(stavka2);


            }
            citac2.Close();

        }
        catch
        {

        }

        finally
        {
            konekcija.Close();

        }

    }
    private void PopuniListuGodiste()
    {
        SqlCommand komanda = new SqlCommand();
        komanda.Connection = konekcija;
        komanda.CommandText = "SELECT godina,ID_cenovnika FROM Cenovnik WHERE model = '" + ddlModel.SelectedItem.Text + "'";

        ddlGodiste.Items.Clear();
        try
        {
            konekcija.Open();
            SqlDataReader citac3;
            citac3 = komanda.ExecuteReader();
            while (citac3.Read())
            {
                ListItem stavka3 = new ListItem();
                stavka3.Text = citac3["godina"].ToString();
                // stavka3.Value = citac3["ID_cenovnika"].ToString();
                ddlGodiste.Items.Add(stavka3);


            }
            citac3.Close();

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
    protected void ddlModel_SelectedIndexChanged(object sender, EventArgs e)
    {
        PopuniListuGodiste();

    }
    protected void ddlGodiste_SelectedIndexChanged(object sender, EventArgs e)
    {

        string select2;
        select2 = " SELECT * FROM cenovnik WHERE model= '" + ddlModel.SelectedItem.Text + "' and godina = " + ddlGodiste.SelectedItem.Text;


        SqlCommand komanda = new SqlCommand(select2, konekcija);
        SqlDataReader citanje1;

        try
        {
            konekcija.Open();
            citanje1 = komanda.ExecuteReader();
            citanje1.Read();

            txtCena.Text = citanje1["trzisna_vrednost"].ToString();


            citanje1.Close();
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
