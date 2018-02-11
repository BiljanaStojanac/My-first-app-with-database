<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="KorisnikW.aspx.cs" Inherits="KorisnikW" Title="Klijenti" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style10
        {
            width: 189px;
            height: 23px;
        }
        .style11
        {
            height: 23px; <ahref="KorisnikW.aspx">KorisnikW.aspx</a>}
        .style12
        {
            width: 189px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
    &nbsp;&nbsp;&nbsp;
    <asp:Wizard ID="Wizard1" runat="server" ActiveStepIndex="0" Height="264px" 
        onfinishbuttonclick="Wizard1_FinishButtonClick" 
        onnextbuttonclick="Wizard1_NextButtonClick" 
        onpreviousbuttonclick="Wizard1_PreviousButtonClick" Width="768px" 
            FinishCompleteButtonText="Unsi klijenta" 
            FinishPreviousButtonText="Prethodni korak">
        <WizardSteps>
            <asp:WizardStep runat="server" title="Korak 1">
                <table class="style1">
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblIDKorisnika" runat="server" Text="ID korisnika:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtIDKorisnika" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="txtIDKorisnika" ErrorMessage="Niste uneli podatke"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblAdresa" runat="server" Text="Adresa:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtAdresa" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ControlToValidate="txtAdresa" ErrorMessage="Niste uneli podatke"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblTelefon" runat="server" Text="Telefon:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtTelefon" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                ControlToValidate="txtTelefon" ErrorMessage="Niste uneli podatke"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                </table>
            </asp:WizardStep>
            <asp:WizardStep runat="server" title="Korak 2">
                <table class="style1">
                    <tr>
                        <td class="style20" colspan="4">
                            <asp:Label ID="Label1" runat="server" Text="Molimo Vas da unesete podatke"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style21">
                            <asp:RadioButton ID="rbFizicko" runat="server" AutoPostBack="True" 
                                OnCheckedChanged="rbFizicko_CheckedChanged" Text="Fizicko lice" />
                        </td>
                        <td class="style13">
                            &nbsp;</td>
                        <td class="style18">
                            <asp:RadioButton ID="rbPravno" runat="server" AutoPostBack="True" 
                                OnCheckedChanged="rbPravno_CheckedChanged" Text="Pravno lice" />
                        </td>
                        <td class="style5">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style21">
                            <asp:Label ID="lbljmbg" runat="server" Text="JMBG"></asp:Label>
                        </td>
                        <td class="style13">
                            <asp:TextBox ID="txtJMBG" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                ControlToValidate="txtJMBG" ErrorMessage="Niste uneli podatke" Visible="False"></asp:RequiredFieldValidator>
                            &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" 
                                runat="server" ControlToValidate="txtJMBG" 
                                ErrorMessage="Niste uneli dobar format" ValidationExpression="\d{13}"></asp:RegularExpressionValidator>
                        </td>
                        <td class="style18">
                            <asp:Label ID="lblPIB" runat="server" Text="PIB"></asp:Label>
                        </td>
                        <td class="style5">
                            <asp:TextBox ID="txtPib" runat="server"></asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                                ControlToValidate="txtPib" ErrorMessage="Niste uneli podatke"></asp:RequiredFieldValidator>
                            &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator2" 
                                runat="server" ControlToValidate="txtPib" ErrorMessage="Neispravan format" 
                                ValidationExpression="\d{9}"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style21">
                            <asp:Label ID="lblIme" runat="server" Text="Ime"></asp:Label>
                        </td>
                        <td class="style13">
                            <asp:TextBox ID="txtIme" runat="server"></asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                ControlToValidate="txtIme" ErrorMessage="Niste uneli podatke"></asp:RequiredFieldValidator>
                        </td>
                        <td class="style18">
                            <asp:Label ID="lblNazivPreduzeca" runat="server" Text="Naziv preduzeca"></asp:Label>
                        </td>
                        <td class="style5">
                            <asp:TextBox ID="txtNaziv" runat="server"></asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                                ControlToValidate="txtNaziv" ErrorMessage="Niste uneli podatke"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style21">
                            <asp:Label ID="lblPrezime" runat="server" Text="Prezime"></asp:Label>
                        </td>
                        <td class="style13">
                            <asp:TextBox ID="txtPrezime" runat="server"></asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                ControlToValidate="txtPrezime" ErrorMessage="Niste uneli podatke"></asp:RequiredFieldValidator>
                        </td>
                        <td class="style18">
                            <asp:Label ID="lblSediste" runat="server" Text="Sediste"></asp:Label>
                        </td>
                        <td class="style5">
                            <asp:TextBox ID="txtSediste" runat="server"></asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                                ControlToValidate="txtSediste" ErrorMessage="Niste uneli podatke"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style21">
                            <asp:Label ID="lblPol" runat="server" Text="Pol"></asp:Label>
                        </td>
                        <td class="style13">
                            <asp:TextBox ID="txtPol" runat="server"></asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                ControlToValidate="txtPol" ErrorMessage="Niste uneli podatke"></asp:RequiredFieldValidator>
                        </td>
                        <td class="style18">
                            &nbsp;</td>
                        <td class="style5">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style22">
                            <asp:Label ID="lblKraj" runat="server"></asp:Label>
                            </td>
                        <td class="style14">
                            </td>
                        <td class="style19">
                            </td>
                        <td class="style11">
                            </td>
                    </tr>
                </table>
            </asp:WizardStep>
        </WizardSteps>
    </asp:Wizard>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnIzmena" runat="server" onclick="btnIzmena_Click" 
        Text="Izmena" Font-Bold="True" />
</div>
</asp:Content>

