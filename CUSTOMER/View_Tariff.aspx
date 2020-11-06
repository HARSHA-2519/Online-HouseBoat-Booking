<%@ Page Title="" Language="C#" MasterPageFile="~/CUSTOMER/CustomerMasterPage.master" AutoEventWireup="true" CodeFile="View_Tariff.aspx.cs" Inherits="CUSTOMER_View_Tariff" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style3 {
            width: 158%;
        }
        .auto-style4 {
            text-align: center;
        }
        .auto-style5 {
            height: 31px;
        }
        .auto-style6 {
            height: 31px;
            width: 22px;
        }
        .auto-style7 {
            width: 22px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="auto-style3">
        <tr>
            <td class="auto-style5"></td>
            <td colspan="2" class="auto-style5"><h2 class="auto-style4">VIEW TARIFF</h2></td>
            <td class="auto-style6"></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td class="auto-style7">&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td colspan="2" rowspan="2" class="auto-style4">
                <asp:GridView ID="gvViewTariff" runat="server" AutoGenerateColumns="False" DataKeyNames="Boat_id" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" Width="573px">
                    <AlternatingRowStyle BackColor="#F7F7F7" />
                    <Columns>
                        <asp:BoundField DataField="Boatname" HeaderText="BOAT NAME" SortExpression="Boatname" />
                        <asp:BoundField DataField="Typename" HeaderText="BOAT TYPE" SortExpression="Btype_id" />
                        <asp:BoundField DataField="Tot_rooms" HeaderText="TOTAL NO: OF ROOMS" SortExpression="Tot_rooms" />
                        <asp:BoundField DataField="Rate_per_day" HeaderText="RATE PER DAY" SortExpression="Rate_per_day" />
                        <asp:ImageField DataImageUrlField="Boat_image" DataImageUrlFormatString="~/BoatImages/{0}" HeaderText="IMAGES">
                            <ControlStyle Height="100px" Width="250px" />
                        </asp:ImageField>
                    </Columns>
                    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                    <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <SortedAscendingCellStyle BackColor="#F4F4FD" />
                    <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                    <SortedDescendingCellStyle BackColor="#D8D8F0" />
                    <SortedDescendingHeaderStyle BackColor="#3E3277" />
                </asp:GridView>
            </td>
            <td class="auto-style7">&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td class="auto-style7">&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td class="auto-style7">&nbsp;</td>
        </tr>
    </table>
</asp:Content>

