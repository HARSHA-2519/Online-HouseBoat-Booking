<%@ Page Title="" Language="C#" MasterPageFile="~/ADMIN/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Staff_Report.aspx.cs" Inherits="ADMIN_Staff_Report" %><%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style3 {
            width: 100%;
        }
        .auto-style4 {
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="auto-style3">
        <tr>
            <td><h2 class="auto-style4">STAFF REPORT</h2></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="613px">
                    <LocalReport ReportPath="Report_Staff.rdlc">
                        <DataSources>
                            <rsweb:ReportDataSource DataSourceId="SqlDataSource1" Name="DataSet1" />
                        </DataSources>
                    </LocalReport>
                </rsweb:ReportViewer>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HouseBoatBookingDB %>" SelectCommand="SELECT        STAFF.Staff_id, HOUSE_BOAT_REG.Boatname, STAFF.Name, STAFF.Address_Line1, STAFF.Address_Line2, STAFF.Phone, STAFF.Email, STAFF.Age, STAFF.Gender, LOCATION.Loc_name, DISTRICT.Dist
FROM            STAFF INNER JOIN
                         LOCATION ON STAFF.Loc_id = LOCATION.Loc_id INNER JOIN
                         DISTRICT ON STAFF.Dist_id = DISTRICT.Dist_id INNER JOIN
                         HOUSE_BOAT_REG ON STAFF.Boat_id = HOUSE_BOAT_REG.Boat_id"></asp:SqlDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetData" TypeName="Staff_DataSetTableAdapters.DataTable1TableAdapter"></asp:ObjectDataSource>
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

