<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Vozilo.aspx.cs" Inherits="Vozilo" Title="Sklapanje polise" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
    <asp:Label ID="lblGreska" runat="server"></asp:Label>
    <br />
    <asp:Label ID="lblVreme" runat="server"></asp:Label>
    <br />
    &nbsp;<asp:Wizard ID="VoziloW" runat="server" ActiveStepIndex="0" 
        onfinishbuttonclick="VoziloW_FinishButtonClick" 
        onnextbuttonclick="VoziloW_NextButtonClick" 
        onpreviousbuttonclick="VoziloW_PreviousButtonClick" Width="472px">
        <WizardSteps>
            <asp:WizardStep runat="server" title="Step 1">
                <table class="style1">
                    <tr>
                        <td>
                            <asp:Label ID="lblBrSasije" runat="server" Text="Broj sasije"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtBrojSasije" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="txtBrojSasije" ErrorMessage="Niste uneli podatke"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblRegistracija" runat="server" Text="Registarski broj"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtRegistracija" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ControlToValidate="txtRegistracija" ErrorMessage="Niste uneli podatke"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblVrsVoz" runat="server" Text="Vrsta vozila"></asp:Label>
                        </td>
                        <td>
                            <asp:ListBox ID="lstVrstaVozila" runat="server"></asp:ListBox>
                        </td>
                        <td>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblModel" runat="server" Text="Model"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtModel" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                ControlToValidate="txtModel" ErrorMessage="Niste uneli podatke"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblSnagMot" runat="server" Text="Snaga motora"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtSnagaMot" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                ControlToValidate="txtSnagaMot" ErrorMessage="Niste uneli podatke"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblBoja" runat="server" Text="Boja"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtBoja" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                ControlToValidate="txtSnagaMot" ErrorMessage="Niste uneli podatke"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblVrstGor" runat="server" Text="Vrsta goriva"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtVrstaGoriva" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                ControlToValidate="txtVrstaGoriva" ErrorMessage="Niste uneli podatke"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblGodiste" runat="server" Text="Godiste"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtGodiste" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                ControlToValidate="txtGodiste" ErrorMessage="Niste uneli podatke"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                ControlToValidate="txtGodiste" ErrorMessage="Neispravan format" 
                                ValidationExpression="\d{4}"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                </table>
            </asp:WizardStep>
            <asp:WizardStep runat="server" title="Step 2">
                <table class="style2">
                    <tr>
                        <td>
                            <asp:Label ID="lblBrPolise" runat="server" Text="Broj polise"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtPolisa" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox ID="chbKasko" runat="server" AutoPostBack="True" 
                                OnCheckedChanged="chbKasko_CheckedChanged" Text="Kasko osiguranje" />
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblModalitet" runat="server" Text="Modalitet" Visible="False"></asp:Label>
                        </td>
                        <td>
                            <asp:RadioButtonList ID="rblModalitet" runat="server" AutoPostBack="True" 
                                Visible="False">
                            </asp:RadioButtonList>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblDatSklapPol" runat="server" Text="Datum sklapanja polise"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblDatIstekPol" runat="server" Text="Datum itseka polise"></asp:Label>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Calendar ID="CalendarSkapPol" runat="server" 
                                OnSelectionChanged="CalendarSkapPol_SelectionChanged"></asp:Calendar>
                            <br />
                            <asp:TextBox ID="txtDatSklPol" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Calendar ID="CalendarIstekPol" runat="server" 
                                OnSelectionChanged="CalendarIstekPol_SelectionChanged"></asp:Calendar>
                            <br />
                            <asp:TextBox ID="txtDatIstPol" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblPremija" runat="server" Text="Premija"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtPremija" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblSifKor" runat="server" Text="Korisnik"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlKorisnik" runat="server">
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Detalji.aspx">Detalji 
                            o vozilima</asp:HyperLink>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                                ShowMessageBox="True" />
                        </td>
                        <td>
                            <asp:Label ID="Label1" runat="server"></asp:Label>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                </table>
            </asp:WizardStep>
        </WizardSteps>
    </asp:Wizard>
</div>
</asp:Content>

