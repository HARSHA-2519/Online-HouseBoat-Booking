<%@ Page Title="" Language="C#" MasterPageFile="~/ADMIN/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Payment_Report.aspx.cs" Inherits="ADMIN_Payment_Report" %>

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
            <td><h2 class="auto-style4">PAYMENT REPORT</h2></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="612px">
                    <LocalReport ReportPath="Report_Payment.rdlc">
                        <DataSources>
                            <rsweb:ReportDataSource DataSourceId="SqlDataSource1" Name="DataSet1" />
                        </DataSources>
                    </LocalReport>
                </rsweb:ReportViewer>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HouseBoatBookingDB %>" SelectCommand="SELECT        ADV_PAY.Adv_pid, BOAT_BOOKING.Book_id, HOUSE_BOAT_REG.Boatname, ADV_PAY.Bank_Name, ADV_PAY.Paydate, ADV_PAY.Pay_type, ADV_PAY.CardType, ADV_PAY.Card_no, ADV_PAY.Expir_dt, 
                         ADV_PAY.Adv_amt
FROM            ADV_PAY INNER JOIN
                         BOAT_BOOKING ON ADV_PAY.Book_id = BOAT_BOOKING.Book_id INNER JOIN
                         HOUSE_BOAT_REG ON BOAT_BOOKING.Boat_id = HOUSE_BOAT_REG.Boat_id"></asp:SqlDataSource>
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

