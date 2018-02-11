<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Detalji.aspx.cs" Inherits="Detalji" Title="Detalji" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" 
        BorderStyle="Solid" BorderWidth="1px" CellPadding="3" 
        DataKeyNames="broj_sasije" DataSourceID="SqlDataSourceVozilo" ForeColor="Black" 
        GridLines="Vertical" onselectedindexchanged="GridView1_SelectedIndexChanged">
        <Columns>
            <asp:BoundField DataField="broj_sasije" HeaderText="broj_sasije" 
                ReadOnly="True" SortExpression="broj_sasije" />
            <asp:BoundField DataField="registarski_broj" HeaderText="registarski_broj" 
                SortExpression="registarski_broj" />
            <asp:BoundField DataField="vrsta_vozila" HeaderText="vrsta_vozila" 
                SortExpression="vrsta_vozila" />
            <asp:BoundField DataField="Model" HeaderText="Model" SortExpression="Model" />
            <asp:BoundField DataField="snaga_motora" HeaderText="snaga_motora" 
                SortExpression="snaga_motora" />
            <asp:BoundField DataField="boja" HeaderText="boja" SortExpression="boja" />
            <asp:BoundField DataField="vrsta_goriva" HeaderText="vrsta_goriva" 
                SortExpression="vrsta_goriva" />
            <asp:BoundField DataField="godina_proizvodnje" HeaderText="godina_proizvodnje" 
                SortExpression="godina_proizvodnje" />
        </Columns>
        <FooterStyle BackColor="#CCCCCC" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="#CCCCCC" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSourceVozilo" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Osiguranje9ConnectionString4 %>" 
        SelectCommand="SELECT * FROM [vozilo]"></asp:SqlDataSource>
</div>
</asp:Content>

