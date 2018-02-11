<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Klijent.aspx.cs" Inherits="Klijent" Title="Klijent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">

        .style4
        {
            width: 41px;
        }
        .style5
        {
            width: 186px;
        }
    .style8
    {
        height: 60px;
        width: 107px;
    }
    .style9
    {
        width: 214px;
        height: 65px;
    }
    .style10
    {
        width: 134px;
    }
    .style13
    {
        height: 47px;
        width: 134px;
    }
    .style15
    {
        width: 138px;
        height: 47px;
    }
    .style16
    {
        width: 138px;
    }
    .style17
    {
        width: 132px;
        height: 65px;
    }
    .style19
    {
        width: 132px;
    }
    .style20
    {
        height: 23px;
    }
    .style21
    {
        height: 33px;
        width: 134px;
    }
    .style23
    {
        width: 138px;
        height: 33px;
    }
    .style25
    {
        height: 79px;
        width: 134px;
    }
    .style27
    {
        width: 138px;
        height: 79px;
    }
    .style28
    {
        height: 33px;
        width: 132px;
    }
    .style29
    {
        height: 79px;
        width: 132px;
    }
    .style30
    {
        height: 47px;
        width: 132px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="position: relative; width: 60%; margin-left: 0px; top: 7px; left: 3px;">
    <table class="style1" style="width: 165%">
        <tr>
            <td class="style20" colspan="4">
                <asp:Label ID="Label1" runat="server" Text="Molimo Vas da unesete podatke" 
                    Font-Bold="True" Font-Size="X-Large"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style20">
                <asp:RadioButton ID="rbFizicko" runat="server" AutoPostBack="True" 
                    oncheckedchanged="rbFizicko_CheckedChanged" Text="Fizicko lice" />
                <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </td>
            <td class="style16">
                <br />
            </td>
            <td class="style16">
                <asp:RadioButton ID="rbPravno" runat="server" AutoPostBack="True" 
                    oncheckedchanged="rbPravno_CheckedChanged" Text="Pravno lice" />
                <br />
                <br />
                <asp:Label ID="lblKraj1" runat="server"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </td>
            <td class="style17">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style21">
                <asp:Label ID="lblOdaberi" runat="server" Text="Odabrati fizicko lice"></asp:Label>
            </td>
            <td class="style23">
                <asp:DropDownList ID="ddlImePrezime" runat="server" AutoPostBack="True" 
                    onselectedindexchanged="ddlImePrezime_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
            <td class="style23">
                <asp:Label ID="lblObaberiPreduzece" runat="server" Text="Odaberi preduzece"></asp:Label>
            </td>
            <td class="style28">
                <asp:DropDownList ID="ddlOdaberiPreduzece" runat="server" AutoPostBack="True" 
                    onselectedindexchanged="ddlOdaberiPreduzece_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="style25">
                <asp:Label ID="lblIDKlijentaF" runat="server" Text="ID klijenta:"></asp:Label>
            </td>
            <td class="style27">
                <asp:TextBox ID="txtIDKlijentaF" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtIDKlijentaF" ErrorMessage="Niste uneli podatke" 
                    Visible="False"></asp:RequiredFieldValidator>
            </td>
            <td class="style27">
                <asp:Label ID="lblIDKlijentaP" runat="server" Text="ID klijenta:"></asp:Label>
            </td>
            <td class="style29">
                &nbsp;<asp:TextBox ID="txtIDKlijentaP" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                    ControlToValidate="txtIDKlijentaP" ErrorMessage="Niste uneli podatke" 
                    Visible="False"></asp:RequiredFieldValidator>
            &nbsp;</td>
        </tr>
        <tr>
            <td class="style20">
                <asp:Label ID="lblIme" runat="server" Text="Ime"></asp:Label>
            </td>
            <td class="style16">
                <asp:TextBox ID="txtIme" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtIme" ErrorMessage="Niste uneli podatke" Visible="False"></asp:RequiredFieldValidator>
            </td>
            <td class="style16">
                <asp:Label ID="lblNazivPreduzeca" runat="server" Text="Naziv preduzeca"></asp:Label>
            </td>
            <td class="style17">
                <asp:TextBox ID="txtNaziv" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                    ControlToValidate="txtNaziv" ErrorMessage="Niste uneli podatke" Visible="False"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style20">
                <asp:Label ID="lblPrezime" runat="server" Text="Prezime"></asp:Label>
            </td>
            <td class="style16">
                <asp:TextBox ID="txtPrezime" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="txtPrezime" ErrorMessage="Niste uneli podatke" 
                    Visible="False"></asp:RequiredFieldValidator>
            </td>
            <td class="style16">
                <asp:Label ID="lblPIB" runat="server" Text="PIB"></asp:Label>
            </td>
            <td class="style17">
                <asp:TextBox ID="txtPib" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                    ControlToValidate="txtPib" ErrorMessage="Niste uneli podatke" Visible="False"></asp:RequiredFieldValidator>
            &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator4" 
                    runat="server" ControlToValidate="txtPib" ErrorMessage="Neispravan format" 
                    ValidationExpression="\d{9}"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="style20">
                <asp:Label ID="lbljmbg" runat="server" Text="JMBG"></asp:Label>
            </td>
            <td class="style16">
                <asp:TextBox ID="txtJMBG" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="txtJMBG" ErrorMessage="Niste uneli podatke" 
                    InitialValue="13" Visible="False"></asp:RequiredFieldValidator>
                &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator3" 
                    runat="server" ControlToValidate="txtJMBG" ErrorMessage="Neisprvan format" 
                    ValidationExpression="\d{13}" Visible="False"></asp:RegularExpressionValidator>
            </td>
            <td class="style16">
                <asp:Label ID="lblAdresaPravnog" runat="server" Text="Adresa"></asp:Label>
            </td>
            <td class="style17">
                <asp:TextBox ID="txtAdresaPravnog" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                    ControlToValidate="txtAdresaPravnog" ErrorMessage="Niste uneli podatke" 
                    Visible="False"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style20">
                <asp:Label ID="lblPol" runat="server" Text="Pol"></asp:Label>
            </td>
            <td class="style16">
                <asp:TextBox ID="txtPol" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ControlToValidate="txtPol" ErrorMessage="Niste uneli podatke" Visible="False"></asp:RequiredFieldValidator>
                &nbsp;</td>
            <td class="style16">
                <asp:Label ID="lblTelefonPravno" runat="server" Text="Telefon"></asp:Label>
            </td>
            <td class="style17">
                <asp:TextBox ID="txtTelefonPravno" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
                    ControlToValidate="txtTelefon" ErrorMessage="Niste uneli podatke" 
                    Visible="False"></asp:RequiredFieldValidator>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style20">
                <asp:Label ID="lblAdresa" runat="server" Text="Adresa"></asp:Label>
            </td>
            <td class="style16">
                <asp:TextBox ID="txtAdresa" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                    ControlToValidate="txtAdresa" ErrorMessage="Niste uneli podatke" 
                    Visible="False"></asp:RequiredFieldValidator>
            </td>
            <td class="style16">
                <asp:Label ID="lblSediste" runat="server" Text="Sediste"></asp:Label>
            </td>
            <td class="style17">
                <asp:TextBox ID="txtSediste" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" 
                    ControlToValidate="txtSediste" ErrorMessage="Niste uneli podatke" 
                    Visible="False"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style13">
                <asp:Label ID="lblTelefon" runat="server" Text="Telefon"></asp:Label>
            </td>
            <td class="style15">
                <asp:TextBox ID="txtTelefon" runat="server"></asp:TextBox>
            </td>
            <td class="style15">
                </td>
            <td class="style30">
                </td>
        </tr>
        <tr>
            <td class="style10">
                <asp:Label ID="lblKraj" runat="server"></asp:Label>
            </td>
            <td class="style16">
                <asp:Label ID="lblKraj2" runat="server"></asp:Label>
            </td>
            <td class="style16">
                </td>
            <td class="style19">
                </td>
        </tr>
        <tr>
            <td class="style20">
                &nbsp;</td>
            <td class="style16">
                <asp:Button ID="btnIzmeni" runat="server" onclick="btnIzmeni_Click" 
                    Text="Izmeni" />
            </td>
            <td class="style16">
                <asp:Button ID="btnObrisi" runat="server" onclick="btnObrisi_Click" 
                    Text="Obrisi" />
            &nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnUnesi" runat="server" onclick="btnUnesi_Click" 
                    Text="Dodaj" Width="49px" />
            </td>
            <td class="style17">
                <asp:Button ID="btnNovi" runat="server" onclick="btnNovi_Click" Text="Novi" 
                    Width="54px" Height="28px" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </td>
        </tr>
    </table>
</div>
</asp:Content>

