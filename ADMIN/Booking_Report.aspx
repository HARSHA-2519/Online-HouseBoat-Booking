<%@ Page Title="" Language="C#" MasterPageFile="~/ADMIN/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Booking_Report.aspx.cs" Inherits="ADMIN_Booking_Report" %>

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
            <td><h2 class="auto-style4">BOOKING REPORT</h2></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="613px">
                    <LocalReport ReportPath="Report_Booking.rdlc">
                        <DataSources>
                            <rsweb:ReportDataSource DataSourceId="SqlDataSource1" Name="DataSet1" />
                        </DataSources>
                    </LocalReport>
                </rsweb:ReportViewer>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HouseBoatBookingDB %>" SelectCommand="SELECT        BOAT_BOOKING.Book_id, HOUSE_BOAT_REG.Boatname, BOAT_BOOKING.Pack_or_Not, PACKAGES.Pack_name, CUSTOMER_REG.Name, BOAT_BOOKING.Tot_memb, BOAT_BOOKING.Tot_adults, 
                         BOAT_BOOKING.Tot_child, BOAT_BOOKING.Adv_amt, BOAT_BOOKING.Book_date, BOAT_BOOKING.Total_amt
FROM            BOAT_BOOKING INNER JOIN
                         HOUSE_BOAT_REG ON BOAT_BOOKING.Boat_id = HOUSE_BOAT_REG.Boat_id INNER JOIN
                         PACKAGES ON BOAT_BOOKING.Pack_id = PACKAGES.Pack_id INNER JOIN
                         CUSTOMER_REG ON BOAT_BOOKING.Cust_id = CUSTOMER_REG.Cust_id"></asp:SqlDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetData" TypeName="BookingDataSetTableAdapters.DataTable1TableAdapter"></asp:ObjectDataSource>
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

