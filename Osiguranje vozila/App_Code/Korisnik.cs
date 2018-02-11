using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

/// <summary>
/// Summary description for Korisnik
/// </summary>
public class Korisnik
{
    public Korisnik()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public Korisnik(int id_klijenta, string Adresa, string Telefon)
    {

    }
    public int id_klijenta { get; set; }
    public string Adresa { get; set; }
    public string Telefon { get; set; }
}
