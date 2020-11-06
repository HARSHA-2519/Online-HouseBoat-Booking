<%@ Page Title="" Language="C#" MasterPageFile="~/ADMIN/AdminMasterPage.master" AutoEventWireup="true" CodeFile="House_Boat_Report.aspx.cs" Inherits="ADMIN_House_Boat_Report" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style3 {
            width: 155%;
        }
        .auto-style4 {
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="auto-style3">
        <tr>
            <td><h2 class="auto-style4">HOUSEBOAT REGISTRATION REPORT</h2></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="605px">
                    <LocalReport ReportPath="Report_HouseBoat_Reg.rdlc">
                        <DataSources>
                            <rsweb:ReportDataSource DataSourceId="SqlDataSource1" Name="DataSet1" />
                        </DataSources>
                    </LocalReport>
                </rsweb:ReportViewer>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HouseBoatBookingDB %>" SelectCommand="SELECT        HOUSE_BOAT_REG.Boat_id, HOUSE_BOAT_REG.Boatname, LOCATION.Loc_name, BOAT_TYPE.Typename, HOUSE_BOAT_REG.Tot_rooms, HOUSE_BOAT_REG.Descp, HOUSE_BOAT_REG.Cont_name, 
                         HOUSE_BOAT_REG.Address_Line1, HOUSE_BOAT_REG.Address_Line2, HOUSE_BOAT_REG.Cont_no, HOUSE_BOAT_REG.Rate_per_day
FROM            HOUSE_BOAT_REG INNER JOIN
                         BOAT_TYPE ON HOUSE_BOAT_REG.Btype_id = BOAT_TYPE.Btype_id INNER JOIN
                         LOCATION ON HOUSE_BOAT_REG.Loc_id = LOCATION.Loc_id"></asp:SqlDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetData" TypeName="HouseBoatRegDataSetTableAdapters.DataTable1TableAdapter"></asp:ObjectDataSource>
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

