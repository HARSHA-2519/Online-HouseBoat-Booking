<%@ Page Title="" Language="C#" MasterPageFile="~/ADMIN/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Package_Report.aspx.cs" Inherits="ADMIN_Package_Report" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

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
            <td><h2 class="auto-style4">PACKAGE REPORT</h2></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="609px">
                    <LocalReport ReportPath="Report_Package.rdlc">
                        <DataSources>
                            <rsweb:ReportDataSource DataSourceId="SqlDataSource1" Name="DataSet1" />
                        </DataSources>
                    </LocalReport>
                </rsweb:ReportViewer>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HouseBoatBookingDB %>" SelectCommand=" SELECT PACKAGES.Pack_id, PACKAGES.Pack_name, HOUSE_BOAT_REG.Boatname, PACKAGES.Tot_days, LOCATION.Loc_name AS FromLoc, LOCATION_1.Loc_name AS ToLoc, PACKAGES.Valid_from, PACKAGES.Valid_to_dt,
                         PACKAGES.Food_avail, PACKAGES.Extra_facility, PACKAGES.Duration, PACKAGES.Rate
FROM            PACKAGES INNER JOIN
                         HOUSE_BOAT_REG ON PACKAGES.Boat_id = HOUSE_BOAT_REG.Boat_id INNER JOIN
                         LOCATION ON PACKAGES.From_loc_id = LOCATION.Loc_id INNER JOIN
                         LOCATION AS LOCATION_1 ON PACKAGES.To_loc_id = LOCATION_1.Loc_id"></asp:SqlDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetData" TypeName="PackageDataSetTableAdapters.DataTable1TableAdapter"></asp:ObjectDataSource>
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

