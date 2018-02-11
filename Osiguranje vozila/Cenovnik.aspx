<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Cenovnik.aspx.cs" Inherits="Cenovnik" Title="Cenovnik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
    <asp:Label ID="Label4" runat="server" 
        Text="Izabrite model i godiste kako bi ste videli cenu osiguranja!" 
            Font-Bold="True" Font-Italic="True" Font-Size="Large"></asp:Label>
    <br />
    <br />
    <br />
    <br />
    <asp:Label ID="lblModel" runat="server" Text="Model"></asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:DropDownList ID="ddlModel" runat="server" AutoPostBack="True" 
        onselectedindexchanged="ddlModel_SelectedIndexChanged" Height="26px" 
            Width="113px">
    </asp:DropDownList>
    <br />
    <br />
    <br />
    <asp:Label ID="lblGodiste" runat="server" Text="Godiste"></asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:DropDownList ID="ddlGodiste" runat="server" AutoPostBack="True" 
        Height="26px" onselectedindexchanged="ddlGodiste_SelectedIndexChanged" 
        Width="113px">
    </asp:DropDownList>
    &nbsp;&nbsp;
    <br />
    <br />
    <asp:Label ID="lblCena" runat="server" Text="Cena"></asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="txtCena" runat="server" Height="20px" Width="108px" Wrap="False"></asp:TextBox>
    <br />
    <br />
    <asp:Label ID="lblGreska" runat="server"></asp:Label>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
</div>
</asp:Content>

