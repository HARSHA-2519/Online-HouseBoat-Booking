<%@ Page Title="" Language="C#" MasterPageFile="~/ADMIN/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Customer_Report.aspx.cs" Inherits="ADMIN_Customer_Report" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style3 {
            width: 156%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="auto-style3">
        <tr>
            <td><h2>CUSTOMER REPORT</h2></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="607px">
                    <LocalReport ReportPath="Report_Customer.rdlc">
                        <DataSources>
                            <rsweb:ReportDataSource DataSourceId="SqlDataSource1" Name="DataSet1" />
                        </DataSources>
                    </LocalReport>
                </rsweb:ReportViewer>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HouseBoatBookingDB %>" SelectCommand="SELECT        CUSTOMER_REG.Cust_id, CUSTOMER_REG.Name, CUSTOMER_REG.Address_Line1, CUSTOMER_REG.Address_Line2, CUSTOMER_REG.Age, CUSTOMER_REG.Gender, DISTRICT.Dist, LOCATION.Loc_name, 
                         CUSTOMER_REG.Email, CUSTOMER_REG.Phone_no
FROM            CUSTOMER_REG INNER JOIN
                         DISTRICT ON CUSTOMER_REG.Dist_id = DISTRICT.Dist_id INNER JOIN
                         LOCATION ON CUSTOMER_REG.Loc_id = LOCATION.Loc_id"></asp:SqlDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetData" TypeName="CustomerDataSetTableAdapters.DataTable1TableAdapter"></asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
            </td>
        </tr>
    </table>
</asp:Content>

