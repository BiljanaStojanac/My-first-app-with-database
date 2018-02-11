<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Kontakt.aspx.cs" Inherits="Kontakt" Title="Kontakt" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">

 p.MsoNormal
	{margin-top:0cm;
	margin-right:0cm;
	margin-bottom:10.0pt;
	margin-left:0cm;
	line-height:115%;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";
	}
    .style10
    {
        height: 34px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1">
    <tr>
        <td class="style2">
&nbsp;&nbsp;&nbsp;
            <asp:Image ID="Image2" runat="server" ImageUrl="~/Slike/kruzic.bmp" />
&nbsp;
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Large" 
                Text="Kontaktirajte nas..."></asp:Label>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style2">
            <asp:Image ID="Image1" runat="server" ImageUrl="~/Slike/izmenjena mapa.png" />
        </td>
        <td>
            <p class="MsoNormal">
                <strong>
                <span style="font-size:10.5pt;line-height:115%;
font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;color:#363636">adresa:</span></strong><span style="font-size:10.5pt;line-height:115%;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;
color:#363636"><o:p></o:p></span></p>
            <p class="MsoNormal">
                <span style="font-size:10.5pt;line-height:115%;font-family:
&quot;Tahoma&quot;,&quot;sans-serif&quot;;color:#363636">Skender Begova 7, 21000 Novi Sad<o:p></o:p></span></p>
            <p class="MsoNormal">
                <span style="font-size:10.5pt;line-height:115%;font-family:
&quot;Tahoma&quot;,&quot;sans-serif&quot;;color:#363636">&nbsp;<o:p></o:p></span></p>
            <p class="MsoNormal">
                <strong>
                <span style="font-size:10.5pt;line-height:115%;
font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;color:#363636">tel:</span></strong><span style="font-size:10.5pt;line-height:115%;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;
color:#363636"><o:p></o:p></span></p>
            <p class="MsoNormal">
                <span style="font-size:10.5pt;line-height:115%;font-family:
&quot;Tahoma&quot;,&quot;sans-serif&quot;;color:#363636">021/545-582,&nbsp; 021/425-415<o:p></o:p></span></p>
            <p class="MsoNormal">
                <span style="font-size:10.5pt;line-height:115%;font-family:
&quot;Tahoma&quot;,&quot;sans-serif&quot;;color:#363636">&nbsp;<o:p></o:p></span></p>
            <p class="MsoNormal">
                <strong>
                <span style="font-size:10.5pt;line-height:115%;
font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;color:#363636">fax:</span></strong><span style="font-size:10.5pt;line-height:115%;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;
color:#363636"><o:p></o:p></span></p>
            <p class="MsoNormal">
                <span style="font-size:10.5pt;line-height:115%;font-family:
&quot;Tahoma&quot;,&quot;sans-serif&quot;;color:#363636">021/283- 018<o:p></o:p></span></p>
            <p class="MsoNormal">
                <span style="font-size:10.5pt;line-height:115%;font-family:
&quot;Tahoma&quot;,&quot;sans-serif&quot;;color:#363636">od 9:00 do 17:00<o:p></o:p></span></p>
            <p class="MsoNormal">
                <span style="font-size:10.5pt;line-height:115%;font-family:
&quot;Tahoma&quot;,&quot;sans-serif&quot;;color:#363636">&nbsp;<o:p></o:p></span></p>
            <p class="MsoNormal">
                <strong>
                <span style="font-size:10.5pt;line-height:115%;
font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;color:#363636">mobilni:</span></strong><span style="font-size:10.5pt;line-height:115%;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;
color:#363636"><o:p></o:p></span></p>
            <p class="MsoNormal">
                <span style="font-size:10.5pt;line-height:115%;font-family:
&quot;Tahoma&quot;,&quot;sans-serif&quot;;color:#363636">065 585 55 55<o:p></o:p></span></p>
            <p class="MsoNormal">
                <span style="font-size:10.5pt;line-height:115%;font-family:
&quot;Tahoma&quot;,&quot;sans-serif&quot;;color:#363636">od 00:00 do 24:00<o:p></o:p></span></p>
            <p class="MsoNormal">
                <span style="font-size:10.5pt;line-height:115%;font-family:
&quot;Tahoma&quot;,&quot;sans-serif&quot;;color:#363636">&nbsp;<o:p></o:p></span></p>
            <p class="MsoNormal">
                <strong>
                <span style="font-size:10.5pt;line-height:115%;
font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;color:#363636">e-mail</span></strong><o:p></o:p></p>
            <p class="MsoNormal">
                <o:p></o:p>
                <asp:HyperLink ID="HyperLink8" runat="server" NavigateUrl="~/Kontakt.aspx">biljanam@gmail.com</asp:HyperLink>
            </p>
            </td>
    </tr>
</table>
<div>
</div>
<div>
</div>
</asp:Content>

