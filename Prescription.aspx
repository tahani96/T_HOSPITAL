<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Prescription.aspx.cs" Inherits="Prescription" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style23
        {
            color: #0085A8;
            width: 171px;
        }
        .style25
        {
            color: #660066;
            font-family: Arial, Helvetica, sans-serif;
            font-size: medium;
            width: 171px;
        }
        .style26
        {
            width: 171px;
        }
        .style27
        {
            width: 371px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1" style="width: 55%; text-align: left; font-size: x-large">
    <tr>
        <td class="style25">
            &nbsp;</td>
        <td class="style27">
            <h1>Prescription</h1></td>
        <td class="style28">
            &nbsp;</td>
    </tr>
    <tr>
        <td style="color: #0085A8" class="style26">
            Patient </td>
        <td class="style27">
            <asp:TextBox ID="Txtpatient" runat="server" AutoPostBack="True" 
                style="color: #666666" ontextchanged="Txtpatient_TextChanged"></asp:TextBox>
            <br />
    <asp:RequiredFieldValidator ID="RequiredFieldValidatorID" runat="server" 
                        ControlToValidate="Txtpatient" ErrorMessage="ID is Required" ForeColor="Red" 
                        Display="Dynamic" CssClass="style16" ValidationGroup="va1group"></asp:RequiredFieldValidator>
        </td>
        <td class="style29">
    <asp:Label ID="LabelName" runat="server" Text="Label" Visible="False"></asp:Label></td>
    </tr>
    <tr>
        <td class="style23">
            Doctor name</td>
        <td class="style27">
            <asp:DropDownList ID="DropDownListname" runat="server" 
                DataSourceID="SqlDataSource1" DataTextField="doc_name" 
                DataValueField="doc_id" style="color: #666666" Width="190px">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                SelectCommand="SELECT [doc_name], [doc_id] FROM [doctor]">
            </asp:SqlDataSource>
        </td>
        <td class="style28">
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style23">
            Date</td>
        <td class="style27">
            <asp:TextBox ID="Txtdate" runat="server" style="color: #666666"></asp:TextBox>
            <br />
    <asp:RequiredFieldValidator ID="RequiredFieldValidatorDate" runat="server" 
                        ControlToValidate="Txtdate" ErrorMessage="Date is Required" ForeColor="Red" 
                        Display="Dynamic" CssClass="style16" ValidationGroup="va1group"></asp:RequiredFieldValidator>
        </td>
        <td class="style28">
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style23">
            Fee</td>
        <td class="style27">
            <asp:TextBox ID="Txtfee" runat="server"></asp:TextBox>
            <br />
    <asp:RequiredFieldValidator ID="RequiredFieldValidatorTFee" runat="server" 
                        ControlToValidate="Txtfee" ErrorMessage="Fee is Required" ForeColor="Red" 
                        Display="Dynamic" CssClass="style16" ValidationGroup="va1group"></asp:RequiredFieldValidator>
        </td>
        <td class="style28">
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style26">
            </td>
        <td class="style27">
    <asp:Label ID="Labelmass" runat="server" Text="Label" Visible="False" 
                style="color: #3A7474"></asp:Label>
        </td>
        <td class="style30">
        </td>
    </tr>
    <tr>
        <td class="style26">
            &nbsp;</td>
        <td class="style27">
            <asp:TextBox ID="Textsearch" runat="server"></asp:TextBox>
        </td>
        <td class="style28">
            <asp:Button ID="Btnsearch" runat="server" Text="Search" 
                onclick="Btnsearch_Click" />
        </td>
    </tr>
    <tr>
        <td class="style26">
            &nbsp;</td>
        <td class="style27">
            <asp:Button ID="Btninsert" runat="server" onclick="Btninsert_Click" 
                Text="Insert" ValidationGroup="va1group" />
        </td>
        <td class="style28">
            <asp:Button ID="Btnupdate" runat="server" onclick="Btnupdate_Click" 
                Text="Update" ValidationGroup="va1group" />
        </td>
        <td class="style14">
            <asp:Button ID="BtnClear" runat="server" Text="Clear" 
                onclick="BtnClear_Click" />
        </td>
        <td class="style21">
            &nbsp;</td>
    </tr>
</table>
</asp:Content>

